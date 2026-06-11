# Workflow: Task Capture / Update

Use when the user asks to create, remember, list, update, complete, drop, block, wait on, schedule, or review a todo/task.

## Read

- `AGENTS.md`
- `wiki/index.md`
- `system/resolver.md`
- `wiki/tasks/AGENTS.md`
- `system/evals/task-checklist.md`
- `system/policies/task-granularity.md`
- `system/policies/task-evidence.md`
- `system/policies/source-preservation.md` when task evidence is source-worthy

## Rules

- Direct task commands write to the task system, not `inbox/`.
- Apply the Task Granularity Gate before creating or updating a canonical task page.
- For lightweight one-off todos, update `todo.md` only.
- For canonical tasks, create or update `wiki/tasks/{YYYY-MM-DD}-{slug}.md` using `system/templates/task.md`.
- Apply the Task Evidence Gate for every canonical task and canonical task update.
- Preserve source-worthy task evidence under `sources/tasks/` before or alongside task page updates.
- Do not create blank tasks. Ask for the missing action.
- Do not invent due date, priority, area, status, or linked pages.
- Resolve relative dates to absolute dates at capture time.
- Update task progress caches when status, checklist state, blocker/waiting state, or meaningful execution evidence changes.
- Keep `todo.md` and `wiki/tasks/任务.md` consistent.
- Update the active monthly log after meaningful task mutations.

## Output

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

