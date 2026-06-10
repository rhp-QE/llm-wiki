# LLM Wiki Operating Guide

This repository is a personal LLM-wiki. Treat it as a knowledge codebase: read the local rules, make small auditable changes, preserve sources, and keep the wiki useful to both the user and future agents.

## Always Read First

Before any wiki operation, read:

1. `system/skills/llm-wiki/SKILL.md`
2. `wiki/index.md`
3. The nearest `AGENTS.md` in the target directory

For broad tasks, also read:

- `system/lifecycle.md`
- `system/conventions.md`
- `system/schema.md`
- `system/resolver.md`
- `system/maintenance.md`

For Obsidian browsing, graph, MOC, or visual navigation tasks, also read:

- `system/obsidian.md`
- `wiki/首页.md`
- `wiki/maps/AGENTS.md`

For mutating workflows, also read the relevant audit checklist:

- Ingest or query-derived update: `system/evals/ingest-checklist.md`
- Task capture or task update: `system/evals/task-checklist.md`
- Lint or health check: `system/evals/lint-checklist.md`
- Migration or batch import: `system/lifecycle.md` plus `system/templates/migration-report.md`

## Core Model

The wiki has three layers:

- `sources/`: original evidence. Do not rewrite source content except to add metadata or clear archival notes. For user-provided material, `sources/` is the rebuild seed and must preserve the original payload verbatim after explicit Ingest.
- `inbox/`: temporary capture queue. `inbox` / `暂存` commands write only here and do not trigger source archival or wiki knowledge organization.
- `wiki/`: compiled knowledge. This is the durable middle layer consumed by people and agents.
- `system/`: rules, templates, evals, and workflows. Do not mix operational rules into content pages unless the nearest domain `AGENTS.md` says so.

## Main Workflows

Use the `llm-wiki` skill for:

- `Ingest`: convert new materials into durable pages, links, and logs.
- `Inbox Capture`: save raw fragments to `inbox/` only; do not create `sources/` or organize `wiki/` until explicit Ingest.
- `Task Capture / Update`: create, update, complete, schedule, or review personal todos when the user says `todo`, `待办`, or asks to record a todo. Apply the Task Granularity Gate before creating canonical task pages, then apply the Task Evidence Gate for long-term/source-worthy task history.
- `Query`: answer from wiki pages first, then sources if needed.
- `Lint`: check health, links, citations, schema, duplicates, and stale pages.
- `Setup / Migration`: import historical material through inventory, mapping, sample validation, full import, derived rebuild, health check, and migration report.

## Write Rules

- Keep original material in `sources/` intact. `inbox/` is only a temporary capture queue; after an inbox item is ingested and archived under `sources/`, remove the processed inbox file so the queue is clear.
- Hard source-preservation rule: for any user-provided pasted text, uploaded file content, imported note, diary, learning note, chat excerpt, reflection, project note, or other durable material, explicit Ingest must create or update a `sources/` file containing the original payload verbatim before compiled `wiki/` pages are written. The `## Raw Material` block must preserve wording, line breaks, order, and fragment boundaries; do not summarize, translate, normalize, clean up, omit, or rewrite inside that raw block.
- Minimal frontmatter, archival notes, AI extraction, and compiled summaries may be added around the raw material, but they must be clearly separated from the verbatim raw payload.
- If multiple inbox fragments are grouped into one source, preserve each fragment verbatim with a fragment ID, capture timestamp when available, original inbox path, and original order.
- Direct lightweight todos or small task commands that are unrelated to durable personal growth, knowledge, projects, events, or sources are exempt from source archival; they stay in `todo.md` or the task system according to the Task Granularity Gate.
- Long-term task evidence is source-worthy when it records durable goals, routines, project/learning execution, meaningful check-ins, blockers, failures, reviews, or completion outcomes. Preserve those task events under `sources/tasks/` with raw user wording before or alongside updating compiled task pages. Do not archive lightweight task state, dashboard reordering, or mechanical status changes as sources.
- URL-only submissions are not the same as user-provided full text. Preserve the URL, capture time, and user context first; during Ingest, create the bounded URL evidence package unless the linked content is short, user-provided, explicitly requested for full archival, or otherwise allowed by the URL policy.
- Treat `inbox` / `暂存` as capture-only commands. Explicit `ingest`, `入库`, `沉淀到 wiki`, or `处理 inbox` is required before writing `sources/` or compiled `wiki/` pages.
- Treat `todo` / `待办` / `给我记一个 todo` as task capture commands. They write to the task system, not to `inbox/`; use the Task Granularity Gate to decide whether the item becomes a canonical `wiki/tasks/` page, a lightweight `todo.md` checkbox, a subtask on an existing task, or no task. For canonical tasks and task updates, use the Task Evidence Gate to decide whether a `sources/tasks/` source record is required.
- Every non-trivial compiled claim should point to a source, log entry, or clearly marked inference.
- Prefer `[[wikilink]]` style internal links in wiki content.
- Update `wiki/index.md` when adding a new major page or domain.
- Update `wiki/首页.md` or `wiki/maps/` when a new page changes Obsidian navigation.
- Update the active monthly log under `wiki/logs/YYYY-MM.md` after each meaningful ingest, task capture/update, query-derived update, lint repair, report, migration step, or schema change.
- Update `wiki/log.md` only as the log index when a new month starts or recent summary changes.
- Avoid creating a new directory or page type before checking whether an existing domain owns it.

## Workflow Gates

Before mutating files:

- Use `system/resolver.md` to declare the workflow and target domains.
- Read each nearest target-domain `AGENTS.md`.
- Check existing pages and aliases before creating new pages.
- For complex or multi-domain ingest, sketch the route with `system/templates/ingest-plan.md`.

After mutating files:

- Run the relevant checklist from `system/evals/`.
- Confirm source paths and wikilinks introduced by the change.
- Update the active monthly log under `wiki/logs/YYYY-MM.md`.
- End with the auditable output fields required by the active workflow.

## Agent Behavior

- Do not invent facts about the user. If a page needs information that is not in sources, mark it as `Needs evidence`.
- When processing many files, do a small sample first and report counts before bulk work.
- Do not split the same person, concept, or event across multiple pages because of aliases. Check existing aliases first.
- Do not overfit the wiki to a single tool. Markdown and local files are the source of truth.

## Output Standard

After mutating the wiki, report:

- Workflow
- Wiki root
- Inputs
- Files read
- Files created
- Files updated
- Sources created or used
- Pages created
- Pages updated
- Links or aliases added
- Questions added
- Citations fixed
- Maintenance done
- Open questions
- Needs user review
- Suggested next action
