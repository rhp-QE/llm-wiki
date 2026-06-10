# Tasks Schema

## Contract

Task pages are the canonical records for serious personal todos. `todo.md` is the active dashboard; `wiki/tasks/` stores durable task state, source, context, and links. Lightweight one-off todos may live only in `todo.md`.

## When To Use

Use this domain when the user says `todo`, `待办`, "给我记一个 todo", asks to remember a task, or asks to complete, postpone, drop, block, schedule, or review tracked tasks.

Do not use this domain for vague ideas, saved links, open questions, or learning backlog items unless the user explicitly wants a concrete action tracked.

Before creating a task page, apply the Task Granularity Gate below.

## How To Update

1. Read `system/resolver.md` and `system/evals/task-checklist.md`.
2. Apply the Task Granularity Gate.
3. Check for similar open tasks before creating a new task.
4. Create or update a canonical task page under `wiki/tasks/` only when the item passes the canonical-task threshold.
5. For lightweight one-off todos, add a plain checkbox to `todo.md` and do not create a task page.
6. For subtasks, update the parent task checklist or next step instead of creating another task page.
7. Update `todo.md` so the active dashboard matches task state.
8. Link related project, learning, event, theme, or source pages when the relationship is clear.
9. Update the active monthly log under `wiki/logs/YYYY-MM.md`.

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
due:
scheduled:
created:
updated:
completed:
source:
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
tags:
  - tasks
---
```

## Body

```markdown
## Task

## Status

## Context

## Next Step

## Checklist

## Source

## Linked Pages

## Log
```

`## Checklist` is optional for single-action tasks and preferred when several small todo items map to one parent task.

## Task Granularity Gate

Classify every todo candidate before writing:

- `lightweight_todo`: small, one-step, one-off action with no due/scheduled date, no waiting/blocking state, no durable context/history, and no clear link to a project, learning path, event, theme, source, or report. Put it in `todo.md` as a plain checkbox. Do not create a `wiki/tasks/` page.
- `canonical_task`: serious tracked todo. Create or update a task page when the item is important, high priority, due/scheduled, multi-step, waiting/blocked, source-backed, review-worthy, report-worthy, or linked to a project, learning path, event, theme, source, or report.
- `subtask`: small action that belongs to a larger tracked outcome. Add it to the parent task's `## Checklist` or `## Next Step`; keep one dashboard item for the parent.
- `not_task`: vague idea, open question, saved link, reference, or learning backlog item without a concrete action.

If multiple todo items share one goal and context, prefer one canonical task with a checklist. Create separate canonical tasks only when the items have different deadlines, owners, blocking states, domains, or the user explicitly asks for separate tracking.

If classification is ambiguous, prefer the lighter representation unless that would lose a deadline, dependency, important context, or future review value. Ask when the wrong granularity would be harmful.

## Dashboard Rules

- `todo.md` should show active tasks only at dashboard level.
- `wiki/tasks/任务.md` should link active task pages for Obsidian browsing.
- Use checkbox bullets in `todo.md`. Link canonical tracked tasks to their task pages; lightweight one-off todos may remain plain checkboxes.
- Keep details, evidence, and history in task pages, not in `todo.md`.
- Done and dropped tasks should not remain in active dashboard sections.

## Anti-Patterns

- Do not create blank tasks.
- Do not create canonical task pages for every tiny one-off action.
- Do not split small steps with the same goal into many task pages.
- Do not invent due dates, priority, or related pages.
- Do not convert every open question into a task.
- Do not duplicate the same open task across multiple pages.
- Do not let `todo.md` become the only copy of serious tracked tasks.
