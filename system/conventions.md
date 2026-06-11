# LLM Wiki Conventions

This file owns cross-cutting writing, linking, naming, bulk-work, and logging conventions. It should stay short; domain-specific page shape belongs in domain `AGENTS.md`, and allowed field values belong in `system/schema.md`.

## Source Discipline

- Sources are evidence; wiki pages are compiled understanding.
- Do not silently discard source context.
- Mark unsupported claims as `Inference` or `Needs evidence`.

## Links

- Use `[[wikilink]]` for internal knowledge links.
- Every new durable page should have at least one incoming or outgoing link unless it is a deliberate orphan.
- Prefer links between concepts, people, events, themes, and models over only linking source files.
- For Obsidian browsing, maintain `wiki/首页.md` and focused 内容地图 under `wiki/maps/`.
- Avoid linking README, AGENTS, and agent `index.md` files from Obsidian-facing maps.
- Prefer path-qualified wikilinks for map targets, for example `[[wiki/maps/地图|地图]]`.
- Keep source evidence as plain paths unless the source should intentionally appear in the Obsidian graph.

## Naming

- Use clear lowercase slugs for filenames when the title is English.
- Use stable Chinese titles when the natural entity name is Chinese.
- For Chinese person pages, use the stable Chinese name as the filename and keep pinyin, former typos, nicknames, or alternate spellings in frontmatter aliases.
- Do not add mutable details such as workplace, location, school, or relationship to person filenames.
- Keep aliases in frontmatter instead of creating duplicate pages.

## Status Values

Use status fields to avoid pretending the wiki is more certain than it is:

- `new`
- `learning`
- `emerging`
- `active`
- `stable`
- `validated`
- `partial`
- `needs-review`
- `retired`
- `example`

See `system/schema.md` for domain-specific statuses such as `ingested`, `answered`, `draft`, `final`, `historical`, `unknown`, and `closed`.

Use `example` only for scaffold or demo material that should not count as real personal history, real learning progress, or validated knowledge.

## Bulk Work

For more than 20 source files:

1. Sample 3-10 representative files.
2. Produce proposed schema changes and sample outputs.
3. Ask for user review when classification choices are subjective.
4. Then process in batches.

## Logging

Update the active monthly log under `wiki/logs/YYYY-MM.md` after meaningful changes.

Use `wiki/log.md` as the short log index. Do not append detailed entries there unless updating the index itself.

Minimum log fields:

- Operation
- Inputs
- Created
- Updated
- Open questions
