# Workflow: Lint

Use when checking health after batch ingest, before broad synthesis, or when the user asks for lint, broken links, duplicate entities, stale pages, schema drift, or task consistency.

## Read

- `AGENTS.md`
- `wiki/index.md`
- `system/maintenance.md`
- `system/evals/lint-checklist.md`
- `system/evals/ingest-checklist.md` for recent ingest issues
- `system/schema.md`
- relevant domain `AGENTS.md` files for issues being fixed

## Rules

- Run structure, link, source, duplicate, schema, and staleness checks.
- Fix mechanical issues directly when safe.
- Do not make subjective classification changes without listing them under `needs_user_review`.
- Do not rewrite source payloads.
- Do not silently mutate the wiki without a monthly log entry.

## Output

Return:

```text
checked:
issues:
fixed:
warnings:
needs_user_review:
recommended_next_actions:
```

