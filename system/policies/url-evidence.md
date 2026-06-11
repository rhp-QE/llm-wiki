# Policy: URL Evidence

URLs are delivery/origin metadata. They are not a source type and do not imply a target domain.

## Inbox Capture

- Save only URL, capture time, and user-provided context.
- Do not fetch, summarize, classify, or route the URL.
- Do not create `sources/` or compiled `wiki/` pages.

## Ingest

- Treat the URL as `delivery: url`.
- A URL-only submission is not full original linked content.
- Create a bounded evidence package when possible:
  - metadata
  - original URL
  - access/fetch status
  - user context
  - AI core extraction
  - key supported claims
  - selected short excerpts or anchors
  - coverage
- Do not store full linked content by default.
- Store full linked content only when it is short, uniquely important and not huge, unavailable elsewhere, user-provided, or explicitly requested.
- For very large important content, use a core extraction capped at 500 Chinese characters plus evidence anchors.
- If fetching fails, preserve URL and user context with `fetch_status: failed` or `status: needs-review`.

## Classification

Classify by content form and primary subject:

- chat/conversation -> `sources/chats/`
- article/documentation/essay/newsletter/gist/post -> `sources/articles/`
- video/podcast/transcript/screenshot/media -> `sources/media/`
- actual learning note -> `sources/learning/`
- ambiguous -> `sources/notes/` with `source_type: note`

## Query

Use local preserved URL evidence first. Re-fetch live URLs only when explicitly asked or when local evidence is missing and the answer cannot be supported without it.

