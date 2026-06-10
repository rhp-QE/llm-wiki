# Learning Schema

## Contract

Learning pages should help the user resume, review, and compound learning. They are not just summaries.

## Page Location

`wiki/learning/{domain}/{domain}-learning.md`

Use descriptive filenames for Obsidian graph readability. Avoid generic `index.md` learning pages.

## Body

```markdown
## Goal

## Current Level

## Map

## Recently Learned

## Weak Spots

## Review Queue

## Practice Tasks

## Linked Knowledge

## Sources
```

## Ingest Behavior

For new learning notes:

1. Archive the raw note under `sources/learning/`.
2. Update the relevant `wiki/tech/` or domain concept page.
3. Add durable questions to `wiki/qa/`.
4. Update this learning path.
5. Add review tasks to `todo.md` when useful.

## Anti-Patterns

- Do not mark a topic as mastered after one exposure.
- Do not generate too many review tasks; focus on weak spots and high-value concepts.
