# Lint Checklist

Use this checklist during `llm-wiki Lint`.

## Structure

- [ ] Top-level `AGENTS.md` exists.
- [ ] `wiki/index.md` exists.
- [ ] `wiki/home.md` exists.
- [ ] `wiki/log.md` exists.
- [ ] `wiki/logs/AGENTS.md` exists.
- [ ] Active monthly log exists under `wiki/logs/YYYY-MM.md`.
- [ ] `wiki/maps/maps.md` exists.
- [ ] `wiki/maps/AGENTS.md` exists.
- [ ] Active domains have `README.md` and `AGENTS.md`.
- [ ] `system/skills/llm-wiki/SKILL.md` exists.
- [ ] `system/evals/ingest-checklist.md` exists.
- [ ] `system/templates/ingest-plan.md` exists.

## Workflow Gates

- [ ] Mutating instructions require `system/resolver.md` preflight.
- [ ] Ingest instructions require nearest domain `AGENTS.md` before writes.
- [ ] Ingest instructions require checking existing pages and aliases.
- [ ] Mutating final output includes files read, created, updated, sources, links, citations, maintenance, open questions, and review needs.

## Links

- [ ] New pages have internal links.
- [ ] Domain README files are discoverable from `wiki/index.md`.
- [ ] Obsidian maps are discoverable from `wiki/home.md` and `wiki/index.md`.
- [ ] Important aliases point to canonical pages.
- [ ] No obvious broken path links.

## Sources

- [ ] Compiled pages cite source paths, source titles, or explicit user input.
- [ ] Inference is marked when evidence is incomplete.
- [ ] Raw source files are preserved.

## Schema

- [ ] Frontmatter exists on durable pages.
- [ ] `type` matches the owning domain.
- [ ] Status fields use known values.

## Quality

- [ ] Pages contain enough detail to be useful later.
- [ ] Map pages act as navigation, not duplicate summaries.
- [ ] The page is not a generic summary detached from the user.
- [ ] Open questions are captured.
- [ ] The active monthly log was updated.
