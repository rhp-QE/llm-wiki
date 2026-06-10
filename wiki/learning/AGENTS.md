# Learning Schema

## Contract

Learning pages should help the user resume, review, and compound learning. They are not just summaries.

## When To Use

Use this domain for ongoing study paths, skill acquisition, review queues, weak spots, practice tasks, and learning progress over time.

Do not use this domain as the primary home for a technical concept. Put durable technical truth in `wiki/tech/`, then link it from the learning path.

Use `Saved For Later` for learning-adjacent links or materials the user has not actually studied yet. A saved link is not learning progress.

## How To Update

1. Archive the raw note under `sources/` during Ingest; use `sources/learning/` only for actual learning notes or study sessions.
2. Classify `learning_intent`, `learning_state`, `counts_as_progress`, `priority`, and `progress_evidence` before updating this domain.
3. If the material is `future-reference`, `not-started`, `saved`, or skimmed without a durable takeaway, add it only to `Saved For Later` when useful; do not update `Recently Learned`.
4. Update the relevant `wiki/tech/` page only when the note contains reusable technical knowledge, and do not raise tech mastery status without practice/application evidence.
5. Add durable recurring questions to `wiki/qa/`.
6. Update the learning path's recent progress, weak spots, review queue, and practice tasks only when `counts_as_progress: true` or when a weak spot/review item is explicitly supported.
7. Keep example or scaffold material marked as `status: example` and do not count it as real progress.

## Page Location

`wiki/learning/{domain}/{domain}-learning.md`

Use descriptive filenames for Obsidian graph readability. Avoid generic `index.md` learning pages.

## Frontmatter

```yaml
---
type: learning_path
title:
domain:
status: learning | active | paused | validated | retired | example
focus: active-study | future-reference | background-reading | review | unknown
priority: low | medium | high | unknown
created:
updated:
---
```

## Body

```markdown
## Goal

## Current Focus

## Current Level

## Map

## Saved For Later

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
2. Classify learning intent and state before updating progress.
3. Update the relevant `wiki/tech/` or domain concept page only when there is reusable technical knowledge.
4. Add durable questions to `wiki/qa/`.
5. Update this learning path. Saved-for-later material belongs in `Saved For Later`; only actual study, practice, application, or validation belongs in `Recently Learned`.
6. Add review tasks to `todo.md` when useful.

## Anti-Patterns

- Do not mark a topic as mastered after one exposure.
- Do not treat a saved link, not-started topic, or skimmed article as learning progress.
- Do not apply learning progress fields to objective facts such as diary events, people, relationships, or ordinary life records.
- Do not generate too many review tasks; focus on weak spots and high-value concepts.
