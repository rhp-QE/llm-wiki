# Reports Schema

## Contract

Reports should make wiki work visible and actionable. A report must state scope, what changed or was checked, what matters, and what should happen next.

## Page Location

`wiki/reports/{YYYY-MM-DD}-{slug}.md`

## Frontmatter

```yaml
---
type: report
report_type: briefing | pulse | task_report | weekly_review | learning_review | migration | health_check
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
