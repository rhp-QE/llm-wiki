# Sources Rules

`sources/` is the evidence layer.

## Contract

- Preserve source fidelity.
- Do not convert sources into polished summaries in place.
- Add only minimal metadata needed for provenance, status, or ingestion.

## Recommended Frontmatter

```yaml
---
type: source
source_type: article | book | chat | diary | learning | media | note
title:
origin:
created:
captured:
status: new | ingested | ignored | needs-review
rating: 1-5
tags: []
---
```

## Ingest Expectations

When a source is ingested:

- Create or update compiled pages under `wiki/`.
- Link compiled pages back to the source path.
- Update source `status` when frontmatter exists.
- Log the ingest in `wiki/log.md`.

Do not delete sources after ingest.
