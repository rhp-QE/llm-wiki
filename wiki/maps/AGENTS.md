# Maps Schema

## Contract

Map pages are Obsidian-facing Maps of Content. They organize navigation across existing wiki pages and should not become a second source of truth.

## Page Location

`wiki/maps/{slug}.md`

## Frontmatter

```yaml
---
type: map
title:
status: active | draft | retired
scope:
tags:
  - map
created:
updated:
---
```

## Body

```markdown
# {Map Title}

## How To Use This Map

## Core Pages

## Current Threads

## Cross-Domain Links

## Review / Maintenance
```

## Rules

- Prefer linking to canonical domain pages instead of duplicating their content.
- Use maps for human navigation, not agent workflow rules.
- Keep each map focused enough to fit on one Obsidian screen when collapsed by headings.
- If a map introduces a relationship not present elsewhere, link to the evidence page or mark it as `Navigation inference`.
- Update map pages only when a new page changes visual navigation or an existing hub becomes stale.

## Anti-Patterns

- Do not turn maps into generic dashboards with every file in the vault.
- Do not duplicate source summaries here.
- Do not create a map for a single isolated page.
- Do not use maps to bypass domain `AGENTS.md` schemas.
