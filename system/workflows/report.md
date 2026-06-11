# Workflow: Report

Use when the user asks for a briefing, pulse, task report, weekly review, learning review, migration summary, health report, or another consumable synthesis.

## Read

- `AGENTS.md`
- `wiki/index.md`
- `wiki/reports/AGENTS.md` when persisting a report
- relevant domain pages and local sources needed for evidence
- `system/workflows/query.md` for read-only report behavior
- `system/workflows/task.md` when a task report refreshes task progress caches

## Rules

- Reports are consumable outputs, not raw knowledge.
- Include scope, pages read, source evidence, skipped areas, uncertainty, and next actions.
- Persist under `wiki/reports/` only when the user wants a saved report or the workflow requires one.
- Task reports may refresh supported task progress caches; if they mutate tasks, follow Task Capture / Update rules and log the mutation.
- Do not hide failures, skipped areas, or low-confidence mappings.

## Output

For conversational reports, answer directly with evidence and uncertainty.

For persisted reports, create a page matching `wiki/reports/AGENTS.md` and return:

```text
workflow:
report:
pages_consulted:
sources_used:
files_created:
files_updated:
open_questions:
needs_user_review:
next_actions:
```

