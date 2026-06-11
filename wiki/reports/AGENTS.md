# Reports Schema

## Contract

Reports should make wiki work visible and actionable. A report must state scope, what changed or was checked, what matters, and what should happen next.

## When To Use

Use this domain for persisted briefings, pulse reports, task reports, weekly reviews, learning reviews, migration summaries, and health checks.

## How To Update

1. State report scope and period.
2. List pages and sources consulted.
3. Separate findings, issues, uncertainty, and next actions.
4. Link source pages and canonical wiki pages instead of duplicating raw material.

## Page Location

`wiki/reports/{YYYY-MM-DD}-{slug}.md`

## Frontmatter

```yaml
---
type: report
report_type: briefing | pulse | ingest_report | task_report | weekly_review | learning_review | migration | health_check
title:
period:
status: draft | final
created:
updated:
sources: []
---
```

## Body

```markdown
## Executive Summary

## Scope

## What Changed / What Was Checked

## Key Findings

## Issues

## Next Actions

## Evidence
```

## Anti-Patterns

- Do not hide failures or skipped items.
- Do not duplicate source material without links.
- Do not write reports that cannot be traced back to pages or sources.
