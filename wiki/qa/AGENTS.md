# Q&A Schema

## Contract

Q&A pages should be short, precise, and linked to the underlying concept pages.

## When To Use

Use this domain for durable questions likely to recur, especially from learning, debugging, reading, and conversations.

Do not create Q&A pages for disposable one-off questions.

## How To Update

1. Keep the answer short and source-grounded.
2. Link underlying tech, learning, project, or source pages.
3. Mark partial or uncertain answers with `status: partial` or `status: open`.
4. Do not answer beyond evidence without marking inference.

## Page Location

`wiki/qa/{slug}.md`

## Frontmatter

```yaml
---
type: qa
question:
topics: []
status: answered | partial | open | example
created:
updated:
---
```

## Body

```markdown
## Question

## Short Answer

## Explanation

## Example

## Related Pages

## Sources
```

## Anti-Patterns

- Do not create a Q&A page for a disposable question.
- Do not answer beyond available evidence without marking inference.
