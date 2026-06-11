# Tech Schema

## Contract

Tech pages should be reusable during coding, learning, debugging, and writing. Prefer precise examples and common pitfalls over vague summaries.

## When To Use

Use this domain for durable technical truth: concepts, syntax, repos, implementation patterns, architecture notes, and debugging incidents.

Do not use this domain as the only record of the user's learning progress; link learning paths when mastery state matters.

## How To Update

1. Archive or cite source evidence first through the active workflow.
2. Use precise examples and pitfalls.
3. Link related concepts, Q&A, learning paths, projects, and sources.
4. Apply `system/policies/learning-progress.md` before changing mastery status.

## Page Location

- `wiki/tech/{topic}.md`
- `wiki/tech/{language}/syntax/{topic}.md`
- `wiki/tech/{area}/{slug}.md`

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
status: learning | understood | applied | validated | example
learning_state: not-started | saved | skimmed | studied | practiced | applied | validated | unknown
progress_evidence: []
tags: []
created:
updated:
---
```

Use `learning_state` and `progress_evidence` when a technical page is part of the user's skill tree. Do not add these fields for objective factual pages that are not tracking the user's mastery.

Status rules:

- `learning`: the user is learning, has notes, or the concept is newly captured but not yet applied.
- `understood`: source evidence shows the user can explain the concept or has studied it with durable notes.
- `applied`: source evidence shows exercises, demos, project use, or work use.
- `validated`: source evidence shows repeated use, tests, review, or stable reproduction.
- `example`: scaffold or demo page; does not count as real mastery.

Saved-for-later links, not-started topics, and skimmed articles must not raise a tech page to `understood`, `applied`, or `validated`.

## Body for Concepts / Syntax

```markdown
## Compiled Truth

## Why It Matters

## Examples

## Mastery Evidence

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
- Do not confuse external reference value with the user's mastery. A useful saved article can be evidence for the source, but it is not proof that the user learned, practiced, or applied the topic.
