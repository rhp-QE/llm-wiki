# Projects Schema

## Contract

Project pages should make state and next actions clear.

Project-local tasks can live under `## Tasks`, but serious personal todos should also have canonical task pages under `wiki/tasks/` and dashboard entries in `todo.md`.

## Frontmatter

```yaml
---
type: project
title:
status: idea | active | paused | done | abandoned
started:
updated:
tags: []
---
```

## Body

```markdown
## Goal

## Current State

## Context

## Decisions

## Tasks

## Related Knowledge

## Log
```

## Anti-Patterns

- Do not convert every idea into a project.
- Do not hide stalled status; mark it explicitly.
- Do not let serious tracked todos exist only as project-page bullets.
