# Ingest Checklist

Use this checklist for every `llm-wiki Ingest` and every query-derived update that mutates `sources/` or `wiki/`.

This is an audit gate, not background reading. Each item must be satisfied, marked not applicable, or listed under `needs_user_review` before the final response.

## Critical Gates

Do not finish an ingest unless these are true:

- [ ] Raw material is preserved under `sources/` or already exists in `sources/` / `inbox/`.
- [ ] `system/resolver.md` was used to choose workflow and target domains.
- [ ] The nearest target-domain `AGENTS.md` files were read before writing compiled pages.
- [ ] Existing pages and aliases were checked before creating new person, concept, event, project, or theme pages.
- [ ] Every new durable `wiki/` page has frontmatter matching its domain schema.
- [ ] Every non-trivial compiled claim has a source path, explicit user statement, `Inference`, or `Needs evidence` marker.
- [ ] The active monthly log under `wiki/logs/YYYY-MM.md` was updated for meaningful mutations.

## Preflight

- [ ] State the workflow: `ingest`, `query-derived update`, or `migration sample`.
- [ ] Identify input type: diary, learning, article, book, chat, media, idea, project, or other.
- [ ] Choose one source destination or confirm the material is already archived.
- [ ] List target domains and why each domain owns part of the knowledge.
- [ ] List existing pages checked for duplicates, aliases, or natural update targets.
- [ ] List templates to use from `system/templates/`.
- [ ] For more than 20 source files, switch to Setup / Migration sample workflow.

Use `system/templates/ingest-plan.md` for complex or multi-domain ingest before writing.

## Source Preservation

- [ ] Source content is not rewritten into polished wiki prose.
- [ ] Source frontmatter records source type, title, origin, created/captured date, status, and tags when useful.
- [ ] If the source came from user text, the preserved source keeps the user's meaning and important phrasing.
- [ ] If a source is skipped, the reason is recorded in the report or log.

## Enrichment

- [ ] Durable entities are extracted: people, projects, concepts, tools, places, organizations.
- [ ] Durable relationships are extracted: person-event, concept-concept, theme-event, model-example, project-task.
- [ ] Timeline entries are captured when chronology matters.
- [ ] Aliases and nicknames are added to frontmatter instead of creating duplicate pages.
- [ ] Durable questions are routed to `wiki/qa/` only when they are reusable.
- [ ] Open questions are captured instead of filled with model guesses.

## Write

- [ ] Existing pages are updated instead of creating duplicates.
- [ ] New pages use the nearest domain `AGENTS.md` and the closest template in `system/templates/`.
- [ ] Cross-domain pages link to each other with `[[wikilink]]` where it helps future queries.
- [ ] New durable pages have at least one incoming or outgoing internal link unless deliberately orphaned.
- [ ] Domain README or `wiki/index.md` is updated when the new page changes discoverability.

## Citation Fixing

- [ ] Every source path in `Sources` exists.
- [ ] Source references are specific enough for a future agent to trace the claim.
- [ ] Inference is marked where evidence is incomplete.
- [ ] `Needs evidence` is used where a page needs user confirmation or source material.
- [ ] Quotes are short and necessary; prefer summaries plus source pointers.

## Maintenance

- [ ] Check obvious broken wikilinks and path links introduced by the ingest.
- [ ] Check new frontmatter `type` and status values against the owning domain schema.
- [ ] Check duplicate entity risk for people, concepts, projects, events, and themes.
- [ ] Check whether `todo.md`, learning review queues, or project tasks need updates.
- [ ] Update the active monthly log with operation, inputs, created, updated, links added, and open questions.

## Final Response

For mutating ingest, end with the fields in `system/templates/ingest-report.md` or the global mutating output standard:

```text
workflow:
wiki_root:
inputs:
files_read:
files_created:
files_updated:
sources_created_or_used:
pages_created:
pages_updated:
links_added:
questions_added:
citations_fixed:
maintenance_done:
open_questions:
needs_user_review:
next_actions:
```

## Stop Conditions

Stop and ask the user or preserve only an inbox/source note when:

- The source is inaccessible or cannot be preserved.
- Identity or alias ambiguity could merge two different people or entities.
- A classification choice is subjective and would affect many pages.
- A bulk import has not passed sample validation.
- The only available content is a model guess rather than user-supplied or source-backed material.
