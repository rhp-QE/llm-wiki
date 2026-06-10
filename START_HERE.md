# Start Here For New Codex Sessions

Use this file only as a fallback when the global `llm-wiki` Codex skill is not available.

Normally, the global skill at `/root/.codex/skills/llm-wiki/SKILL.md` should bootstrap fresh sessions automatically when you mention `llm_wiki`, `inbox`, `暂存`, `todo`, `待办`, `处理 inbox`, `ingest`, `沉淀到 wiki`, or use shortcut prompts like `/wiki-inbox`, `/wiki-todo`, `/wiki-ingest`, `/wiki-query`, `/wiki-lint`, `/wiki-migrate`, or `/wiki-report`.

For Obsidian browsing or visual graph work, start from `wiki/首页.md` and `wiki/maps/地图.md`.

## New Session Bootstrap Prompt

If the skill does not trigger, copy this into a new Codex session opened at `/root/llm_wiki`:

```text
你现在在 /root/llm_wiki，这是我的个人 LLM-wiki 知识库。

请先阅读：
1. AGENTS.md
2. system/skills/llm-wiki/SKILL.md
3. system/lifecycle.md
4. system/resolver.md
5. wiki/index.md

如果要修改文件，还要阅读相关 checklist：
- Ingest 或 query-derived update：system/evals/ingest-checklist.md
- Lint：system/evals/lint-checklist.md

如果我提到 Obsidian、图谱、MOC、地图页或可视化浏览，还要阅读：
- system/obsidian.md
- wiki/首页.md
- wiki/maps/AGENTS.md

之后根据我的请求选择：
- Query：只读消费已有知识，不改文件
- Inbox Capture：当我说 `inbox` / `暂存`，或只想先记录时，只写入 `inbox/`，不要写 `sources/`，不要整理 `wiki/`
- Task Capture / Update：当我说 `todo` / `待办` / `给我记一个 todo`，或要求完成、推迟、关闭、阻塞、更新任务时，直接进入任务系统；不要走 `inbox`，也不需要 `ingest`。先应用 Task Granularity Gate：微小、一次性、无截止日期、无等待/阻塞、无长期上下文、无明确关联页面的 action，只放在根目录 `todo.md` 作为轻量 checkbox；重要、高优先级、有 due/scheduled、多步、等待/阻塞、有来源证据、需要复盘/报告、或关联项目/学习/事件/主题/source 的严肃任务，才创建或更新 `wiki/tasks/` canonical task page；同一目标下多个小 todo 应合并为一个父任务的 checklist，除非我明确要求分开追踪。如果我只说“给我记一个 todo”但没有任务内容，要追问，不要创建空任务。任务必须有状态、优先级、area、source；不要臆造 due date / priority / linked pages。相对日期要落成绝对日期。然后应用 Task Evidence Gate：长期/持续/周期性/routine/habit/重要/需要复盘的任务，或记录里程碑、实质进展、反复练习、未完成原因、阻塞、失败、放弃原因、完成结果、周/月复盘的任务更新，要在 `sources/tasks/` 保存原始用户表述并从任务页 `source_records` 链回；轻量 todo、dashboard 排序、纯状态变更、无上下文优先级调整、没有用户观察的日常 done/not done 不进 `sources/`。
- Ingest：只有我明确说 `ingest` / `入库` / `沉淀到 wiki` / `处理 inbox` 时，才沉淀到 sources/ 和 wiki/；如果来源是 inbox，入库验证完成后清空已处理的 inbox 文件
- Source 原文保真是硬约束：对于我直接粘贴、上传、导入、写到 inbox 的非小 todo 材料，Ingest 必须先在 `sources/` 的 `## Raw Material` 中原封不动保存原始 payload，再写 compiled `wiki/` 页面。必须保留措辞、换行、顺序和片段边界；不能在 raw block 内总结、翻译、规范化、清理、删减或改写。和个人成长/知识沉淀无关的小 task / 小 todo 不需要进 `sources/`，按 Task Granularity Gate 留在任务系统；但长期任务和有复盘价值的执行历史要按 Task Evidence Gate 进入 `sources/tasks/`。
- 日记分类必须显式：只有 `Type: diary`、`source_type: diary`、标题/文件名含 `diary` / `日记`，或我明确说按日记处理时，才能归为日记。不要根据情绪、作息、第一人称或“今天”推断成日记。
- Ingest 处理 inbox 时必须先归纳聚合片段，不要无脑一个片段一个 source；只合并同类型、同自然日期或主题、来源语境兼容的片段。不要把日记和 learning 合并。
- URL / 链接投递在 Inbox Capture 阶段只保存 URL、时间和用户上下文，不抓取、不总结、不分类、不入库。显式 Ingest 时才尝试抓取或保存链接证据包；URL 只是 delivery/origin，不是 source_type。必须根据内容形态和 primary subject 判断是 article、chat、media、learning、note、project、qa、reflection 等，不能无脑归为 tech learning。纯 URL 不等于我已经提供了全文；`sources/` 不默认保存链接全文，应保存元数据、AI 核心提炼、关键 claims、少量可追溯摘录/anchor、coverage 和 fetch_status；只有短内容、特别重要且不庞大、别处不可得、用户提供或我明确要求时才保存全文。若我用 `important` / `importent` / `重要` / `非常重要` 标记链接或聊天，Ingest 要更认真保留核心信息；但如果链接下或抓取到的内容非常庞大，兜底策略仍然不要保存全文，只保存 500 字以内中文核心提炼加证据 anchor。如果我粘贴/上传了全文本身，则按 source 原文保真硬约束保存。后续 Query 默认使用本地 evidence package，不要每次实时重抓链接，除非我明确要求刷新/重读链接或本地证据缺失。
- Lint：检查断链、孤儿页、引用、重复实体、stale 信息
- Setup / Migration：迁移历史资料，必须先 inventory、mapping、小样本导入、样本验证，再全量导入
- Report：生成 briefing、pulse、task report、migration report 等产物

对于 Ingest，不要跳过 source 保存、路由声明、已有页面/aliases 检查、引用修复、维护检查和当月 `wiki/logs/YYYY-MM.md` 记录。对于 Task Capture / Update，要读取 `wiki/tasks/AGENTS.md` 和 `system/evals/task-checklist.md`。对于 Inbox Capture，只写 `inbox/`。
```

## Common Commands To Tell Codex

### Ingest a pasted note

```text
把下面这段内容按 llm-wiki ingest 沉淀入库：

{paste content}
```

### Capture to inbox only

```text
inbox
{paste content}
```

### Process inbox

```text
处理 inbox，按 llm-wiki ingest 入库。先列出会处理哪些文件，再执行。
```

### Query

```text
基于我的 llm_wiki，回答：{question}
```

### Todo

```text
给我记一个 todo：{action}
```

```text
/wiki-todo 完成：{task}
```

### Lint

```text
检查我的 llm_wiki 健康状态，按 lint checklist 输出问题和修复建议。
```

### Migration

```text
我要把一批旧笔记迁移进 llm_wiki。请先做 inventory 和 mapping，然后选 5-10 个样本导入，不要直接全量导入。
```

## Drop Methods

You can provide new material in three ways:

1. Paste the note directly into Codex.
2. Save a Markdown file under `inbox/`.
3. Put raw historical files under `sources/` and ask for setup/migration.

The safest default is `inbox/` first, then ask Codex to ingest. The `inbox` command is capture-only. After explicit ingest, the raw archive should live in `sources/`, and the processed inbox file should be removed.
