# Self Profile Schema

## Contract

Self profile pages compile source-backed understanding of the user across identity, values, tendencies, pressures, recovery patterns, and current direction.

They are cross-domain views. They should summarize from people, events, themes, reflections, projects, tasks, and source files without replacing those canonical pages.

## When To Use

Use this domain for:

- self-portrait or self-profile pages
- identity snapshots
- long-running "what kind of person am I?" answers
- compiled values, drivers, and direction summaries
- cross-domain personal operating patterns

Do not use this domain for ordinary people pages, single reflections, one-off mood notes, or unsourced personality labels.

## How To Update

1. Read compiled pages first: people/self, relevant events, themes, reflections, projects, and tasks.
2. Return to `sources/` for evidence before making non-trivial claims.
3. Mark unsupported synthesis as `Inference` or `Needs evidence`.
4. Preserve time context for changing facts, values, routines, work state, and relationships.
5. Link back to canonical domain pages instead of duplicating their full content.
6. Update the page after meaningful ingest that changes identity, direction, values, repeated patterns, or major life context.

## Page Location

`wiki/self/{slug}.md`

Default canonical page:

- `wiki/self/自我画像.md`

## Frontmatter

```yaml
---
type: self_profile
title:
aliases: []
status: emerging | active | stable | needs-review
updated:
sources: []
tags: []
---
```

## Body

```markdown
## Executive Summary

## Current Snapshot

## Stable Facts

## Traits / Tendencies

## Values / Drivers

## Pressures / Risks

## Recovery / Support Patterns

## Evidence Timeline

## Related Pages

## Open Questions

## Sources
```

## Anti-Patterns

- Do not invent personality traits from generic model knowledge.
- Do not treat a short recent diary cluster as a complete personality profile.
- Do not duplicate full event, theme, or reflection summaries here.
- Do not hide uncertainty; use `Inference` and `Needs evidence`.
- Do not write time-varying facts without an "as of" date or timeline entry.
