# Mental Models Schema

## Contract

Mental model pages should connect abstract models to the user's actual experiences and decisions.

## When To Use

Use this domain for thinking models, decision patterns, cognitive biases, reasoning frames, and reusable lenses for interpreting events or choices.

## How To Update

1. Define the model briefly.
2. Link lived examples, events, themes, projects, or source files with standard relative Markdown links.
3. Mark unsupported application as `Inference` or `Needs evidence`.
4. Link related models and failure modes.

## Page Location

`wiki/models/{slug}.md`

## Frontmatter

```yaml
---
type: mental_model
title:
aliases: []
source_influences: []
tags: []
created:
updated:
---
```

## Body

```markdown
## Executive Summary

## Definition

## How I Use It

## Personal Examples

## Failure Modes

## Related Themes

## Related Events

## Sources
```

## Anti-Patterns

- Do not copy generic definitions without personal application.
- Do not claim the user uses a model unless supported by notes or explicit user input.
