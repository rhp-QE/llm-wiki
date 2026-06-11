# Policy: Learning Progress

Use this policy only for skill trees, learning paths, technical mastery tracking, practice records, and sources routed to `wiki/learning/` or `wiki/tech/`.

Do not apply skill-progress fields to objective facts such as diary events, people, relationships, factual life notes, or ordinary project chronology unless the material explicitly records learning, practice, or skill use.

## Required Classification

Before updating learning paths, tech mastery status, review queues, or practice tasks, classify:

- `learning_intent`: `active-study`, `future-reference`, `background-reading`, `review`, `archive-only`, or `unknown`
- `learning_state`: `not-started`, `saved`, `skimmed`, `studied`, `practiced`, `applied`, `validated`, or `unknown`
- `counts_as_progress`: `true` only when the source shows real study, practice, application, or validation
- `priority`: `low`, `medium`, `high`, or `unknown`
- `progress_evidence`: the evidence used for classification

## Rules

- Saved-only links, future-reference material, not-started topics, and skimmed material do not count as learning progress.
- Saved material may update `Saved For Later`.
- Only real study, practice, application, or validation can update `Recently Learned`, raise tech status to `understood`, `applied`, or `validated`, or count as progress.
- If ambiguous, use `unknown` / `counts_as_progress: false` and list the ambiguity in final output or the monthly log.

