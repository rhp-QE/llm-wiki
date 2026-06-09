# LLM Wiki Conventions

These are cross-cutting rules for all wiki operations.

## Source Discipline

- Sources are evidence; wiki pages are compiled understanding.
- Do not silently discard source context.
- Mark unsupported claims as `Inference` or `Needs evidence`.

## Links

- Use `[[wikilink]]` for internal knowledge links.
- Every new durable page should have at least one incoming or outgoing link unless it is a deliberate orphan.
- Prefer links between concepts, people, events, themes, and models over only linking source files.

## Naming

- Use clear lowercase slugs for filenames when the title is English.
- Use stable Chinese titles when the natural entity name is Chinese.
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

## Bulk Work

For more than 20 source files:

1. Sample 3-10 representative files.
2. Produce proposed schema changes and sample outputs.
3. Ask for user review when classification choices are subjective.
4. Then process in batches.

## Logging

Update `wiki/log.md` after meaningful changes.

Minimum log fields:

- Operation
- Inputs
- Created
- Updated
- Open questions
