# Start Here For New Agent Sessions

Use this file only as a fallback when the `llm-wiki` skill is not available.

Normally, the skill should bootstrap fresh sessions automatically when you mention `llm_wiki`, `inbox`, `暂存`, `todo`, `待办`, `处理 inbox`, `ingest`, `沉淀到 wiki`, or use shortcut prompts like `/wiki-inbox`, `/wiki-todo`, `/wiki-ingest`, `/wiki-query`, `/wiki-lint`, `/wiki-migrate`, or `/wiki-report`.

For Obsidian browsing or visual graph work, start from `wiki/首页.md` and `wiki/maps/地图.md`.

## Bootstrap Prompt

If the skill does not trigger, paste this into a new agent session opened at the repository root:

```text
You are operating an LLM-wiki framework repository.

Read first:
1. AGENTS.md
2. system/skills/llm-wiki/SKILL.md
3. wiki/index.md
4. system/resolver.md

Then read the selected workflow file:
- Inbox Capture: system/workflows/inbox.md
- Task Capture / Update: system/workflows/task.md
- Ingest: system/workflows/ingest.md
- Query: system/workflows/query.md
- Lint: system/workflows/lint.md
- Setup / Migration: system/workflows/migration.md
- Report: system/workflows/report.md

Read relevant policy files under system/policies/ instead of relying on SKILL.md for workflow details.

If editing files, also read the relevant checklist:
- Ingest or query-derived update: system/evals/ingest-checklist.md
- Task capture or task update: system/evals/task-checklist.md
- Lint or health check: system/evals/lint-checklist.md

If the request mentions Obsidian, graph, MOC, maps, or visual browsing, also read:
- system/obsidian.md
- wiki/首页.md
- wiki/maps/AGENTS.md

Choose the workflow by intent:
- Query: read-only answer from existing wiki knowledge.
- Inbox Capture: when the user says `inbox` / `暂存`, write only to `inbox/`; do not write `sources/` or compiled `wiki/`.
- Task Capture / Update: when the user says `todo` / `待办` / `给我记一个 todo`, or asks to complete, postpone, close, block, or update a task, use the task system directly.
- Ingest: only when the user explicitly says `ingest` / `入库` / `沉淀到 wiki` / `处理 inbox`, preserve sources first, then update compiled pages.
- Lint: check broken links, source references, schema, stale pages, duplicate entities, and task consistency.
- Setup / Migration: for historical imports, run inventory, mapping, sample import, sample validation, full import, derived rebuild, health check, and migration report.
- Report: produce briefing, pulse, task report, migration report, or health report.

For Ingest, source preservation is a hard gate. User-provided pasted text, uploaded/imported content, inbox captures, diary, learning notes, chat excerpts, reflections, project notes, and other durable material must be preserved verbatim in `sources/` before compiled `wiki/` pages are written.

For Task Capture / Update, apply the Task Granularity Gate before creating task pages and the Task Evidence Gate before creating `sources/tasks/` records.

For Query, do not mutate files.
```

## Common Commands

### Capture To Inbox Only

```text
inbox
{paste content}
```

### Ingest A Pasted Note

```text
把下面这段内容按 llm-wiki ingest 沉淀入库：

{paste content}
```

### Process Inbox

```text
处理 inbox，按 llm-wiki ingest 入库。先列出会处理哪些文件，再执行。
```

### Query

```text
基于这个 llm_wiki，回答：{question}
```

### Todo

```text
给我记一个 todo：{action}
```

### Lint

```text
检查 llm_wiki 健康状态，按 lint checklist 输出问题和修复建议。
```

### Migration

```text
我要把一批旧笔记迁移进 llm_wiki。请先做 inventory 和 mapping，然后选 5-10 个样本导入，不要直接全量导入。
```

## Drop Methods

1. Paste the note directly into the agent.
2. Save a Markdown file under `inbox/`.
3. Put raw historical files under `sources/` and ask for setup/migration.

The safest default is `inbox/` first, then explicit ingest.
