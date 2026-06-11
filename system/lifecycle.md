# Knowledge Lifecycle

This document owns lifecycle shape, not workflow bodies. Detailed execution lives in `system/workflows/`.

## Modes

### Incremental Mode

Daily operation after the wiki is running:

```text
user input / scheduled trigger
  -> Resolver
  -> selected workflow
  -> policy checks
  -> domain writes or read-only answer
  -> audit checklist
  -> monthly log when mutation is meaningful
```

Primary incremental workflows:

- Inbox Capture: `system/workflows/inbox.md`
- Task Capture / Update: `system/workflows/task.md`
- Query: `system/workflows/query.md`
- Ingest: `system/workflows/ingest.md`
- Lint: `system/workflows/lint.md`
- Report: `system/workflows/report.md`

### Stock Mode

Initialization, large historical import, or external source migration:

```text
setup / migration
  -> inventory
  -> mapping
  -> sample import
  -> sample validation
  -> full import
  -> derived rebuild
  -> health check
  -> migration report
```

Detailed migration workflow: `system/workflows/migration.md`.

## Layer Model

| Layer | Role |
| --- | --- |
| `inbox/` | capture queue, not durable knowledge |
| `sources/` | original evidence and rebuild seed |
| `wiki/` | compiled knowledge and human/agent reading layer |
| `todo.md` + `wiki/tasks/` | task dashboard and canonical task records |
| `system/` | workflows, policies, schema, templates, evals, and skills |

## Invariant Rules

- `system/skills/llm-wiki/SKILL.md` remains a thin bootstrap/router.
- `system/resolver.md` owns intent routing.
- `system/workflows/` owns execution steps.
- `system/policies/` owns reusable hard rules.
- `system/evals/` owns audit checklists.
- Domain `AGENTS.md` files own page shape and local anti-patterns.
- `system/schema.md` owns shared types, statuses, and cross-domain fields.

## Mutation Discipline

- Inbox Capture writes only `inbox/`.
- Explicit Ingest is required before writing `sources/` or compiled `wiki/` pages.
- User-provided durable material must be preserved verbatim before compiled pages are written.
- Direct task commands use the task system, not inbox.
- Query is read-only.
- Migration must not skip sample validation.
- Meaningful mutations update `wiki/logs/YYYY-MM.md`.

## Derived Structure Rebuild

After large ingest or migration, rebuild as needed:

- `wiki/index.md`
- domain README/index pages
- Obsidian maps
- task dashboard and task index
- source manifests or indexes if present
- reports

Run `system/workflows/lint.md` after rebuild.
