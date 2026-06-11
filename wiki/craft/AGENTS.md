# Craft Schema

## Contract

Craft pages capture personal practice, not generic best practices.

## When To Use

Use this domain for engineering practices, debugging habits, review patterns, and experience-backed craft judgments that become more reliable through repeated use.

## How To Update

1. Link the practice to source evidence, events, projects, or concrete examples.
2. Set confidence from evidence: `emerging`, `established`, or `validated`.
3. Link related tech, project, or reflection pages when useful.
4. Do not upgrade confidence without repeated or validated evidence.

## Page Location

`wiki/craft/{slug}.md`

## Frontmatter

```yaml
---
type: craft_practice
title:
confidence: emerging | established | validated
contexts: []
tags: []
created:
updated:
---
```

## Body

```markdown
## Practice

## Why It Works

## When To Use

## When Not To Use

## Examples

## Evidence

## Related Pages
```

## Anti-Patterns

- Do not upgrade confidence without evidence.
- Do not store generic advice unless it is tied to the user's actual work.
