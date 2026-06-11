# Policy: Ingest Task Impact Pass

Run during every Ingest after source preservation and before final reporting when the source may affect tasks.

## Applies To

- diary
- learning
- project
- reflection
- event
- article or chat sources that contain task signals
- other personal-progress or project-execution sources

## Steps

1. Read `todo.md` and `wiki/tasks/任务.md`.
2. Deep-read relevant task pages when titles, aliases, linked pages, tags, or source content overlap.
3. Detect task impact signals:
   - completion
   - partial progress
   - checklist movement
   - missed routine with reason
   - blocker or unblock condition
   - failure or abandonment reason
   - weekly/monthly review
   - new serious action
4. If the signal clearly maps to an existing task, update the task page, progress cache, task log, `todo.md`, and `wiki/tasks/任务.md`.
5. If the source creates a serious tracked action, apply the Task Granularity Gate.
6. Add `## Related Tasks` or equivalent backlinks to compiled source-derived pages.
7. If mapping or outcome is ambiguous, list it under `needs_user_review` and do not invent completion.

