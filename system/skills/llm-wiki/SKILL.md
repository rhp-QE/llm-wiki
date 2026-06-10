---
name: llm-wiki
version: 1.1.0
description: >
  Operate the user's local personal LLM-wiki. Use this whenever the user asks to
  ingest notes, process inbox files, summarize or query the personal wiki, update
  knowledge pages, manage personal todos, lint links/sources/schema, build a
  personal knowledge base, or turn scattered notes into durable Markdown pages.
  Also use this for setup, migration, sample import, full import, health checks,
  and wiki reports. This skill owns Resolver, Inbox Capture, Task Capture /
  Update, Query, Ingest, Enrichment, Citation Fixing, Maintenance, Report, and
  Setup/Migration workflows for this
  repository.
triggers:
  - "inbox"
  - "暂存"
  - "todo"
  - "待办"
  - "给我记一个 todo"
  - "记一个待办"
  - "处理 inbox"
  - "ingest"
  - "入库"
  - "沉淀到 wiki"
  - "查询我的 wiki"
  - "检查 wiki"
  - "lint"
  - "迁移旧笔记"
  - "初始化知识库"
  - "生成 wiki 报告"
shortcuts:
  - "/wiki-todo"
  - "/wiki-ingest"
  - "/wiki-query"
  - "/wiki-lint"
  - "/wiki-migrate"
  - "/wiki-report"
tools:
  - read_file
  - search
  - edit_file
  - filesystem
  - shell
mutating: true
writes_pages: true
writes_to:
  - inbox/
  - sources/
  - wiki/
  - system/
  - todo.md
---

# LLM Wiki Skill

This skill operates a Markdown-first personal knowledge system inspired by LLM-wiki practice: source material is preserved, compiled knowledge is written once and reused many times, and agents consume `index.md` plus linked pages through progressive loading.

## Contract

When using this skill:

- Preserve raw material in `sources/` only after explicit Ingest. For user-provided material, this is a hard verbatim-preservation requirement: the source must contain the original payload exactly as provided before compiled `wiki/` pages are written. `inbox/` is temporary capture only; inbox capture must not create `sources/` or compiled `wiki/` pages. After an inbox file is explicitly ingested and archived under `sources/`, remove the processed inbox file.
- Put compiled knowledge in `wiki/`.
- Follow `system/lifecycle.md` to distinguish incremental work from stock setup/migration.
- Use `system/schema.md` as the cross-domain type and status registry.
- Read the relevant `AGENTS.md` before editing a domain.
- Maintain links, aliases, source references, and the active monthly log under `wiki/logs/YYYY-MM.md`.
- Maintain `wiki/首页.md` and `wiki/maps/` when changes affect Obsidian navigation.
- Prefer a small, reviewable update over a broad rewrite.
- Use workflow gates and audit checklists for mutating work.
- For task work, apply both the Task Granularity Gate and the Task Evidence Gate: serious tracked tasks live in `wiki/tasks/`, while source-worthy long-term task goals and execution history must also be preserved under `sources/tasks/`.
- For bulk historical material, run inventory, mapping, sample import, validation, full import, derived rebuild, health check, and migration report. Do not skip the sample validation step.

## File Boundaries

| Area | Role | Mutation policy |
| --- | --- | --- |
| `inbox/` | low-friction capture queue | must be cleared after ingest once the raw material is archived under `sources/` |
| `sources/` | raw evidence | preserve user-provided raw payload verbatim; add metadata only outside the raw block |
| `wiki/` | compiled knowledge | update through domain schema |
| `system/` | rules, templates, evals | update only for process or schema changes |

## Workflow Gates

Before mutating files:

1. Use `system/resolver.md` to classify the workflow and target domains.
2. Read `system/schema.md` for allowed page types, statuses, and link rules.
3. Read the nearest target-domain `AGENTS.md` files.
4. Check existing pages and aliases before creating durable pages.
5. For complex or multi-domain ingest, sketch the route with `system/templates/ingest-plan.md`.

After mutating files:

1. Run the relevant checklist from `system/evals/`.
2. Confirm introduced source paths and wikilinks are traceable.
3. Update the active monthly log under `wiki/logs/YYYY-MM.md`.
4. Return the workflow's auditable output fields.

## Phases

This skill has two lifecycle modes.

### Incremental Mode

Use for daily operation.

```text
user input / cron trigger
  -> Resolver
  -> inbox capture OR task capture/update OR query OR ingest
  -> enrichment
  -> citation fixing
  -> maintenance
  -> report
```

### Stock Mode

Use for initialization, migration, or large historical import.

```text
setup / migration
  -> inventory sources
  -> design mapping
  -> sample import
  -> sample validation
  -> full import
  -> rebuild derived structures
  -> health check
  -> migration report
```

## Workflow: Resolver

Use before choosing a workflow.

### Resolver Steps

1. Read `system/resolver.md`.
2. Determine whether the request is read-only, mutating, report-only, maintenance, or migration.
3. If read-only, use Query and do not mutate files.
4. If the user explicitly asks to create, update, complete, schedule, drop, block, or review a todo, use Task Capture / Update and apply the Task Granularity Gate before creating a canonical task page.
5. If new material is present without explicit Ingest wording, use Inbox Capture.
6. If many historical files or source systems are involved, use Setup/Migration.
7. If scheduled, decide whether the output should be a report, an ingest, a lint, a task review, or a skipped run.

Override: if the user invokes `inbox`, `暂存`, or asks to put content in the temporary queue, use Inbox Capture. Do not infer Ingest from the presence of new material. Only explicit `ingest`, `入库`, `沉淀到 wiki`, `处理 inbox`, or equivalent wording should write `sources/` or organize compiled `wiki/` knowledge.

Override: if the user invokes `todo`, `待办`, "给我记一个 todo", "记一个待办", or asks to complete, schedule, drop, block, or update a task, use Task Capture / Update. Do not route direct task capture through Inbox Capture or Ingest. Use the Task Granularity Gate to decide whether the item is a lightweight dashboard checkbox, a canonical task page, a subtask/checklist item, or not a task. Then use the Task Evidence Gate to decide whether a canonical task or task update also needs a `sources/tasks/` evidence record.

## Workflow: Inbox Capture

Use when the user invokes `inbox`, `暂存`, asks to save material for later, or provides raw material without explicitly requesting Ingest.

### Rules

- Write only to `inbox/`.
- Do not create or update `sources/`.
- Do not create or update compiled `wiki/` pages.
- Do not run enrichment, citation fixing, or domain routing.
- For URL-only input, preserve the URL, capture time, and user-provided context only; do not fetch or summarize the URL during Inbox Capture.
- Do not update the monthly log for routine capture; the later Ingest operation logs the archived source and wiki updates.
- Preserve the user's raw wording with minimal metadata such as capture date, title, and source URL when available.
- Leave the captured file in `inbox/` until the user explicitly calls Ingest.

## Workflow: Task Capture / Update

Use when the user asks to create, remember, list, update, complete, drop, block, wait, or schedule a todo.

### Rules

- Read `wiki/tasks/AGENTS.md` and `system/evals/task-checklist.md`.
- Direct todo commands write to the task system and update root `todo.md` when the active dashboard changes.
- Apply the Task Granularity Gate before creating or updating a canonical `wiki/tasks/` page.
- Do not create `inbox/` files for direct todo capture.
- Do not create `sources/` files for lightweight direct todos. Create or update `sources/tasks/` only when the Task Evidence Gate says a direct task command or update is source-worthy long-term evidence.
- Create task pages under `wiki/tasks/{YYYY-MM-DD}-{slug}.md` using `system/templates/task.md` only for items that pass the canonical-task threshold.
- Use `source: direct user request YYYY-MM-DD` for direct task commands, or a source path when the task is extracted during Ingest.
- A task must be actionable. If the user provides no task text, ask for the missing action instead of creating a placeholder.
- Do not invent due date, priority, area, or linked pages.
- Resolve relative dates such as today, tomorrow, or next week to absolute dates at capture time.
- Keep `todo.md` as the active dashboard; canonical details live in task pages.
- Task state changes must update both the task page and `todo.md`.
- Task state changes update `sources/tasks/` only when the change includes durable source-worthy context, such as a milestone, check-in, blocker, failure, review, or completion outcome.
- If a similar open task already exists, update it or ask before creating a duplicate.

### Task Granularity Gate

Classify every candidate todo before writing:

- `lightweight_todo`: a small, one-step, one-off action with no explicit due date, no waiting/blocking state, no durable context, and no clear link to a project, learning path, event, theme, source, or report. Put it in `todo.md` as a plain checkbox. Do not create a `wiki/tasks/` page.
- `canonical_task`: a serious tracked todo. Create or update a task page when any of these are true: the user marks it important or asks to track it seriously; it has a due/scheduled date; it may become waiting/blocked; it is multi-step; it needs history, context, or evidence; it links to a project, learning path, event, theme, source, or report; it is high priority; it is expected to appear in future reviews or task reports.
- `subtask`: a small action that belongs to an existing or newly created canonical task. Add it to that task's `## Checklist` or `## Next Step` instead of creating a separate page. Keep one dashboard item for the parent task.
- `not_task`: a vague idea, open question, saved link, reference, or learning backlog item without a concrete action. Do not create a task unless the user asks for a tracked action.

When multiple todo items share the same goal and context, prefer one canonical task with a checklist over many separate task pages. If the user explicitly asks for every item to be tracked separately, or the items have different owners, deadlines, blocking states, or contexts, create separate canonical tasks.

If classification is ambiguous and the wrong granularity would create clutter or lose important tracking, ask a short clarification. Otherwise prefer the lighter representation and note the assumption in the response.

### Task Evidence Gate

Run this gate for every canonical task and every update to an existing canonical task.

Create or update `sources/tasks/` when the task or update is source-worthy:

- The user explicitly says it is long-term, ongoing, recurring, a routine, a habit, important, or review-worthy.
- It records durable life, health, career, relationship, project, or learning evidence.
- It records a meaningful execution event: milestone reached, substantial progress, repeated practice, missed routine with reason, blocker discovered, unblock condition resolved, failure, abandonment reason, completion outcome, or weekly/monthly review.
- It is linked to a project, learning path, theme, event, report, or source whose future reconstruction depends on execution history.
- The user asks to `入库`, `沉淀`, `记录到 wiki`, `记为证据`, or otherwise preserve the task update as evidence.

Do not create task evidence sources for lightweight one-off todos, dashboard reordering, simple status moves, typo fixes, priority changes without context, or daily done/not-done checkboxes with no user-provided observation.

For repeated check-ins on one long-term task, group compatible updates by task and month when possible. Preserve each raw user update as a fragment with timestamp, origin, and original wording.

### Task Output

Return:

```text
workflow:
wiki_root:
inputs:
files_read:
files_created:
files_updated:
tasks_created:
tasks_updated:
lightweight_todos_created:
subtasks_added:
dashboard_updated:
sources_created_or_used:
links_added:
maintenance_done:
open_questions:
needs_user_review:
next_actions:
```

## Workflow: Ingest

Use only when the user explicitly asks to process `inbox/`, says `ingest`, "沉淀", "入库", or "记录到 wiki".

### Phases

1. **Intake**
   - Identify input files or pasted content.
   - For user-provided pasted text, uploaded file content, imported notes, diary, learning notes, chat excerpts, reflections, project notes, and other durable personal material, create or update a `sources/` record with the exact original payload before writing compiled `wiki/` pages. Preserve wording, line breaks, order, and fragment boundaries in `## Raw Material`; do not summarize, translate, normalize, clean up, omit, or rewrite inside that raw block.
   - If the original payload cannot be preserved, stop the Ingest or keep the material in `inbox/` / `sources/notes/` with `status: needs-review`; do not proceed as if source preservation succeeded.
   - Direct lightweight todos or small task commands unrelated to durable personal growth, knowledge, projects, events, or sources are exempt from source archival and should stay in the task system according to the Task Granularity Gate. Source-worthy long-term task evidence is not exempt; preserve it under `sources/tasks/` when the Task Evidence Gate fires.
   - Determine source type: diary, learning, article, book, chat, media, note, idea, project, qa, reflection, task_evidence, or other.
   - For skill-tree and learning-progress material, classify `learning_intent`, `learning_state`, `counts_as_progress`, `priority`, and `progress_evidence` before updating learning paths or tech mastery status. This applies only to skill/learning domains such as `sources/learning/`, `wiki/learning/`, and `wiki/tech/`; do not apply it to objective facts such as diary events, people, relationships, or factual life notes unless they explicitly record learning or practice.
   - Saved-only links, future-reference material, not-started topics, and skimmed material should not count as learning progress. They may be preserved as sources or added to a learning path's `Saved For Later`, but must not update `Recently Learned` or raise tech status to `understood`, `applied`, or `validated`.
   - For URL-backed material, treat the URL as `delivery: url`, not as the source type. A URL-only submission is not user-provided full text. During Ingest, create a bounded local evidence package before writing compiled wiki pages when possible: metadata, user context, AI core extraction, key supported claims, selected short excerpts or anchors, coverage, and fetch status. Do not store full linked content by default.
   - Treat `important`, `importent`, `非常重要`, `重要`, and equivalent wording as importance markers. Important material should preserve core information carefully, especially chat records, decisions, reusable answers, and personal insights.
   - Store full linked content only when it is short, uniquely important and not huge, unavailable elsewhere, user-provided, or explicitly requested by the user. If important linked or fetched content is very large, do not store the full linked content by default; store a core extraction capped at 500 Chinese characters plus selected evidence anchors. If the user pasted or uploaded the full content itself, preserve that user-provided payload verbatim even if later AI extraction is bounded. If fetching fails, preserve the URL and user context with `fetch_status: failed` or `status: needs-review`.
   - Classify URL-backed material by content form and primary subject. A link may be a chat record, article, documentation page, media transcript, project note, Q&A, reflection, or other source; do not route it to `tech` or `learning` merely because it is a link.
   - Classify as `diary` only with an explicit `diary` / `日记` marker such as `Type: diary`, `source_type: diary`, a diary-marked title/filename, or direct user wording. Do not infer diary from emotions, daily routine, first-person style, or "today" alone.
   - If source type is unclear, preserve as `source_type: note` with `status: needs-review`; do not route ambiguous material to `sources/diary/`.
   - For `inbox/` inputs, inventory all pending fragments first, then group compatible fragments before creating sources. Do not create one source per fragment by default.
   - Group only within compatible boundaries: same explicit source type, same natural date or topic, and compatible origin/context. Preserve each original fragment inside the grouped source with fragment IDs, timestamps, and original inbox paths.
   - Never merge different source types just because they arrived together. In particular, do not merge `diary` and `learning`; do not merge diary fragments with articles, chats, projects, or technical notes.
   - If grouping is ambiguous, keep separate source groups or use `source_type: note` with `status: needs-review`; do not guess a broad merge.
   - Preserve the raw material under `sources/` unless it already lives there; for user-provided material this means verbatim preservation, not a paraphrase or extraction.
   - For `inbox/` inputs, archive the raw material into `sources/` first, then remove the processed inbox file after citation and maintenance checks pass.
   - Read `system/evals/ingest-checklist.md`.

2. **Route**
   - Read `system/resolver.md`.
   - Choose target domains.
   - Read nearest domain `AGENTS.md`.
   - For complex or multi-domain ingest, prepare an ingest plan using `system/templates/ingest-plan.md`.

3. **Enrichment**
   - Pull durable facts, questions, examples, relationships, and open loops.
   - Identify aliases and existing pages before creating new pages.
   - Extract entities, relationships, timeline entries, durable Q&A, concepts, themes, and review tasks.

4. **Write**
   - Create or update compiled pages using templates.
   - Add `[[wikilink]]` relationships.
   - Update indexes and learning paths when relevant. For learning paths, route `future-reference`, `not-started`, and `saved` material to `Saved For Later`; route only real study, practice, application, or validation into `Recently Learned`, `Weak Spots`, `Review Queue`, or `Practice Tasks`.
   - Apply the Task Granularity Gate before promoting extracted action items. Promote only serious tracked todos to `wiki/tasks/`; keep micro-actions as lightweight dashboard items or subtasks when appropriate.
   - Prefer updating existing pages over creating duplicate pages.

5. **Citation fixing**
   - Ensure source paths exist.
   - Mark claims as sourced, user-stated, inferred, or needing evidence.
   - Normalize source references enough that future agents can trace them.

6. **Maintenance**
   - Check links, frontmatter, aliases, duplicates, orphan pages, and stale status.
   - Update indexes or derived pages when new durable knowledge was added.
   - Complete the ingest checklist and list any failed or not-applicable items.

7. **Report**
   - Summarize what was ingested, enriched, fixed, and left open.
   - Update the active monthly log under `wiki/logs/YYYY-MM.md`.

### Ingest Output

Return:

```text
workflow:
wiki_root:
inputs:
files_read:
files_created:
files_updated:
sources_created_or_used:
pages_created:
pages_updated:
links_added:
questions_added:
citations_fixed:
maintenance_done:
open_questions:
needs_user_review:
next_actions:
```

## Workflow: Query

Use when the user asks to consume the wiki.

### Phases

1. Read `wiki/index.md`.
2. Select the smallest relevant domain set.
3. Read compiled pages first.
4. Read local `sources/` only when evidence, quotes, or ambiguity matter.
5. For URL-backed sources, use the locally preserved source snapshot first. Do not re-fetch the live URL during ordinary Query unless the user explicitly asks to refresh/re-read the link, or the local source is missing and the answer requires the original content.
6. Answer with links or file references where useful.
7. If the answer reveals missing structure, suggest an ingest or lint follow-up.

### Query Output

Prefer a concise answer that says:

- What the wiki currently says
- What evidence supports it
- What is uncertain or missing
- Which pages were consulted

## Workflow: Lint

Use when checking health, after batch ingest, or before relying on the wiki for broad synthesis.

### Phases

1. Read `system/maintenance.md`.
2. Read `system/evals/lint-checklist.md`.
3. Run structure, link, source, duplicate, and staleness checks.
4. For recent ingest issues, cross-check `system/evals/ingest-checklist.md`.
5. Fix mechanical issues directly when safe.
6. List subjective issues for user review.
7. Update the active monthly log under `wiki/logs/YYYY-MM.md`.

### Lint Output

Return:

```text
checked:
fixed:
warnings:
needs_user_review:
recommended_next_actions:
```

## Workflow: Report

Use when the user asks for a briefing, pulse, task report, weekly review, learning review, or migration summary.

### Phases

1. Determine report type and audience.
2. Read the smallest relevant wiki subset.
3. Include what changed, what matters, and what action is recommended.
4. Link to source pages and compiled pages.
5. Write the report under `wiki/reports/` when the user wants it persisted.

## Workflow: Setup / Migration

Use for initialization, migration, or batch import of historical material.

### Phases

1. **Inventory sources**
   - List source folders, file types, approximate counts, date ranges, quality issues, and sensitive areas.

2. **Design mapping**
   - Map source structure to `sources/`, `wiki/` domains, page types, and metadata.
   - Record ambiguous mappings.

3. **Sample import**
   - Import 5-10 representative samples.
   - Cover different source types and edge cases.

4. **Sample validation**
   - Validate page structure, source references, links, aliases, relationships, and user fit.
   - Ask for user review when classification choices are subjective.

5. **Full import**
   - Process in batches only after sample validation.
   - Track counts, failures, skipped items, and changed files.

6. **Rebuild derived structures**
   - Rebuild indexes, backlinks, aliases, timelines, review queues, and report pages.

7. **Health check**
   - Run the lint checklist.
   - Fix mechanical issues and report subjective issues.

8. **Migration report**
   - Write a report using `system/templates/migration-report.md`.

### Migration Output

Return:

```text
source_inventory:
mapping_decisions:
sample_imported:
sample_validation:
full_import_counts:
derived_rebuild:
health_check:
failures:
needs_user_review:
migration_report:
```

## Output Format

Every mutating run must end with an auditable summary:

```text
workflow:
inputs:
files_read:
files_created:
files_updated:
sources_created_or_used:
pages_created:
pages_updated:
links_added:
citations_fixed:
maintenance_done:
open_questions:
needs_user_review:
next_actions:
```

Read-only query runs should instead end with:

```text
answer:
pages_consulted:
source_evidence:
uncertainties:
suggested_followups:
```

Task runs should use the Task Output fields above.

## Anti-Patterns

- Do not dump summaries into `wiki/` without links or source references.
- Do not create one skill per domain unless repeated workflow complexity justifies it.
- Do not scan the entire wiki for ordinary queries; use progressive loading.
- Do not rewrite the user's raw notes into polished prose.
- Do not treat generic web knowledge as the user's knowledge unless the user consumed, accepted, or applied it.
- Do not run full migration before sample validation.
- Do not produce a report that hides skipped files, failures, or low-confidence mappings.
- Do not let cron jobs mutate the wiki silently without a log entry.

## Verification

Before declaring a mutating task complete, check:

- The active monthly log under `wiki/logs/YYYY-MM.md` has an entry.
- New pages have frontmatter.
- New page `type` and `status` values are allowed by `system/schema.md` and the nearest domain `AGENTS.md`.
- New pages have at least one source or explicit inference marker.
- New pages are discoverable from `wiki/index.md` or a domain README/index.
- Any open questions are visible.
