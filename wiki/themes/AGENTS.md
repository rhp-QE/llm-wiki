# Themes Schema

## Contract

Theme pages should synthesize repeated patterns across sources. They are not folders of quotes.

## When To Use

Use this domain for long-running patterns, concerns, tensions, values, or recurring threads that appear across multiple sources or events.

## How To Update

1. Link representative events, people, projects, models, and sources.
2. Preserve contradictions and changes over time.
3. Mark unsupported synthesis as `Inference` or `Needs evidence`.
4. Prefer updating an existing theme over creating a near-duplicate.

## Page Location

`wiki/themes/{slug}.md`

## Frontmatter

```yaml
---
type: theme
title:
aliases: []
status: emerging | active | stable | retired
tags: []
created:
updated:
---
```

## Body

```markdown
## Executive Summary

## Current Understanding

## Recurring Patterns

## Representative Events

## Related People

## Related Mental Models

## Tensions / Contradictions

## Timeline

## Open Questions

## Sources
```

## Anti-Patterns

- Do not create a theme from one isolated mention unless it is clearly important.
- Do not flatten contradictions; mark them explicitly.
