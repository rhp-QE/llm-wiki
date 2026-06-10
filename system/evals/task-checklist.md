# Task Checklist

Use this checklist for every `llm-wiki` Task Capture / Update run.

This is an audit gate. Each item must be satisfied, marked not applicable, or listed under `needs_user_review`.

## Critical Gates

- [ ] The user explicitly asked to create, update, complete, drop, schedule, block, wait on, or query a todo/task.
- [ ] `system/resolver.md` was used to choose Task Capture / Update.
- [ ] `wiki/tasks/AGENTS.md` was read before writing task pages.
- [ ] The task has an actionable title. If not, no task was created and the user was asked for the missing action.
- [ ] The Task Granularity Gate was applied before creating any canonical task page.
- [ ] The Task Evidence Gate was applied for every canonical task or canonical task update.
- [ ] A canonical task page exists under `wiki/tasks/` for every newly tracked serious todo.
- [ ] Lightweight one-off todos, if any, were kept as plain `todo.md` checkboxes instead of task pages.
- [ ] Lightweight one-off todos, dashboard reordering, simple status moves, typo fixes, and context-free priority changes did not create `sources/tasks/` records.
- [ ] Subtasks, if any, were added to a parent task checklist or next step instead of separate task pages.
- [ ] Source-worthy long-term task goals or execution updates, if any, were preserved under `sources/tasks/` before or alongside task page updates.
- [ ] `todo.md` was updated when task state or priority affects the active dashboard.
- [ ] The active monthly log under `wiki/logs/YYYY-MM.md` was updated for meaningful task mutations.

## Task Fields

- [ ] For canonical task pages, frontmatter uses `type: task`.
- [ ] For canonical task pages, `status` is one of `open`, `doing`, `waiting`, `scheduled`, `blocked`, `done`, or `dropped`.
- [ ] For canonical task pages, `priority` is `low`, `medium`, `high`, or `unknown`; priority was not invented.
- [ ] For canonical task pages, `area` is one of `life`, `learning`, `project`, `career`, `wiki`, `health`, `relationship`, `finance`, or `other`.
- [ ] For canonical task pages, `due` and `scheduled` are absolute dates when present; relative dates were resolved at capture time.
- [ ] For canonical task pages, `source` records direct user request, source path, or linked wiki evidence.
- [ ] For canonical task pages, `evidence_policy` is `none`, `task-page-only`, or `source-backed`.
- [ ] For source-backed task pages, `source_records` lists existing `sources/tasks/` paths.
- [ ] Related pages were linked only when the relationship is clear.
- [ ] Similar open tasks were checked before creating a duplicate.

## Granularity Gate

- [ ] Candidate items were classified as `lightweight_todo`, `canonical_task`, `subtask`, or `not_task`.
- [ ] Canonical task pages were created only for serious tracked tasks: important, high priority, due/scheduled, multi-step, waiting/blocked, source-backed, review-worthy, report-worthy, or linked to a project, learning path, event, theme, source, or report.
- [ ] Micro-actions with no due date, no durable context, and no linked page were not promoted to `wiki/tasks/`.
- [ ] Multiple small actions with one shared goal were grouped under one parent task checklist unless separate tracking was explicitly needed.
- [ ] Ambiguous granularity was either resolved by a short question or handled with the lighter representation without losing deadlines, dependencies, or review context.

## Task Evidence Gate

- [ ] Canonical tasks marked long-term, ongoing, recurring, routine, habit-forming, important, or review-worthy were treated as source-backed unless there is an explicit reason not to.
- [ ] Meaningful execution updates were archived as task evidence when they recorded a check-in with observation, milestone, substantial progress, repeated practice, missed routine with reason, blocker, unblock condition, failure, abandonment reason, completion outcome, or weekly/monthly review.
- [ ] Source-worthy task records use `type: source`, `source_type: task_evidence`, and a path under `sources/tasks/`.
- [ ] User-provided task/update wording was preserved verbatim in `## Raw Material`.
- [ ] Repeated check-ins for the same long-term task were grouped by task/month when practical instead of creating one source per tiny update.
- [ ] Agent-inferred outcomes or synthesized reviews were not stored as source evidence unless they cite existing source-backed records and are clearly marked.

## Dashboard Consistency

- [ ] Open or doing tasks appear in `todo.md` under Today, Next, Scheduled, Waiting / Blocked, or Review Queue.
- [ ] Done or dropped tasks are removed from active sections or moved to Recently Done when useful.
- [ ] Canonical `todo.md` entries link to task pages; lightweight one-off checkboxes are clearly dashboard-only.
- [ ] Project-local tasks and learning practice tasks are promoted to `wiki/tasks/` only when serious tracking is requested.
- [ ] Source-backed task pages link evidence records in `source_records`; `todo.md` remains a dashboard, not the only record of durable task history.

## Stop Conditions

Stop and ask the user when:

- The user says only "给我记一个 todo" but gives no task content.
- The intended task, due date, assignee, or completion target is ambiguous enough that a wrong task would be harmful.
- The request seems like a source note, diary entry, or saved reference rather than a concrete task.
