# Policy: Task Granularity Gate

Classify every todo candidate before writing.

## Classes

- `lightweight_todo`: small one-step action; no due/scheduled date; no waiting/blocking state; no durable context/history; no clear relationship to a project, learning path, event, theme, source, or report. Store as a plain checkbox in `todo.md`.
- `canonical_task`: serious tracked todo. Create or update a task page when the item is important, high priority, due/scheduled, multi-step, waiting/blocked, source-backed, review-worthy, report-worthy, or linked to a project, learning path, event, theme, source, or report.
- `subtask`: small action that belongs to a larger tracked outcome. Add it to the parent task checklist or next step.
- `not_task`: vague idea, open question, saved link, reference, or learning backlog item without a concrete action.

## Rules

- Do not create blank tasks.
- Prefer one parent task with a checklist when multiple small actions share one goal and context.
- Split tasks only when deadlines, owners, blocking states, domains, or user instructions differ.
- If granularity is ambiguous, prefer the lighter representation unless that loses deadline, dependency, evidence, or important review context.

