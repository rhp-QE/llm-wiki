# Tasks

This domain stores canonical personal todo records for serious tracked tasks.

Use it for:

- Direct todos from the user that pass the Task Granularity Gate
- Project next actions that need serious tracking
- Learning practice tasks the user wants to execute
- Follow-ups, reminders, waiting items, blocked work, and completed task history

`todo.md` at the repository root is the active dashboard. Lightweight one-off todos may live only there as plain checkboxes. Task details for serious tracked tasks live here.

Source-worthy long-term task evidence lives under `sources/tasks/`. A task page is compiled operational state; if the task is long-term, recurring, habit-forming, review-worthy, or records meaningful execution history, set `evidence_policy: source-backed` and link the evidence source in `source_records`.

Apply the Task Granularity Gate before creating a task page:

- Keep tiny one-step, one-off actions in `todo.md` when they have no due date, waiting/blocking state, durable context, or clear linked page.
- Create task pages for important, high-priority, due/scheduled, multi-step, waiting/blocked, source-backed, review-worthy, report-worthy, or linked tasks.
- Merge multiple small todo items into one parent task checklist when they share the same goal and context.
- Preserve long-term task goals, meaningful check-ins, milestones, blockers, failures, reviews, and outcomes in `sources/tasks/`; do not preserve lightweight dashboard-only state as sources.

Use [[wiki/tasks/任务|任务]] as the Obsidian-facing task index.
