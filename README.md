# LLM Wiki Framework

This repository is a local, Markdown-first wiki framework designed for human reading in Obsidian and agent operation through Codex or another coding agent.

The framework separates evidence, compiled knowledge, operational rules, and active tasks:

- `inbox/` receives low-friction notes and temporary drops.
- `sources/` stores original materials as evidence after explicit ingest.
- `wiki/` stores compiled knowledge pages that can be read, linked, queried, and maintained.
- `wiki/indexes/` stores retrieval indexes for fast lookup by entity, alias, source, or timeline.
- `todo.md` plus `wiki/tasks/` manage tracked work. Lightweight one-off todos can stay in `todo.md`; serious tracked tasks live under `wiki/tasks/`; source-worthy long-term task evidence lives under `sources/tasks/`.
- `system/` stores the thin local `llm-wiki` skill, resolver, workflows, policies, templates, evals, and schemas.

## Start Here

1. Capture new material into `inbox/`, or ask the agent to capture with `inbox` / `暂存`.
2. When the material should become durable knowledge, ask for explicit ingest: `处理 inbox，按 llm-wiki ingest 入库。`
3. Browse in Obsidian from `wiki/首页.md`.
4. Query through `wiki/index.md`, then deep-read linked pages.
5. Record concrete todos with `给我记一个 todo：...`; the agent applies the Task Granularity Gate, then updates `todo.md` and creates `wiki/tasks/` pages only for serious tracked tasks.
6. Run lint periodically to check links, sources, duplicate entities, stale pages, task consistency, and map pages.

## Core Workflows

- `system/skills/llm-wiki/SKILL.md`: thin bootstrap and router.
- `system/resolver.md`: intent and domain routing.
- `system/workflows/inbox.md`: capture only. Write to `inbox/` and stop.
- `system/workflows/task.md`: task capture/update. Write to the task system, not `inbox/`.
- `system/workflows/ingest.md`: archive to `sources/`, update `wiki/`, run checks, then clear processed inbox files.
- `system/workflows/query.md`: answer from existing compiled pages first, then sources when evidence is needed.
- `system/workflows/lint.md`: check structure, links, citations, schema, stale pages, duplicates, and task consistency.
- `system/workflows/migration.md`: import historical material through inventory, mapping, sample validation, full import, derived rebuild, health check, and migration report.
- `system/workflows/report.md`: generate briefings, reviews, and persisted reports.

Reusable hard rules live under `system/policies/`. Audit gates live under `system/evals/`.

## Source Discipline

Ingest is gated by `system/evals/ingest-checklist.md`. For user-provided non-task material, source preservation is a hard gate: the original payload must be saved verbatim in `sources/` before compiled `wiki/` pages are written.

After an inbox item is ingested, the preserved copy lives under `sources/`; the processed file should be removed from `inbox/` so the inbox only contains unprocessed drops plus `README.md` and templates.

URL-only submissions are not full original text. During ingest, preserve URL metadata, user context, fetch status, bounded extraction, selected evidence anchors, and coverage instead of storing full linked content by default.

## Task Discipline

Canonical task records live under `wiki/tasks/`; root `todo.md` is the active dashboard.

Task Granularity Gate:

- Tiny one-off actions with no due date, no waiting/blocking state, no durable context, and no clear linked page stay as plain checkboxes in `todo.md`.
- Serious tracked tasks create or update canonical pages under `wiki/tasks/`.
- Multiple small todos with one shared goal usually become a checklist under one parent task.

Task Evidence Gate:

- Long-term, recurring, habit-forming, important, review-worthy, or execution-history-bearing tasks should have source-backed evidence under `sources/tasks/`.
- Lightweight dashboard-only state stays only in the task system.

Task progress cache:

- Canonical task pages maintain `progress_state`, `progress_percent`, `progress_updated`, `progress_summary`, and `## Progress Snapshot`.
- `todo.md` and `wiki/tasks/任务.md` maintain aggregate progress snapshots.
- Task-progress queries should read snapshots first and deep-read task pages only when evidence or stale cache review is needed.

## Obsidian

For daily reading, open `wiki/` as the vault. Open the repository root when you also want to browse sources and system rules.

Use:

- `首页.md` as the human-facing start page when using the clean `wiki/` vault.
- `maps/地图.md` for navigation maps.
- `index.md` for agent routing and domain discovery.
- `log.md` for the log index; detailed operation logs live under `logs/YYYY-MM.md`.

Recommended graph filter:

```text
-path:AGENTS -path:README -path:index -path:log -path:logs
```

See `system/obsidian.md` for the full browsing convention.

## Empty Framework State

This branch is intended as a generic framework seed. It keeps operating rules, schemas, templates, README files, Obsidian configuration, task scaffolding, and logs, but removes real source material and compiled personal knowledge pages.
