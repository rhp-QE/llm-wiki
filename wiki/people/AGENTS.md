# People Schema

## Contract

People pages should explain who the person is in relation to the user, not just who the person is objectively.

## When To Use

Use this domain for family members, friends, colleagues, mentors, public thinkers, and recurring people whose relationship, influence, aliases, or interaction history matters.

## How To Update

1. Check aliases before creating a new person page.
2. Prefer stable names and keep nicknames or alternate spellings in `aliases`.
3. Link related events, themes, projects, and network pages when supported.
4. Mark uncertain identity or relationship facts as `Needs evidence`.

## Page Location

`wiki/people/{中文主名}.md`

Use the person's stable Chinese name as the filename when the natural name is Chinese. Do not add mutable details such as job, location, school, or relationship to the filename. Keep pinyin, former typos, nicknames, and alternate names in `aliases`.

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
- Do not use pinyin as the primary filename for a Chinese person when the Chinese name is known.
- Do not add mutable identity details such as workplace, location, or relationship to the filename.
