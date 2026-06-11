# Workflow Index

This directory owns executable workflow instructions. `system/skills/llm-wiki/SKILL.md` should stay thin and route here instead of embedding workflow bodies.

## Workflows

| Workflow | File | Mutates |
| --- | --- | --- |
| Inbox Capture | `system/workflows/inbox.md` | `inbox/` only |
| Task Capture / Update | `system/workflows/task.md` | `todo.md`, `wiki/tasks/`, sometimes `sources/tasks/` |
| Ingest | `system/workflows/ingest.md` | `sources/`, `wiki/`, logs, sometimes tasks |
| Query | `system/workflows/query.md` | no |
| Lint | `system/workflows/lint.md` | yes, only safe repairs |
| Setup / Migration | `system/workflows/migration.md` | yes, after sample validation |
| Report | `system/workflows/report.md` | optional |

## Shared Rules

- Use `system/resolver.md` to choose a workflow.
- Use `system/policies/` for reusable hard rules.
- Use `system/evals/` as audit gates before final response on mutating workflows.
- Use domain `AGENTS.md` files for page shape and local ownership.

