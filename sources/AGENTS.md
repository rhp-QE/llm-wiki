# Sources Rules

`sources/` is the evidence layer.

## Contract

- Preserve source fidelity.
- For user-provided material, preserve the exact original payload verbatim in `## Raw Material`. This is a hard constraint for Ingest and migration, not a best effort.
- Do not convert sources into polished summaries in place.
- Add only minimal metadata needed for provenance, status, or ingestion, and keep it outside the verbatim raw block.

## Recommended Frontmatter

```yaml
---
type: source
source_type: article | book | chat | diary | learning | media | note | idea | project | qa | reflection | task_evidence | other
title:
origin:
created:
captured:
status: new | ingested | ignored | needs-review | example
rating: 1-5
delivery:
original_payload:
raw_preservation:
content_form:
original_url:
accessed:
fetch_status:
archive_policy:
coverage:
importance:
preservation_limit:
learning_intent:
learning_state:
counts_as_progress:
priority:
progress_evidence:
task_page:
task_event:
task_evidence_scope:
tags: []
---
```

## Ingest Expectations

When a source is ingested:

- Archive user-provided raw material before writing compiled pages.
- Preserve wording, line breaks, order, and fragment boundaries inside `## Raw Material`.
- Do not summarize, translate, normalize, clean up, omit, or rewrite inside the raw block.
- Do not add an outer triple-backtick fence around Markdown-like raw material. Diary, note, reflection, project, chat, and article sources should render naturally under `## Raw Material`; only preserve code fences that were present in the original payload.
- Create or update compiled pages under `wiki/`.
- Link compiled pages back to the source path.
- Update source `status` when frontmatter exists.
- Log the ingest in the active monthly log under `wiki/logs/YYYY-MM.md`. Keep `wiki/log.md` as the log index.

## URL-Backed Sources

A URL is an origin/delivery mechanism. It is not itself a source type and must not force routing to `tech`, `learning`, or `article`.

For URL-backed material:

- Preserve `original_url`, `accessed`, and `fetch_status` when available.
- A URL-only submission is not the full original linked content. Preserve the URL plus user context, then create a bounded evidence package unless full archival is justified by policy or explicitly requested.
- If the user pasted or uploaded the linked article/chat/page content itself, preserve that user-provided payload verbatim under `## Raw Material`.
- If fetching succeeds, preserve a bounded evidence package before compiled wiki updates. The package should include source metadata, user context, AI core extraction, key supported claims, selected short excerpts or anchors, coverage, and fetch status.
- Do not store full linked content by default. Use `archive_policy: full` only for short, uniquely important, unavailable, user-provided, or explicitly requested material.
- Treat `important`, `importent`, `非常重要`, `重要`, and equivalent user wording as importance markers. For important chat records, decisions, reusable answers, and personal insights, preserve the core information as carefully as possible.
- If important URL-linked or fetched material is very large, avoid full archival by default. Use `archive_policy: excerpted`, `importance: important` or `very-important`, and `preservation_limit: core-extraction-500-zh-chars`; keep the core extraction within 500 Chinese characters plus selected evidence anchors. If the user pasted or uploaded the content itself, preserve that user-provided payload verbatim and put any bounded AI extraction outside `## Raw Material`.
- If fetching fails, preserve the URL and user context with `fetch_status: failed` and `status: needs-review`; do not invent the linked content.
- Choose `source_type` and destination directory from content:
  - chat/conversation -> `sources/chats/`
  - article, documentation, essay, newsletter, gist, or post -> `sources/articles/`
  - media or transcript -> `sources/media/`
  - user learning note attached to URL -> `sources/learning/`
  - ambiguous material -> `sources/notes/` with `source_type: note` and `status: needs-review`
- Route compiled knowledge by primary subject after source preservation.
- Later Query should use the preserved local source first and should not re-fetch the live URL unless the user explicitly asks or the local evidence is missing.

## Source Aggregation

For `inbox/` ingest, do not create one source per small fragment by default. First inventory the inbox and group compatible fragments.

Allowed grouping requires all of:

- Same explicit source type.
- Same natural date or topic.
- Compatible origin/context.
- Preserved fragment boundaries inside the source.

Never merge different source types just because they arrived in the same inbox batch. Keep `diary` and `learning` separate. Keep diary separate from article, chat, project, and technical-note sources. If grouping is unclear, create separate source groups or use `source_type: note` with `status: needs-review`.

Grouped source files should preserve each fragment with an ID and original path, for example `f001` from `inbox/...`.
Each grouped fragment's raw content must remain verbatim; grouping may add headings and metadata, but must not rewrite fragment bodies.

## Diary Classification

Only route material to `sources/diary/` when an explicit `diary` / `日记` marker is present in metadata, title, filename, or user instruction. Do not infer diary from emotion, daily routine, first-person writing, or "today" alone.

If the source type is ambiguous, use `source_type: note` and `status: needs-review` instead of guessing `diary`.

Do not delete sources after ingest.

## Task Evidence Sources

Use `sources/tasks/` for source-worthy long-term task evidence. This is for durable goals and execution history, not for ordinary task state.

Create or update a task evidence source when a task or task update records:

- A long-term, ongoing, recurring, routine, habit-forming, important, or review-worthy goal.
- A meaningful execution event: check-in with observation, milestone, substantial progress, repeated practice, missed routine with reason, blocker, unblock condition, failure, abandonment reason, completion outcome, or weekly/monthly review.
- Project, learning, health, career, relationship, or life evidence that future agents should be able to rebuild from `sources/`.

Do not create task evidence sources for lightweight one-off todos, dashboard reordering, simple status moves, typo fixes, priority changes without context, or daily done/not-done checkboxes with no user-provided observation.

Preserve user-provided task/update wording verbatim in `## Raw Material`. For repeated updates on one long-term task, prefer grouped monthly records and preserve each update as a fragment with timestamp, origin, and original order.

## Skill Progress Metadata

Use `learning_intent`, `learning_state`, `counts_as_progress`, `priority`, and `progress_evidence` only when the source is part of a skill tree or learning-progress workflow.

Do not add these fields to ordinary diary, people, event, relationship, or factual life sources unless the source explicitly records learning, practice, or skill use.

Saved-for-later links and not-started topics should use `counts_as_progress: false`. They may support a `Saved For Later` section in a learning path, but they must not be treated as real study progress.
