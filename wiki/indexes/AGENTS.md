# Indexes Schema

## Contract

Index pages are retrieval accelerators over canonical wiki pages and source paths. They are not sources of truth and should not replace domain pages, map pages, or reports.

## When To Use

Use this domain for generated or curated lookup pages that help agents and humans quickly find entities, aliases, timelines, sources, tasks, learning topics, projects, or reports.

Do not use this domain for narrative synthesis. Put narrative synthesis in domain pages or reports.

## How To Update

1. Identify the canonical domains included in the index.
2. Link to canonical wiki pages and source paths; do not duplicate long summaries.
3. Mark whether the index is generated or manually curated.
4. Refresh indexes after migration, large ingest, schema changes, or lint repairs that affect discoverability.
5. Mark stale indexes with `status: stale` when source pages changed but the index was not rebuilt.

## Page Location

`wiki/indexes/{slug}.md`

Common pages:

- `wiki/indexes/索引.md`: index entry point
- `wiki/indexes/entities.md`: entity and page lookup
- `wiki/indexes/aliases.md`: alias lookup
- `wiki/indexes/timeline.md`: dated event/source lookup
- `wiki/indexes/sources.md`: source manifest

## Frontmatter

```yaml
---
type: index | entity_index | timeline_index | source_index | alias_index
title:
status: active | draft | stale | retired
scope:
generated: true | false
updated:
sources: []
tags:
  - index
---
```

## Body

```markdown
# {Index Title}

## Scope

## How To Use

## Entries

## Staleness / Rebuild Notes
```

## Anti-Patterns

- Do not duplicate full domain summaries.
- Do not make indexes the only place where a relationship exists.
- Do not link raw sources in Obsidian-facing maps when an index would be a better retrieval surface.
- Do not leave generated indexes marked `active` when they are known to be stale.
