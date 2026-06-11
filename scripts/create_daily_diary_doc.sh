#!/usr/bin/env bash
set -Eeuo pipefail

export PATH="/root/.nvm/versions/node/v22.22.0/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:${PATH:-}"
export TZ="${TZ:-Asia/Shanghai}"

ROOT_DIR="${DIARY_AUTOMATION_ROOT:-/root/llm-wiki}"
STATE_DIR="$ROOT_DIR/automation"
LOG_DIR="$STATE_DIR/logs"
STATE_FILE="$STATE_DIR/daily_diary_docs.tsv"
LARK_CLI="${LARK_CLI_BIN:-/root/.nvm/versions/node/v22.22.0/bin/lark-cli}"
TEMPLATE_URL="${DIARY_TEMPLATE_URL:-https://my.feishu.cn/docx/HguGdrBg4ovSmvxdqIpcpT2UnDf}"
FOLDER_TOKEN="${DIARY_FOLDER_TOKEN:-}"
NOT_BEFORE="${DIARY_NOT_BEFORE:-}"
QUIET_IF_EXISTS="${DIARY_QUIET_IF_EXISTS:-0}"

mkdir -p "$LOG_DIR"
touch "$STATE_FILE"

log() {
  printf '[%s] %s\n' "$(date '+%F %T %z')" "$*"
}

json_get_doc_url() {
  node -e '
const fs = require("fs");
const input = fs.readFileSync(0, "utf8");
const start = input.indexOf("{");
if (start < 0) process.exit(2);
const data = JSON.parse(input.slice(start));
const url = data?.data?.document?.url || data?.document?.url || "";
if (!url) process.exit(3);
process.stdout.write(url);
'
}

today="$(date '+%F')"
if [[ -n "$NOT_BEFORE" ]]; then
  now_hm="$(date '+%H%M')"
  min_hm="${NOT_BEFORE//:/}"
  if (( 10#$now_hm < 10#$min_hm )); then
    log "Skip before $NOT_BEFORE"
    exit 0
  fi
fi

weekday_num="$(date '+%u')"
case "$weekday_num" in
  1) weekday="星期一" ;;
  2) weekday="星期二" ;;
  3) weekday="星期三" ;;
  4) weekday="星期四" ;;
  5) weekday="星期五" ;;
  6) weekday="星期六" ;;
  7) weekday="星期日" ;;
  *) weekday="" ;;
esac

if grep -Fq "${today}"$'\t' "$STATE_FILE"; then
  existing_url="$(awk -F '\t' -v day="$today" '$1 == day { print $2; exit }' "$STATE_FILE")"
  if [[ "$QUIET_IF_EXISTS" != "1" ]]; then
    log "Diary document already exists for $today: $existing_url"
  fi
  exit 0
fi

title="${today} 日记"
content=$(cat <<XML
<title>${title}</title>
<h1>日期与状态</h1>
<table>
  <tbody>
    <tr><td background-color="light-gray">日期</td><td>${today}（${weekday}）</td></tr>
    <tr><td background-color="light-gray">地点</td><td></td></tr>
    <tr><td background-color="light-gray">天气</td><td></td></tr>
    <tr><td background-color="light-gray">睡眠</td><td>时长：  质量：1 / 2 / 3 / 4 / 5</td></tr>
    <tr><td background-color="light-gray">精力</td><td>1 / 2 / 3 / 4 / 5</td></tr>
    <tr><td background-color="light-gray">心情</td><td>1 / 2 / 3 / 4 / 5；关键词：</td></tr>
  </tbody>
</table>

<hr/>

<h1>今日计划</h1>
<checkbox done="false">今日最重要事项 1：</checkbox>
<checkbox done="false">今日最重要事项 2：</checkbox>
<checkbox done="false">今日最重要事项 3：</checkbox>
<table>
  <thead><tr><th background-color="light-gray">时间段</th><th background-color="light-gray">安排</th><th background-color="light-gray">结果</th></tr></thead>
  <tbody>
    <tr><td>早上</td><td></td><td></td></tr>
    <tr><td>下午</td><td></td><td></td></tr>
    <tr><td>晚上</td><td></td><td></td></tr>
  </tbody>
</table>

<hr/>

<h1>日间记录</h1>
<grid>
  <column width-ratio="0.5">
    <h2>发生了什么</h2>
    <ul>
      <li>关键事件：</li>
      <li>遇到的人：</li>
      <li>重要对话：</li>
      <li>临时变化：</li>
    </ul>
  </column>
  <column width-ratio="0.5">
    <h2>我的反应</h2>
    <ul>
      <li>当时的感受：</li>
      <li>我做出的选择：</li>
      <li>背后的判断：</li>
      <li>可改进之处：</li>
    </ul>
  </column>
</grid>

<hr/>

<h1>复盘</h1>
<table>
  <thead><tr><th background-color="light-gray">问题</th><th background-color="light-gray">回答</th></tr></thead>
  <tbody>
    <tr><td>今天最值得保留的事情是什么？</td><td></td></tr>
    <tr><td>今天最消耗我的事情是什么？</td><td></td></tr>
    <tr><td>我学到了什么？</td><td></td></tr>
    <tr><td>有什么假设被验证或推翻？</td><td></td></tr>
    <tr><td>如果重来一次，我会怎么做？</td><td></td></tr>
  </tbody>
</table>

<hr/>

<h1>习惯与身体</h1>
<checkbox done="false">运动 / 拉伸</checkbox>
<checkbox done="false">阅读 / 学习</checkbox>
<checkbox done="false">深度工作</checkbox>
<checkbox done="false">整理环境</checkbox>
<checkbox done="false">早睡准备</checkbox>

<hr/>

<h1>关系与感恩</h1>
<ul>
  <li>今天感谢的人或事：</li>
  <li>我主动表达了什么：</li>
  <li>需要跟进的人：</li>
  <li>需要道歉、澄清或感谢的事：</li>
</ul>

<hr/>

<h1>明日准备</h1>
<checkbox done="false">明天最重要事项 1：</checkbox>
<checkbox done="false">明天最重要事项 2：</checkbox>
<checkbox done="false">明天最重要事项 3：</checkbox>

<hr/>

<h1>一句话收尾</h1>
<blockquote>今天的关键词：</blockquote>
<blockquote>给明天的自己：</blockquote>

<p>原始模板：<a href="${TEMPLATE_URL}">标准日记模板</a></p>
XML
)

create_args=(docs +create --api-version v2 --as user)
if [[ -n "$FOLDER_TOKEN" ]]; then
  create_args+=(--folder-token "$FOLDER_TOKEN")
  log "Creating diary document for $today in folder $FOLDER_TOKEN"
else
  log "Creating diary document for $today"
fi
create_args+=(--content "$content")

if ! output="$("$LARK_CLI" "${create_args[@]}" 2>&1)"; then
  log "Create failed"
  printf '%s\n' "$output"
  exit 1
fi

if ! url="$(printf '%s' "$output" | json_get_doc_url)"; then
  log "Create succeeded but URL parsing failed"
  printf '%s\n' "$output"
  exit 1
fi

printf '%s\t%s\t%s\n' "$today" "$url" "$(date '+%F %T %z')" >> "$STATE_FILE"
log "Created diary document: $url"
