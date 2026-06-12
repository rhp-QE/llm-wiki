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

Use Obsidian wikilink style for conceptual relationships between durable pages. Use relative Markdown links on Obsidian-facing navigation and index pages that must work in both the full repository vault and the clean `wiki/` vault.

## Obsidian View Layer

`wiki/首页.md` and `wiki/maps/` are human-facing navigation surfaces for Obsidian.

- `wiki/首页.md` is the default human entry point.
- `wiki/maps/` contains 内容地图 that connect existing pages across domains.
- Map pages should link to canonical domain pages instead of duplicating source summaries.
- When a new page becomes a durable hub, active project, important theme, or useful learning path, update the relevant map.
- Do not store agent workflow rules in map pages; keep operational rules in `system/`.

## Update Policy

When updating a page:

- Preserve useful prior conclusions unless evidence contradicts them.
- Move obsolete conclusions to a history or timeline section instead of silently deleting them.
- Add a log entry for meaningful changes.
