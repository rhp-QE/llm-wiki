# Sources Rules

`sources/` is the evidence layer.

## Contract

- Preserve source fidelity.
- Do not convert sources into polished summaries in place.
- Add only minimal metadata needed for provenance, status, or ingestion.

## Recommended Frontmatter

```yaml
---
type: source
source_type: article | book | chat | diary | learning | media | note | idea | project | qa | reflection | other
title:
origin:
created:
captured:
status: new | ingested | ignored | needs-review | example
rating: 1-5
delivery:
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
tags: []
---
```

## Ingest Expectations

When a source is ingested:

- Create or update compiled pages under `wiki/`.
- Link compiled pages back to the source path.
- Update source `status` when frontmatter exists.
- Log the ingest in the active monthly log under `wiki/logs/YYYY-MM.md`. Keep `wiki/log.md` as the log index.

## URL-Backed Sources

A URL is an origin/delivery mechanism. It is not itself a source type and must not force routing to `tech`, `learning`, or `article`.

For URL-backed material:

- Preserve `original_url`, `accessed`, and `fetch_status` when available.
- If fetching succeeds, preserve a bounded evidence package before compiled wiki updates. The package should include source metadata, user context, AI core extraction, key supported claims, selected short excerpts or anchors, coverage, and fetch status.
- Do not store full linked content by default. Use `archive_policy: full` only for short, uniquely important, unavailable, user-provided, or explicitly requested material.
- Treat `important`, `importent`, `非常重要`, `重要`, and equivalent user wording as importance markers. For important chat records, decisions, reusable answers, and personal insights, preserve the core information as carefully as possible.
- If important material is very large, avoid full archival by default. Use `archive_policy: excerpted`, `importance: important` or `very-important`, and `preservation_limit: core-extraction-500-zh-chars`; keep the core extraction within 500 Chinese characters plus selected evidence anchors.
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

## Diary Classification

Only route material to `sources/diary/` when an explicit `diary` / `日记` marker is present in metadata, title, filename, or user instruction. Do not infer diary from emotion, daily routine, first-person writing, or "today" alone.

If the source type is ambiguous, use `source_type: note` and `status: needs-review` instead of guessing `diary`.

Do not delete sources after ingest.

## Skill Progress Metadata

Use `learning_intent`, `learning_state`, `counts_as_progress`, `priority`, and `progress_evidence` only when the source is part of a skill tree or learning-progress workflow.

Do not add these fields to ordinary diary, people, event, relationship, or factual life sources unless the source explicitly records learning, practice, or skill use.

Saved-for-later links and not-started topics should use `counts_as_progress: false`. They may support a `Saved For Later` section in a learning path, but they must not be treated as real study progress.
