# People Schema

## Contract

People pages should explain who the person is in relation to the user, not just who the person is objectively.

## Page Location

`wiki/people/{slug}.md`

## Frontmatter

```yaml
---
type: person
title:
aliases: []
relationship:
importance: low | medium | high
status: active | historical | unknown
tags: []
created:
updated:
---
```

## Body

```markdown
## Executive Summary

## Relationship

## Key Interactions

## Influence on Me

## Related Events

## Network

## Timeline

## Open Questions

## Sources
```

## Anti-Patterns

- Do not merge people only because names look similar.
- Do not describe a personally important person with a generic biography.
- Do not omit aliases when the source uses nicknames or family terms.
