# Policy: URL Evidence

URLs are delivery/origin metadata. They are not a source type and do not imply a target domain.

## Core Distinctions

- Reading/fetching linked content is for understanding, routing, and evidence extraction.
- Archiving decides what is preserved under `sources/`.
- Compilation writes durable `wiki/` pages from preserved evidence.
- Do not bind those three actions together just because an input contains a URL.

## Inbox Capture

- Save only URL, capture time, and user-provided context.
- Do not fetch, summarize, classify, or route the URL.
- Do not create `sources/` or compiled `wiki/` pages.

## Ingest

- Treat the URL as `delivery: url`.
- A URL-only submission is not full original linked content.
- For explicit Ingest of URL-backed material, attempt to read/fetch accessible linked content for understanding unless the user asks for metadata-only capture or access is unavailable.
- Create a bounded evidence package when possible:
  - metadata
  - original URL
  - access/fetch status
  - user context
  - AI core extraction
  - key supported claims
  - selected short excerpts or anchors
  - coverage
- Do not store full linked content by default for third-party or external material.
- Store full linked content for third-party or external material only when it is short, uniquely important and not huge, unavailable elsewhere, or explicitly requested.
- If the user identifies the linked material as their own durable material, such as a diary Markdown, personal note, project record, learning note, reflection, draft, or chat export, treat it as user-provided durable material rather than URL-only material.
- For user-owned durable material, attempt to read/fetch the full content and preserve it verbatim in `## Raw Material` before writing compiled `wiki/` pages.
- For very large third-party or external content, use a core extraction capped at 500 Chinese characters plus evidence anchors.
- For very large user-owned durable material, preserve the raw source by ordered chunks, stable imported file path, or another auditable full-preservation method. Do not replace raw preservation with a summary.
- If fetching fails, preserve URL and user context with `fetch_status: failed` or `status: needs-review`.
- If fetching user-owned durable material fails, do not compile personal facts from the URL alone.

## Classification

Classify by content form and primary subject:

- chat/conversation -> `sources/chats/`
- article/documentation/essay/newsletter/gist/post -> `sources/articles/`
- video/podcast/transcript/screenshot/media -> `sources/media/`
- actual learning note -> `sources/learning/`
- explicit diary or life log -> `sources/diary/`
- personal project record -> `sources/notes/` or `sources/tasks/` when it is task evidence
- ambiguous -> `sources/notes/` with `source_type: note`

## Query

Use local preserved URL evidence first. Re-fetch live URLs only when explicitly asked or when local evidence is missing and the answer cannot be supported without it.
