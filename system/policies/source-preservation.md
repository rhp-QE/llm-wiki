# Policy: Source Preservation

This is a hard gate for Ingest and Migration.

## Hard Rules

- User-provided durable material must be preserved in `sources/` before compiled `wiki/` pages are written.
- The `## Raw Material` block must preserve wording, line breaks, order, and fragment boundaries.
- Do not summarize, translate, normalize, clean up, omit, or rewrite inside `## Raw Material`.
- Do not wrap Markdown-like diary, note, reflection, project, chat, or article raw material in an extra code fence. Preserve it directly under `## Raw Material` so it remains readable as Markdown. Only keep code fences that were part of the original payload.
- Metadata, archival notes, AI extraction, and compiled summaries may appear outside the raw block.
- If the payload cannot be preserved, stop the ingest or keep the material in `inbox/` / `sources/notes/` with `status: needs-review`.
- Source files are evidence, not polished wiki pages.
- For incremental updates with the same date, primary subject, semantic topic, compatible source type/content form, and compatible origin, append a new fragment to the existing source file instead of creating a duplicate source file.
- Preserve each appended fragment's raw payload verbatim and record fragment timing/context metadata outside `## Raw Material`.

## Durable Material

Durable material is user-owned or user-provided material worth preserving as original evidence for future rebuilding, querying, and citation.

When durable material is delivered through a URL, the URL is only the delivery mechanism. If the user identifies the linked content as their own diary, life note, learning note, project record, reflection, draft, chat export, or other durable payload, preserve the linked content as raw source material when accessible.

If linked durable material is too large for one practical source file, preserve it in ordered chunks or record a stable imported file path with coverage metadata. Do not use a summary as a substitute for raw preservation.

If linked durable material cannot be accessed or preserved, do not write compiled personal facts from it. Keep the URL and user context with `status: needs-review`.

## Applies To

- pasted notes
- uploaded or imported file content
- inbox captures
- diary and life notes
- learning notes
- chat excerpts
- reflections
- project notes
- task evidence that passes the Task Evidence Gate
- other durable material the user asks to ingest

## Exceptions

- Lightweight one-off todos unrelated to durable growth, knowledge, projects, events, or sources stay in the task system.
- URL-only submissions preserve URL/context and usually a bounded evidence package; they are not treated as if the user provided full linked text.
- Third-party or external URL-backed material is usually preserved as bounded evidence, not full text, unless the full archive is explicitly justified.

## Source Grouping

Before creating a new source file for any ingest or update, check whether an existing source should receive the new fragment.

Append to an existing source when all are true:

- same natural date or update date
- same primary subject
- same semantic topic or thought thread
- same explicit source type/content form
- compatible origin/context

Create a new source only when source type/content form differs, the topic differs, the natural date differs, origin/context is incompatible, or the grouping would risk merging distinct entities or topics.

## Inbox Grouping

When ingesting `inbox/`, inventory pending fragments first. Group only compatible fragments:

- same explicit source type
- same natural date or topic
- compatible origin/context

Preserve each fragment with ID, capture timestamp when available, original inbox path, and original order.
