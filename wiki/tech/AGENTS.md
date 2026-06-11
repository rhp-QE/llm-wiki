# Tech Schema

## Contract

Tech pages should be reusable during coding, learning, debugging, and writing. Prefer precise examples and common pitfalls over vague summaries.

## Page Types

- `concept`: durable technical concept
- `syntax`: language syntax or semantics
- `repo`: project tracking page
- `pattern`: engineering pattern
- `debug_case`: debugging incident

## Frontmatter

```yaml
---
type: concept | syntax | repo | pattern | debug_case
title:
aliases: []
language:
status: learning | understood | applied | validated
tags: []
created:
updated:
---
```

## Body for Concepts / Syntax

```markdown
## Compiled Truth

## Why It Matters

## Examples

## Common Pitfalls

## Related Concepts

## Q&A

## Sources
```

## Go Learning Example

If the user learns a Go syntax point such as `defer`, update or create:

- `sources/learning/go/{date}-{topic}.md`
- `wiki/tech/go/syntax/{topic}.md`
- `wiki/qa/{topic-question}.md` when there is a durable question
- `wiki/learning/go/go-learning.md` for progress

## Anti-Patterns

- Do not store raw copied docs as compiled truth.
- Do not omit runnable examples when the topic is syntax.
- Do not treat unverified blog claims as facts without marking them.
