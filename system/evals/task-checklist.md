# Task Checklist

Use this checklist for every `llm-wiki` Task Capture / Update run.

This is an audit gate. Each item must be satisfied, marked not applicable, or listed under `needs_user_review`.

## Critical Gates

- [ ] The user explicitly asked to create, update, complete, drop, schedule, block, wait on, or query a todo/task.
- [ ] `system/resolver.md` was used to choose Task Capture / Update.
- [ ] `wiki/tasks/AGENTS.md` was read before writing task pages.
- [ ] The task has an actionable title. If not, no task was created and the user was asked for the missing action.
- [ ] The Task Granularity Gate was applied before creating any canonical task page.
- [ ] A canonical task page exists under `wiki/tasks/` for every newly tracked serious todo.
- [ ] Lightweight one-off todos, if any, were kept as plain `todo.md` checkboxes instead of task pages.
- [ ] Subtasks, if any, were added to a parent task checklist or next step instead of separate task pages.
- [ ] `todo.md` was updated when task state or priority affects the active dashboard.
- [ ] The active monthly log under `wiki/logs/YYYY-MM.md` was updated for meaningful task mutations.

## Task Fields

- [ ] For canonical task pages, frontmatter uses `type: task`.
- [ ] For canonical task pages, `status` is one of `open`, `doing`, `waiting`, `scheduled`, `blocked`, `done`, or `dropped`.
- [ ] For canonical task pages, `priority` is `low`, `medium`, `high`, or `unknown`; priority was not invented.
- [ ] For canonical task pages, `area` is one of `life`, `learning`, `project`, `career`, `wiki`, `health`, `relationship`, `finance`, or `other`.
- [ ] For canonical task pages, `due` and `scheduled` are absolute dates when present; relative dates were resolved at capture time.
- [ ] For canonical task pages, `source` records direct user request, source path, or linked wiki evidence.
- [ ] Related pages were linked only when the relationship is clear.
- [ ] Similar open tasks were checked before creating a duplicate.

## Granularity Gate

- [ ] Candidate items were classified as `lightweight_todo`, `canonical_task`, `subtask`, or `not_task`.
- [ ] Canonical task pages were created only for serious tracked tasks: important, high priority, due/scheduled, multi-step, waiting/blocked, source-backed, review-worthy, report-worthy, or linked to a project, learning path, event, theme, source, or report.
- [ ] Micro-actions with no due date, no durable context, and no linked page were not promoted to `wiki/tasks/`.
- [ ] Multiple small actions with one shared goal were grouped under one parent task checklist unless separate tracking was explicitly needed.
- [ ] Ambiguous granularity was either resolved by a short question or handled with the lighter representation without losing deadlines, dependencies, or review context.

## Dashboard Consistency

- [ ] Open or doing tasks appear in `todo.md` under Today, Next, Scheduled, Waiting / Blocked, or Review Queue.
- [ ] Done or dropped tasks are removed from active sections or moved to Recently Done when useful.
- [ ] Canonical `todo.md` entries link to task pages; lightweight one-off checkboxes are clearly dashboard-only.
- [ ] Project-local tasks and learning practice tasks are promoted to `wiki/tasks/` only when serious tracking is requested.

## Stop Conditions

Stop and ask the user when:

- The user says only "给我记一个 todo" but gives no task content.
- The intended task, due date, assignee, or completion target is ambiguous enough that a wrong task would be harmful.
- The request seems like a source note, diary entry, or saved reference rather than a concrete task.
