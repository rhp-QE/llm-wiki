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
- [ ] Task progress cache was updated when status, checklist state, blocker/waiting state, meaningful execution evidence, or user-requested progress review changed the task.
- [ ] `todo.md` and `wiki/tasks/任务.md` aggregate progress snapshots were refreshed when task progress changed.
- [ ] The active monthly log under `wiki/logs/YYYY-MM.md` was updated for meaningful task mutations.

## Task Fields

- [ ] For canonical task pages, frontmatter uses `type: task`.
- [ ] For canonical task pages, `status` is one of `open`, `doing`, `waiting`, `scheduled`, `blocked`, `done`, or `dropped`.
- [ ] For canonical task pages, `priority` is `low`, `medium`, `high`, or `unknown`; priority was not invented.
- [ ] For canonical task pages, `area` is one of `life`, `learning`, `project`, `career`, `wiki`, `health`, `relationship`, `finance`, or `other`.
- [ ] For canonical task pages, `progress_state`, `progress_percent`, `progress_updated`, and `progress_summary` reflect the latest supported progress snapshot.
- [ ] `progress_percent` is `unknown` unless backed by explicit user evidence, a checklist denominator, or a mechanical completion signal.
- [ ] For canonical task pages, `due` and `scheduled` are absolute dates when present; relative dates were resolved at capture time.
- [ ] For canonical task pages, `source` records direct user request, source path, or linked wiki evidence.
- [ ] For canonical task pages, `evidence_policy` is `none`, `task-page-only`, or `source-backed`.
- [ ] For source-backed task pages, `source_records` lists existing `sources/tasks/` paths.
- [ ] Related pages were linked only when the relationship is clear.
- [ ] Similar open tasks were checked before creating a duplicate.

## Policy Application

- [ ] `system/policies/task-granularity.md` was applied and the candidate class was recorded when useful: `lightweight_todo`, `canonical_task`, `subtask`, or `not_task`.
- [ ] `system/policies/task-evidence.md` was applied and each canonical task/update has the correct evidence policy: `none`, `task-page-only`, or `source-backed`.
- [ ] `system/policies/task-impact.md` was applied when task state was derived from an ingest source rather than a direct task command.
- [ ] Policy decisions that could not be made safely were listed under `needs_user_review`.

## Dashboard Consistency

- [ ] Open or doing tasks appear in `todo.md` under Today, Next, Scheduled, Waiting / Blocked, or Review Queue.
- [ ] Done or dropped tasks are removed from active sections or moved to Recently Done when useful.
- [ ] Canonical `todo.md` entries link to task pages; lightweight one-off checkboxes are clearly dashboard-only.
- [ ] Aggregate progress snapshots in `todo.md` and `wiki/tasks/任务.md` are consistent with task page progress fields.
- [ ] Project-local tasks and learning practice tasks are promoted to `wiki/tasks/` only when serious tracking is requested.
- [ ] Source-backed task pages link evidence records in `source_records`; `todo.md` remains a dashboard, not the only record of durable task history.

## Stop Conditions

Stop and ask the user when:

- The user says only "给我记一个 todo" but gives no task content.
- The intended task, due date, assignee, or completion target is ambiguous enough that a wrong task would be harmful.
- The request seems like a source note, diary entry, or saved reference rather than a concrete task.
