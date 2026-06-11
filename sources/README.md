# Sources

This directory stores raw materials and evidence.

Rules:

- Preserve user-provided original payloads verbatim in `## Raw Material`. This includes wording, line breaks, order, and fragment boundaries.
- Treat source files as read-only after archival.
- Add frontmatter only when useful for provenance, and keep metadata outside the verbatim raw block.
- Compiled conclusions belong in `wiki/`, not here.
- Do not summarize, translate, normalize, clean up, omit, or rewrite inside `## Raw Material`.
- Direct lightweight todos unrelated to durable personal growth, knowledge, projects, events, or sources do not need source files; route them to the task system.
- Source-worthy long-term task goals and execution history do need source files under `sources/tasks/`. Preserve the user's raw task/update wording; do not archive lightweight dashboard state or mechanical status changes.

Suggested subdirectories:

- `articles/`: external articles, documentation pages, essays, newsletters, gists, posts, and article-like web captures
- `books/`: book notes and chapter summaries
- `chats/`: useful conversation excerpts
- `diary/`: personal diary and life notes
- `learning/`: raw learning notes
- `media/`: image, video, podcast, or transcript notes
- `tasks/`: long-term task goals, meaningful check-ins, milestones, failures, blockers, reviews, and outcomes
- `notes/`: miscellaneous or ambiguous notes that need review

URL-backed sources should be stored by content form, not by the fact that they arrived as links. For example, a chat link belongs under `chats/`, a documentation or article link under `articles/`, and a video transcript under `media/`. If content form is unclear, use `notes/` with `source_type: note` and `status: needs-review`.
