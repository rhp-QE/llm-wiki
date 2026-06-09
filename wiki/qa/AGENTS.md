# Q&A Schema

## Contract

Q&A pages should be short, precise, and linked to the underlying concept pages.

## Page Location

`wiki/qa/{slug}.md`

## Frontmatter

```yaml
---
type: qa
question:
topics: []
status: answered | partial | open
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
