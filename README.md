# Personal LLM Wiki

This repository is a local, Markdown-first personal knowledge system. It is designed for both human reading in Obsidian and agent operation through Codex or another coding agent.

The core idea is simple:

- `inbox/` receives low-friction notes and mobile drops.
- `sources/` stores original materials as read-only evidence.
- `wiki/` stores compiled knowledge pages that can be read, linked, queried, and maintained.
- `todo.md` plus `wiki/tasks/` manage personal todos. Lightweight one-off todos can stay in `todo.md`; serious tracked tasks live under `wiki/tasks/`.
- `system/` stores the operating rules, templates, evals, and the local `llm-wiki` skill.

Start here:

1. Drop new material into `inbox/`, or tell the agent `inbox` / `暂存` with the raw content.
2. Later, when you want knowledge organization, ask the agent: `处理 inbox，按 llm-wiki ingest 入库。`
3. Browse in Obsidian from `wiki/首页.md`.
4. Query through `wiki/index.md`, then deep-read linked pages.
5. Record concrete todos with `给我记一个 todo：...`; the agent applies the Task Granularity Gate, then updates `todo.md` and creates `wiki/tasks/` pages only for serious tracked tasks.
6. Run lint periodically to check links, sources, duplicate entities, stale pages, task consistency, and map pages.

Ingest is gated by `system/evals/ingest-checklist.md`: the agent should preserve sources, declare routing, check existing pages and aliases, follow domain schemas, fix citations, update links, and log the mutation.

After an inbox item is ingested, the preserved copy lives under `sources/`; the processed file should be removed from `inbox/` so the inbox only contains unprocessed drops plus `README.md` and templates.

Important command split:

- `inbox` / `暂存`: capture only; write to `inbox/` and stop.
- `todo` / `待办` / `给我记一个 todo`: task capture; write to the task system, not `inbox/`. Lightweight one-off todos stay in `todo.md`; serious tracked tasks create or update `wiki/tasks/`.
- `ingest` / `入库` / `沉淀到 wiki` / `处理 inbox`: archive to `sources/`, update `wiki/`, run checks, then clear processed inbox files.

Todo management is a first-class workflow. Canonical task records live under `wiki/tasks/`; root `todo.md` is the active dashboard. Direct task capture should not require Ingest. If a task comes from an ingested source, the task page should cite that source; if it comes from a direct command, use the direct user request as evidence. Do not create a blank task when the user only says "给我记一个 todo" without the action.

Task Granularity Gate: tiny one-off actions with no due date, no waiting/blocking state, no durable context, and no clear linked page should remain plain checkboxes in `todo.md`. Create `wiki/tasks/` pages only for serious tracked tasks: important, high priority, due/scheduled, multi-step, waiting/blocked, source-backed, review-worthy, report-worthy, or linked to a project, learning path, event, theme, source, or report. Multiple small todos with one shared goal should become a checklist under one parent task unless separate tracking is explicitly needed.

Diary classification is explicit: use `Type: diary`, `日记`, `diary` in the title/filename, or direct wording like "按日记处理". Ingest must not infer diary from emotion, routine, first-person writing, or "today" alone.

Inbox ingest aggregates before source creation. The agent should inventory pending fragments, group compatible fragments, then create or update sources. It should not blindly create one source per fragment. Do not merge different source types; diary and learning must stay separate unless explicitly instructed otherwise.

URL capture is also shallow: during `inbox`, save only the URL, capture time, and any user context. During explicit Ingest, the agent should create a bounded evidence package when possible, classify by content form and primary subject, then route it. A link may be a chat record, article, documentation page, media transcript, project note, Q&A, reflection, or other source; it must not be treated as tech learning just because it is a link. `sources/` should not store full linked content by default; keep metadata, AI core extraction, key supported claims, selected short excerpts or anchors, coverage, and fetch status. If the user marks a link or chat as `important`, `importent`, `重要`, or `非常重要`, preserve core information carefully; if it is very large, use a 500 Chinese character core extraction plus evidence anchors instead of full archival. Later Query should use the preserved local evidence package first and should not re-fetch live URLs unless explicitly asked or local evidence is missing.

Global Codex skill installed:

- Canonical local workflow spec: `system/skills/llm-wiki/SKILL.md`
- Installed skill source in this repo: `system/codex-skills/llm-wiki/SKILL.md`
- Installed skill path: `/root/.codex/skills/llm-wiki/SKILL.md`

The installed skill is a bootstrapper. It locates this wiki and then defers to the canonical local workflow spec plus nearby `AGENTS.md` files.

In a fresh Codex session, you should not need to paste a bootstrap prompt. Use natural requests such as:

```text
inbox
{paste content}
```

```text
处理 inbox，按 llm-wiki ingest 入库。
```

```text
把下面这段内容沉淀到我的 llm_wiki。
```

Or use short command-style prompts:

```text
/wiki-ingest
```

```text
/wiki-query 复习 Go defer
```

```text
/wiki-lint
```

```text
/wiki-migrate 迁移这批旧笔记，先做小样本
```

```text
/wiki-report 生成本周学习报告
```

```text
/wiki-todo 给我记一个 todo：明天复盘 C++ 模板显式实例化
```

`START_HERE.md` remains as a manual fallback if the skill is unavailable in a future environment.

The intended operating loop is:

```text
Capture to inbox -> Explicit ingest -> Preserve source -> Enrich -> Link -> Citation check -> Log -> Query -> Lint -> Refine
```

For daily incremental use, the lifecycle is:

```text
user input / cron -> Resolver -> inbox capture OR task capture/update OR query OR ingest -> enrichment -> citation fixing -> maintenance -> report
```

For historical setup or migration, the lifecycle is:

```text
setup / migration -> inventory -> mapping -> sample import -> validation -> full import -> rebuild -> health check -> migration report
```

This wiki currently contains the scaffolding and operating system. It does not yet contain your full personal notes. Add raw materials under `inbox/` or `sources/`, then explicitly run the ingest workflow when you want knowledge organization. Processed inbox files are cleared after they are archived under `sources/`.

For personal todo usage, start with `todo.md` or `wiki/tasks/任务.md`.

## Obsidian

For daily reading, open `/root/llm_wiki/wiki` as the vault. This is the cleaner Obsidian view.

Open `/root/llm_wiki` as the vault only when you want to browse sources and system rules too.

Use:

- `首页.md` as the human-facing start page when using the clean `wiki/` vault.
- `maps/地图.md` for 内容地图.
- `index.md` for agent routing and domain discovery.
- `log.md` for the log index; detailed operation logs live under `logs/YYYY-MM.md`.

The `wiki/` vault has `wiki/.obsidian/app.json` configured to hide `AGENTS.md`, `README.md`, `index.md`, `log.md`, and `logs/` from Obsidian's file explorer.

Recommended graph filters:

```text
-path:AGENTS -path:README -path:index -path:log -path:logs
```

See `system/obsidian.md` for the full browsing convention.
