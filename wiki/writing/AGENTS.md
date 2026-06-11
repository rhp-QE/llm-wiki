# Writing Schema

## Contract

Writing pages should connect material, arguments, drafts, and publication variants.

## When To Use

Use this domain for user-originated article ideas, drafts, outlines, scripts, voice rules, publication variants, and writing projects.

Do not turn ordinary queries or agent suggestions into writing ideas unless the user explicitly asks to capture them.

## How To Update

1. Confirm the idea, draft, or voice rule is user-originated or explicitly requested.
2. Link source materials and related wiki pages instead of duplicating large source excerpts.
3. Keep draft state explicit; do not mark a piece as published without user confirmation.
4. Preserve platform variants under one content unit when they share the same thesis.

## Suggested Structure

- `ideas.md`: user-originated writing ideas
- `articles/{slug}.md`: one content unit with all variants
- `voice.md`: durable style and voice rules

## Page Location

- `wiki/writing/ideas.md`
- `wiki/writing/articles/{slug}.md`
- `wiki/writing/voice.md`

## Frontmatter

For article pages:

```yaml
---
type: article
title:
status: idea | draft | final | published | retired
platforms: []
tags: []
created:
updated:
---
```

For idea pools or voice rules, use `type: writing_idea` or `type: voice`.

## Important Boundary

Do not automatically add ideas to `ideas.md` unless the user explicitly states an idea or asks to capture it. This protects the idea pool as user-originated material.

## Body

```markdown
## Thesis

## Source Materials

## Outline

## Draft

## Platform Variants

## Revision Log

## Links
```

## Anti-Patterns

- Do not turn every query into a writing idea.
- Do not publish or mark as published without user confirmation.
