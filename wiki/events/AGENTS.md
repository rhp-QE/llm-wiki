# Events Schema

## Contract

Event pages should preserve chronology and explain why the event mattered.

## When To Use

Use this domain for meaningful episodes, decisions, turning points, conflicts, milestones, failures, recoveries, or repeated events that need chronology.

Do not create an event page for every small note.

## How To Update

1. Preserve or cite the source first through the active workflow.
2. Record chronology, involved people, related themes, consequences, and open questions.
3. Link people, themes, projects, tasks, or reports when the relationship is supported.
4. Run the Task Impact Pass when the event affects tracked work.

## Page Location

`wiki/events/{YYYY-MM-DD-or-period}-{slug}.md`

## Frontmatter

```yaml
---
type: event
title:
date:
period:
people: []
themes: []
tags: []
created:
updated:
---
```

## Body

```markdown
## Executive Summary

## Context

## What Happened

## Why It Mattered

## People Involved

## Consequences

## Related Tasks

## Related Themes

## Evidence Timeline

## Open Questions

## Sources
```

## Anti-Patterns

- Do not turn every small note into an event page.
- Do not omit emotional or decision context when it is present in the source.
- Do not detach events from people and themes.
- Do not hide task impacts inside prose. If an event/source completes, advances, blocks, drops, or creates tracked work, list the affected tasks under `## Related Tasks` and update the task system through the Task Impact Pass.
