# Tasks Schema

## Contract

Task pages are the canonical records for serious tracked todos. `todo.md` is the active dashboard; `wiki/tasks/` stores durable task state, source, context, and links. Lightweight one-off todos may live only in `todo.md`. Source-worthy long-term task evidence must also be preserved under `sources/tasks/` and linked from task pages.

## When To Use

Use this domain when the user says `todo`, `待办`, "给我记一个 todo", asks to remember a task, or asks to complete, postpone, drop, block, schedule, or review tracked tasks.

Do not use this domain for vague ideas, saved links, open questions, or learning backlog items unless the user explicitly wants a concrete action tracked.

Before creating a task page, apply the Task Granularity Gate below.

## How To Update

1. Read `system/resolver.md` and `system/evals/task-checklist.md`.
2. Apply the Task Granularity Gate.
3. Apply the Task Evidence Gate for every canonical task or canonical task update.
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

## Task Granularity Gate

Classify every todo candidate before writing:

- `lightweight_todo`: small, one-step, one-off action with no due/scheduled date, no waiting/blocking state, no durable context/history, and no clear link to a project, learning path, event, theme, source, or report. Put it in `todo.md` as a plain checkbox. Do not create a `wiki/tasks/` page.
- `canonical_task`: serious tracked todo. Create or update a task page when the item is important, high priority, due/scheduled, multi-step, waiting/blocked, source-backed, review-worthy, report-worthy, or linked to a project, learning path, event, theme, source, or report.
- `subtask`: small action that belongs to a larger tracked outcome. Add it to the parent task's `## Checklist` or `## Next Step`; keep one dashboard item for the parent.
- `not_task`: vague idea, open question, saved link, reference, or learning backlog item without a concrete action.

If multiple todo items share one goal and context, prefer one canonical task with a checklist. Create separate canonical tasks only when the items have different deadlines, owners, blocking states, domains, or the user explicitly asks for separate tracking.

If classification is ambiguous, prefer the lighter representation unless that would lose a deadline, dependency, important context, or future review value. Ask when the wrong granularity would be harmful.

## Task Evidence Gate

Run this gate after the Task Granularity Gate for every canonical task and every update to an existing canonical task.

Create or update a `sources/tasks/` source record and set `evidence_policy: source-backed` when:

- The user explicitly calls the task long-term, ongoing, recurring, routine, habit-forming, important, or review-worthy.
- The task or update records durable life, health, career, relationship, project, or learning evidence.
- The update records a meaningful execution event: check-in with observation, milestone, substantial progress, repeated practice, missed routine with reason, blocker, unblock condition, failure, abandonment reason, completion outcome, or weekly/monthly review.
- The task is linked to a project, learning path, theme, event, report, or source whose future reconstruction depends on execution history.
- The user asks to preserve the task/update as evidence, says `入库`, `沉淀`, `记录到 wiki`, or `记为证据`.

Use `evidence_policy: task-page-only` when a canonical task is serious enough for `wiki/tasks/` but does not need a source record. Use `evidence_policy: none` only for examples or non-real operational placeholders.

Do not create task evidence sources for lightweight one-off todos, dashboard reordering, simple status moves, typo fixes, priority changes without context, or daily done/not-done checkboxes with no user-provided observation.

For repeated check-ins on the same long-term task, prefer one grouped monthly source under `sources/tasks/YYYY/` and preserve every raw update as a timestamped fragment.

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

- During Ingest, diary, learning, project, event, and reflection pages can update task progress even when the user did not issue a direct `todo` command.
- Match source signals to tasks by explicit task name/link, linked project/learning/theme pages, task tags, source paths, and clear semantic overlap.
- Clear matches must update the task page `## Progress Snapshot`, task log, `todo.md`, and `wiki/tasks/任务.md`.
- Compiled source-derived pages that caused task updates should include `## Related Tasks` with the task link and the source-supported impact.
- Ambiguous matches or ambiguous outcomes must be listed under `needs_user_review`; do not mark tasks done from vague wording.

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
