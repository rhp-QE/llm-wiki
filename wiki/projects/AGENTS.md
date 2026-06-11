# Projects Schema

## Contract

Project pages should make state and next actions clear.

Project-local tasks can live under `## Tasks`, but serious tracked todos should also have canonical task pages under `wiki/tasks/` and dashboard entries in `todo.md`.

## When To Use

Use this domain for ongoing initiatives, product ideas, experiments, repository work, and efforts with state, decisions, next actions, or outcomes.

Do not turn every vague idea into a project.

## How To Update

1. State goal, current state, decisions, and next actions.
2. Link related tasks, tech pages, learning paths, events, and reports.
3. Promote serious tracked todos through the task workflow.
4. Run the Task Impact Pass when project evidence changes task progress.

## Page Location

`wiki/projects/{slug}.md`

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

## Task Progress Signals

## Related Knowledge

## Log
```

## Anti-Patterns

- Do not convert every idea into a project.
- Do not hide stalled status; mark it explicitly.
- Do not let serious tracked todos exist only as project-page bullets.
- Do not let project execution progress exist only on the project page. If a project note advances or changes a canonical task, update the task page, task progress cache, `todo.md`, and `wiki/tasks/任务.md`, then list the affected task under `## Task Progress Signals` or `## Tasks`.
