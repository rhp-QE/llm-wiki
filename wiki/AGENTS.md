# Wiki Layer Rules

`wiki/` is the compiled knowledge layer. It is meant to be read directly by the user and by agents.

## Page Pattern

Prefer this pattern for durable pages:

1. YAML frontmatter
2. Executive summary or compiled truth
3. Current state
4. Details or examples
5. Links to related pages
6. Timeline or evidence
7. Open questions

## Evidence

Every page should make clear which parts are:

- From source material
- User-stated
- Agent inference
- Needs verification

## Internal Links

Use `[[wikilink]]` style for related pages. If exact Obsidian paths are useful, use relative links in addition to wikilinks.

## Update Policy

When updating a page:

- Preserve useful prior conclusions unless evidence contradicts them.
- Move obsolete conclusions to a history or timeline section instead of silently deleting them.
- Add a log entry for meaningful changes.
