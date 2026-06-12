# LLM Wiki Conventions

This file owns cross-cutting writing, linking, naming, bulk-work, and logging conventions. It should stay short; domain-specific page shape belongs in domain `AGENTS.md`, and allowed field values belong in `system/schema.md`.

## Source Discipline

- Sources are evidence; wiki pages are compiled understanding.
- Do not silently discard source context.
- Mark unsupported claims as `Inference` or `Needs evidence`.
- For incremental updates, reuse an existing same-day, same-primary-subject, same-semantic-topic source when source type/content form and origin are compatible. Append a new fragment/section with fragment metadata instead of creating a duplicate source file.
- Keep fragment metadata outside `## Raw Material`; the raw section must preserve only original payload text and fragment boundaries.

## Time-Sensitive Updates

- Time-varying facts such as current location, job, status, relationship state, progress, availability, and preferences must carry a captured/effective date.
- Compiled pages should say "as of {date}" or add a timeline entry for time-varying facts instead of presenting them as timeless truth.
- When newer evidence supersedes older time-varying information, preserve the older claim in source/timeline context instead of silently deleting it.

## Links

- Use standard relative Markdown links (`[label](relative/path.md)`) for associated document references by default. This includes wiki-to-wiki, wiki-to-source, source-to-wiki, maps, indexes, reports, and `Sources` sections.
- Do not leave associated local Markdown documents as non-clickable code paths such as ``sources/...`` or ``wiki/...`` when the reader is expected to jump to them.
- Code-form file paths are acceptable for audit inventories, command examples, literal directory ownership notes, or other cases where navigation is not the purpose.
- Avoid `[[...]]` as the default durable-page link format. Obsidian can follow standard Markdown links, and Markdown links are safer across VS Code, GitHub-style viewers, and both supported Obsidian vault roots.
- Every new durable page should have at least one incoming or outgoing link unless it is a deliberate orphan.
- Prefer links between concepts, people, events, themes, and models over only linking source files.
- For Obsidian browsing, maintain `wiki/首页.md` and focused 内容地图 under `wiki/maps/`.
- Avoid linking README, AGENTS, and agent `index.md` files from Obsidian-facing maps.
- Obsidian-facing entry pages should use relative Markdown links when they must resolve in both the full repository vault and the clean `wiki/` vault.
- After every mutating update, validate that newly added or changed local Markdown links resolve to the intended files.

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
