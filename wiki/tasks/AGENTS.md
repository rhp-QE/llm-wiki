# Tasks Schema

## Contract

Task pages are the canonical records for serious tracked todos. `todo.md` is the active dashboard; `wiki/tasks/` stores durable task state, source, context, and links. Lightweight one-off todos may live only in `todo.md`. Source-worthy long-term task evidence must also be preserved under `sources/tasks/` and linked from task pages.

## When To Use

Use this domain when the user says `todo`, `待办`, "给我记一个 todo", asks to remember a task, or asks to complete, postpone, drop, block, schedule, or review tracked tasks.

Do not use this domain for vague ideas, saved links, open questions, or learning backlog items unless the user explicitly wants a concrete action tracked.

Before creating a task page, apply `system/policies/task-granularity.md`.

## How To Update

1. Read `system/resolver.md` and `system/evals/task-checklist.md`.
2. Apply `system/policies/task-granularity.md`.
3. Apply `system/policies/task-evidence.md` for every canonical task or canonical task update.
4. Check for similar open tasks before creating a new task.
5. Create or update a canonical task page under `wiki/tasks/` only when the item passes the canonical-task threshold.
6. For source-worthy long-term task evidence, create or update a `sources/tasks/` record before or alongside the task page update and link it in `source_records`.
7. For lightweight one-off todos, add a plain checkbox to `todo.md` and do not create a task page or task evidence source.
8. For subtasks, update the parent task checklist or next step instead of creating another task page.
9. Update the task progress cache: frontmatter `progress_*` fields, `## Progress Snapshot`, and any checklist-derived state.
10. Update `todo.md` so the active dashboard and aggregate progress snapshot match task state.
11. Update `wiki/tasks/任务.md` so Obsidian has the same aggregate progress snapshot.
12. Link related project, learning, event, theme, or source pages when the relationship is clear.
13. Update the active monthly log under `wiki/logs/YYYY-MM.md`.

For Ingest-derived task impacts, the source may be a diary, learning note, project note, event source, reflection, article, or chat already preserved under `sources/`. Use that preserved source as task evidence when it contains the raw user wording; create a separate `sources/tasks/` record only when the task event entered through a direct task command or a task-specific grouped evidence record is useful.

## Page Location

`wiki/tasks/{YYYY-MM-DD}-{slug}.md`

Use the capture date in the filename. Use a short, stable lowercase English slug when possible.

Use `wiki/tasks/任务.md` as the Obsidian-facing task index.

## Frontmatter

For task pages:

```yaml
---
type: task
title:
status: open | doing | waiting | scheduled | blocked | done | dropped
priority: low | medium | high | unknown
area: life | learning | project | career | wiki | health | relationship | finance | other
progress_state: not-started | in-progress | partial | waiting | blocked | done | dropped | unknown
progress_percent: 0-100 | unknown
progress_updated:
progress_summary:
due:
scheduled:
created:
updated:
completed:
source:
evidence_policy: none | task-page-only | source-backed
source_records: []
linked_pages: []
tags: []
---
```

For the task index:

```yaml
---
type: task_index
title: 任务
status: active | draft | retired
created:
updated:
progress_snapshot_updated:
tags:
  - tasks
---
```

## Body

```markdown
## Task

## Status

## Progress Snapshot

## Context

## Next Step

## Checklist

## Source

## Source Records

## Linked Pages

## Log
```

`## Checklist` is optional for single-action tasks and preferred when several small todo items map to one parent task.

`## Progress Snapshot` is required for canonical task pages. Keep it short: current state, percent or `unknown`, last update date, and one supported sentence explaining the latest completion state.

## Task Policies

- Granularity: `system/policies/task-granularity.md`
- Evidence: `system/policies/task-evidence.md`
- Ingest-derived task impact: `system/policies/task-impact.md`

This file owns task page shape and task-domain anti-patterns. The policy files own classification rules.

## Dashboard Rules

- `todo.md` should show active tasks only at dashboard level.
- `wiki/tasks/任务.md` should link active task pages for Obsidian browsing.
- Both `todo.md` and `wiki/tasks/任务.md` should include a compact `## Progress Snapshot` aggregate before status buckets.
- Use checkbox bullets in `todo.md`. Link canonical tracked tasks to their task pages; lightweight one-off todos may remain plain checkboxes.
- Keep details, evidence, and history in task pages, not in `todo.md`.
- Keep completion/progress summaries in task pages and aggregate dashboards so ordinary task queries do not need to scan every linked project, learning, and theme page.
- Keep rebuild-worthy task evidence in `sources/tasks/`, not only in task pages.
- Done and dropped tasks should not remain in active dashboard sections.

## Progress Cache Rules

- Task progress is a cache over task pages, checklists, logs, source records, and clearly linked project or learning pages. It is not raw evidence.
- Use `progress_percent: unknown` when the task has no clear denominator or explicit completion signal. Do not invent precise percentages.
- A scheduled task review or task report may refresh `progress_updated` and `progress_summary`; if no new evidence exists, say so explicitly.
- Querying task progress should read `todo.md` and `wiki/tasks/任务.md` first. Deep-read individual task pages only when the aggregate snapshot is missing, stale, ambiguous, or evidence is requested.

## Ingest-Derived Task Updates

Ingest-derived task updates are governed by `system/policies/task-impact.md`.

When that policy produces a clear task update, update the task page `## Progress Snapshot`, task log, `todo.md`, and `wiki/tasks/任务.md`. When the match or outcome is ambiguous, list it under `needs_user_review`.

## Anti-Patterns

- Do not create blank tasks.
- Do not create canonical task pages for every tiny one-off action.
- Do not split small steps with the same goal into many task pages.
- Do not invent due dates, priority, or related pages.
- Do not convert every open question into a task.
- Do not duplicate the same open task across multiple pages.
- Do not let `todo.md` become the only copy of serious tracked tasks.
- Do not let source-worthy long-term task evidence exist only inside `wiki/tasks/`.
- Do not put lightweight task state into `sources/tasks/`.
