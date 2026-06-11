# Start Here For New Codex Sessions

Use this file only as a fallback when the global `llm-wiki` Codex skill is not available.

Normally, the global skill at `/root/.codex/skills/llm-wiki/SKILL.md` should bootstrap fresh sessions automatically when you mention `llm_wiki`, `处理 inbox`, `ingest`, `沉淀到 wiki`, or use shortcut prompts like `/wiki-ingest`, `/wiki-query`, `/wiki-lint`, `/wiki-migrate`, or `/wiki-report`.

For Obsidian browsing or visual graph work, start from `wiki/home.md` and `wiki/maps/maps.md`.

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
- wiki/home.md
- wiki/maps/AGENTS.md

之后根据我的请求选择：
- Query：只读消费已有知识，不改文件
- Ingest：处理 inbox 或我贴给你的新材料，沉淀到 sources/ 和 wiki/
- Lint：检查断链、孤儿页、引用、重复实体、stale 信息
- Setup / Migration：迁移历史资料，必须先 inventory、mapping、小样本导入、样本验证，再全量导入
- Report：生成 briefing、pulse、task report、migration report 等产物

除非我明确要求，否则不要跳过 source 保存、路由声明、已有页面/aliases 检查、引用修复、维护检查和当月 `wiki/logs/YYYY-MM.md` 记录。
```

## Common Commands To Tell Codex

### Ingest a pasted note

```text
把下面这段内容按 llm-wiki ingest 沉淀入库：

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

The safest default is `inbox/` first, then ask Codex to ingest.
