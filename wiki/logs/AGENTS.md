# Logs Schema

## Contract

Monthly log pages are the audit trail for meaningful wiki operations. They record what changed, why it changed, and what remains open.

`wiki/log.md` is the log index. Do not append detailed operation entries directly to `wiki/log.md` except when updating the index summary.

## Page Location

`wiki/logs/{YYYY-MM}.md`

## Frontmatter

```yaml
---
type: monthly_log
title:
period: YYYY-MM
status: active | closed
created:
updated:
tags:
  - log
---
```

## Entry Format

```markdown
## YYYY-MM-DD

- Operation:
- Inputs:
- Created:
- Updated:
- Links added:
- Open questions:
```

## Rules

- Append detailed entries to the active monthly log.
- Keep `wiki/log.md` as a short index with links to monthly logs and recent operation summaries.
- When a new month starts, create a new monthly log and add it to `wiki/log.md`.
- Keep long analysis, health checks, migration reports, and weekly reviews in `wiki/reports/`; log only the operation and report link.
- Preserve exact file paths for auditability.

## Anti-Patterns

- Do not let `wiki/log.md` grow into the full operation history.
- Do not duplicate full report contents in logs.
- Do not omit failed or skipped work when it matters for future maintenance.
