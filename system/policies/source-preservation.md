# Policy: Source Preservation

This is a hard gate for Ingest and Migration.

## Hard Rules

- User-provided durable material must be preserved in `sources/` before compiled `wiki/` pages are written.
- The `## Raw Material` block must preserve wording, line breaks, order, and fragment boundaries.
- Do not summarize, translate, normalize, clean up, omit, or rewrite inside `## Raw Material`.
- Metadata, archival notes, AI extraction, and compiled summaries may appear outside the raw block.
- If the payload cannot be preserved, stop the ingest or keep the material in `inbox/` / `sources/notes/` with `status: needs-review`.
- Source files are evidence, not polished wiki pages.

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

## Inbox Grouping

When ingesting `inbox/`, inventory pending fragments first. Group only compatible fragments:

- same explicit source type
- same natural date or topic
- compatible origin/context

Preserve each fragment with ID, capture timestamp when available, original inbox path, and original order.

