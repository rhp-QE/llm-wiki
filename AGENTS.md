# LLM Wiki Framework Operating Guide

This repository is an LLM-wiki framework instance. Treat it as a knowledge codebase: read the local rules, make small auditable changes, preserve sources, and keep the wiki useful to both the user and future agents.

## Always Read First

Before any wiki operation, read:

1. `system/skills/llm-wiki/SKILL.md`
2. `wiki/index.md`
3. `system/resolver.md`
4. The selected `system/workflows/*.md` file
5. The nearest `AGENTS.md` in the target directory when writing compiled pages

For broad tasks, also read:

- `system/lifecycle.md`
- `system/conventions.md`
- `system/schema.md`
- `system/maintenance.md`

For Obsidian browsing, graph, MOC, or visual navigation tasks, also read:

- `system/obsidian.md`
- `wiki/首页.md`
- `wiki/maps/AGENTS.md`

For mutating workflows, also read the relevant audit checklist:

- Ingest or query-derived update: `system/evals/ingest-checklist.md`
- Task capture or task update: `system/evals/task-checklist.md`
- Lint or health check: `system/evals/lint-checklist.md`
- Migration or batch import: `system/workflows/migration.md` plus `system/templates/migration-report.md`

For reusable hard rules, read the relevant policy under `system/policies/`:

- source preservation: `system/policies/source-preservation.md`
- URL evidence: `system/policies/url-evidence.md`
- task granularity: `system/policies/task-granularity.md`
- task evidence: `system/policies/task-evidence.md`
- ingest task impact: `system/policies/task-impact.md`
- learning progress: `system/policies/learning-progress.md`

## Core Model

The wiki has three layers:

- `sources/`: original evidence. Do not rewrite source content except to add metadata or clear archival notes. For user-provided material, `sources/` is the rebuild seed and must preserve the original payload verbatim after explicit Ingest.
- `inbox/`: temporary capture queue. `inbox` / `暂存` commands write only here and do not trigger source archival or wiki knowledge organization.
- `wiki/`: compiled knowledge. This is the durable middle layer consumed by people and agents.
- `system/`: rules, templates, evals, and workflows. Do not mix operational rules into content pages unless the nearest domain `AGENTS.md` says so.

## Instruction Architecture

Keep instruction layers separate:

- `system/skills/llm-wiki/SKILL.md`: thin bootstrap and router only.
- `system/resolver.md`: intent routing and domain routing only.
- `system/workflows/`: executable workflow steps.
- `system/policies/`: reusable hard rules shared across workflows.
- `system/evals/`: audit checklists.
- `system/schema.md`: shared types, statuses, and cross-domain fields.
- domain `AGENTS.md`: page shapes and local anti-patterns.

Do not paste full workflow bodies into `SKILL.md`. Do not duplicate policy bodies across workflow files unless a short reminder is needed.

## Main Workflows

Use the `llm-wiki` skill for:

- `system/workflows/inbox.md`: capture raw fragments to `inbox/` only.
- `system/workflows/task.md`: create, update, complete, schedule, or review tracked todos.
- `system/workflows/ingest.md`: convert new materials into durable pages, links, and logs.
- `system/workflows/query.md`: answer from wiki pages first, then sources if needed.
- `system/workflows/lint.md`: check health, links, citations, schema, duplicates, and stale pages.
- `system/workflows/migration.md`: import historical material through inventory, mapping, sample validation, full import, derived rebuild, health check, and migration report.
- `system/workflows/report.md`: generate briefings, pulse reports, task reports, and reviews.

## Write Rules

- Keep original material in `sources/` intact. `inbox/` is only a temporary capture queue; after an inbox item is ingested and archived under `sources/`, remove the processed inbox file so the queue is clear.
- Hard source-preservation rule: for any user-provided pasted text, uploaded file content, imported note, diary, learning note, chat excerpt, reflection, project note, or other durable material, explicit Ingest must create or update a `sources/` file containing the original payload verbatim before compiled `wiki/` pages are written. The `## Raw Material` block must preserve wording, line breaks, order, and fragment boundaries; do not summarize, translate, normalize, clean up, omit, or rewrite inside that raw block.
- Minimal frontmatter, archival notes, AI extraction, and compiled summaries may be added around the raw material, but they must be clearly separated from the verbatim raw payload.
- If multiple inbox fragments are grouped into one source, preserve each fragment verbatim with a fragment ID, capture timestamp when available, original inbox path, and original order.
- Direct lightweight todos or small task commands that are unrelated to durable personal growth, knowledge, projects, events, or sources are exempt from source archival; they stay in `todo.md` or the task system according to the Task Granularity Gate.
- Long-term task evidence is source-worthy when it records durable goals, routines, project/learning execution, meaningful check-ins, blockers, failures, reviews, or completion outcomes. Preserve those task events under `sources/tasks/` with raw user wording before or alongside updating compiled task pages. Do not archive lightweight task state, dashboard reordering, or mechanical status changes as sources.
- Maintain task progress caches for canonical tasks. Task pages should keep `progress_state`, `progress_percent`, `progress_updated`, `progress_summary`, and `## Progress Snapshot`; `todo.md` and `wiki/tasks/任务.md` should keep aggregate progress snapshots. Task-progress queries should read these snapshots first and deep-read task pages or linked domains only when the cache is missing, stale, ambiguous, or evidence is requested.
- Every Ingest must run a Task Impact Pass before finalizing compiled pages. Diary, learning, project, reflection, and event sources can imply task progress, completion, missed routines, blockers, or new subtasks; match those signals against `todo.md`, `wiki/tasks/任务.md`, and relevant task pages, update task status/progress caches when supported, and add `## Related Tasks` or equivalent task links on the compiled source-derived pages. If a source appears to affect a task but the mapping or outcome is ambiguous, do not guess; list it under `needs_user_review`.
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
