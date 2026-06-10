# Reflections Schema

## Contract

Reflection pages should preserve the user's voice and connect principles to lived examples.

## When To Use

Use this domain for principles, values, self-observations, identity-level notes, and meta-rules that guide action but are not themselves projects or tasks.

Do not use this domain to fabricate introspection from weak evidence. If the source is thin, mark `Needs evidence` or keep the claim as an open question.

## How To Update

1. Preserve the user's original phrasing when it carries meaning.
2. Link each reflection to lived examples such as events, projects, themes, or source paths.
3. Mark unsupported synthesis as `Inference` or `Needs evidence`.
4. Prefer updating an existing reflection page over creating a one-off principle page.

## Suggested Pages

- `principles.md`
- `self-observations.md`
- `values.md`

## Page Location

`wiki/reflections/{slug}.md`

## Frontmatter

```yaml
---
type: reflection
title:
aliases: []
status: emerging | stable | challenged | needs-review
tags: []
created:
updated:
---
```

## Body

```markdown
## Executive Summary

## Principle / Observation

## Evidence

## Lived Examples

## Related Events

## Related Themes

## Tensions

## Open Questions

## Sources
```

## Entry Pattern

```markdown
## Principle: {name}

- Status: emerging | stable | challenged
- Summary:
- Why it matters:
- Evidence:
- Related events:
- Tensions:
```

## Anti-Patterns

- Do not fabricate introspective conclusions.
- Do not over-polish away the user's own phrasing when the phrasing matters.
