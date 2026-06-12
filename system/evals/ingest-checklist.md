# Ingest Checklist

Use this checklist for every `llm-wiki Ingest` and every query-derived update that mutates `sources/` or `wiki/`.

This is an audit gate, not background reading. Each item must be satisfied, marked not applicable, or listed under `needs_user_review` before the final response.

## Critical Gates

Do not finish an ingest unless these are true:

- [ ] Raw material is preserved under `sources/`; `inbox/` is only acceptable as a temporary holding place when ingest stops before completion.
- [ ] For user-provided non-task material, the original payload is preserved verbatim in `## Raw Material` before compiled `wiki/` pages are written.
- [ ] Processed `inbox/` files are removed after their raw material is archived under `sources/`; only unprocessed drops, `README.md`, and templates remain in `inbox/`.
- [ ] `system/resolver.md` was used to choose workflow and target domains.
- [ ] The nearest target-domain `AGENTS.md` files were read before writing compiled pages.
- [ ] Concrete action items were routed to `wiki/tasks/` only when they are real todos or the user wants serious task tracking.
- [ ] Task Impact Pass was run: task progress/completion/blocker signals in the source were matched to existing tasks, promoted to tasks, or listed under `needs_user_review`.
- [ ] Existing pages and aliases were checked before creating new person, concept, event, project, or theme pages.
- [ ] Every new durable `wiki/` page has frontmatter matching its domain schema.
- [ ] Every non-trivial compiled claim has a source path, explicit user statement, `Inference`, or `Needs evidence` marker.
- [ ] The active monthly log under `wiki/logs/YYYY-MM.md` was updated for meaningful mutations.

## Preflight

- [ ] State the workflow: `ingest`, `query-derived update`, or `migration sample`.
- [ ] Identify input type: diary, learning, article, book, chat, media, idea, project, or other.
- [ ] URL-backed material is treated as `delivery: url`, not as a source type or automatic tech/learning signal.
- [ ] URL-backed ingest separated reading/fetching, source archival, and compiled wiki updates instead of treating a URL as permission to do all three.
- [ ] Accessible URL-backed material was read/fetched for understanding unless the user requested metadata-only handling or access was unavailable.
- [ ] For URL-backed material, a bounded evidence package was created when possible, or fetch failure was recorded with URL and user context.
- [ ] Full linked content was not stored by default; any full archive has a reason such as short, uniquely important, unavailable elsewhere, user-provided, or explicitly requested.
- [ ] URL-only submissions were not treated as if the user had provided the full linked text; URL, user context, fetch status, and bounded evidence package were preserved according to URL policy.
- [ ] Links identified by the user as their own durable material, such as diary Markdown, personal notes, project records, learning notes, reflections, drafts, or chat exports, were treated as user-provided durable material rather than ordinary URL-only submissions.
- [ ] User-owned durable material delivered by URL was preserved verbatim in `## Raw Material` when accessible before any compiled `wiki/` pages were written.
- [ ] Very large user-owned durable material was preserved through ordered chunks, a stable imported file path, or another auditable full-preservation method rather than replaced by a summary.
- [ ] If user-owned durable material could not be fetched or preserved, URL/context were kept with `status: needs-review` and no personal facts were compiled from the URL alone.
- [ ] Importance markers such as `important`, `importent`, `非常重要`, or `重要` were preserved in source metadata and affected preservation depth.
- [ ] Very large important content was not fully archived by default; core extraction is capped at 500 Chinese characters plus evidence anchors.
- [ ] URL-backed material was classified by content form and primary subject before routing to source directory and wiki domains.
- [ ] Skill-tree material records `learning_intent`, `learning_state`, `counts_as_progress`, `priority`, and `progress_evidence` when relevant.
- [ ] Saved-for-later links, not-started topics, and skimmed material are not counted as `Recently Learned` or upgraded to `understood`, `applied`, or `validated`.
- [ ] Skill-progress fields were not applied to objective facts such as diary events, people, relationships, or factual life notes unless the material explicitly recorded learning or practice.
- [ ] `diary` classification has an explicit `diary` / `日记` marker (`Type: diary`, `source_type: diary`, diary-marked title/filename, or direct user wording). If not, do not classify as diary.
- [ ] Ambiguous untyped fragments are preserved as `source_type: note` with `status: needs-review`, not routed to `sources/diary/`.
- [ ] For `inbox/` ingest, pending fragments were inventoried and grouped before source creation; source creation was not one-fragment-one-source by default.
- [ ] Each source group has compatible boundaries: same explicit source type, same natural date or topic, and compatible origin/context.
- [ ] Different source types were not merged. In particular, diary and learning fragments were kept separate unless the user explicitly instructed otherwise.
- [ ] Grouped sources preserve original fragment boundaries with fragment IDs, capture timestamps when available, and original inbox paths.
- [ ] Choose one source destination or confirm the material is already archived.
- [ ] List target domains and why each domain owns part of the knowledge.
- [ ] List existing pages checked for duplicates, aliases, or natural update targets.
- [ ] List templates to use from `system/templates/`.
- [ ] For more than 20 source files, switch to Setup / Migration sample workflow.

Use `system/templates/ingest-plan.md` for complex or multi-domain ingest before writing.

## Source Preservation

- [ ] Source content is not rewritten into polished wiki prose.
- [ ] User-provided source content is preserved exactly in `## Raw Material`, including wording, line breaks, order, and fragment boundaries.
- [ ] No summarization, translation, normalization, cleanup, omission, or paraphrase replaced the verbatim raw payload.
- [ ] Source frontmatter records source type, title, origin, created/captured date, status, and tags when useful.
- [ ] Source frontmatter records `original_payload` and `raw_preservation` when useful.
- [ ] URL-backed source frontmatter records `delivery`, `original_url`, `accessed`, and `fetch_status` when useful.
- [ ] URL-backed source frontmatter records `archive_policy` and `coverage` when useful.
- [ ] Important source frontmatter records `importance` and `preservation_limit` when useful.
- [ ] If the source came from user text, uploaded content, imported notes, or inbox capture, the preserved source keeps the exact original payload, not merely the meaning or important phrasing.
- [ ] If the source came from `inbox/`, the source file records the original inbox path and the inbox copy is cleared after verification.
- [ ] If multiple inbox fragments were grouped, each fragment body remains verbatim and is labeled with fragment ID, capture timestamp when available, original inbox path, and original order.
- [ ] Direct lightweight todos unrelated to durable personal growth, knowledge, projects, events, or sources were not forced into `sources/`; they were routed to the task system.
- [ ] If a source is skipped, the reason is recorded in the report or log.

## Enrichment

- [ ] Durable entities are extracted: people, projects, concepts, tools, places, organizations.
- [ ] Durable relationships are extracted: person-event, concept-concept, theme-event, model-example, project-task.
- [ ] Task impact signals are extracted: completed goals, partial progress, missed routines, blockers, unblock conditions, failures, dropped work, and new serious actions.
- [ ] Timeline entries are captured when chronology matters.
- [ ] Aliases and nicknames are added to frontmatter instead of creating duplicate pages.
- [ ] Durable questions are routed to `wiki/qa/` only when they are reusable.
- [ ] Open questions are captured instead of filled with model guesses.
- [ ] Concrete todos are distinguished from open questions, saved references, project-local tasks, and learning practice tasks.

## Write

- [ ] Existing pages are updated instead of creating duplicates.
- [ ] New pages use the nearest domain `AGENTS.md` and the closest template in `system/templates/`.
- [ ] Cross-domain pages link to each other with Obsidian wikilinks where it helps future queries.
- [ ] Compiled source-derived pages that affect tasks include `## Related Tasks` or equivalent task backlinks.
- [ ] Existing canonical tasks affected by the source have updated progress cache, task log, `todo.md`, and `wiki/tasks/任务.md`.
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
- [ ] Check whether any extracted serious todos need canonical `wiki/tasks/` pages and `todo.md` dashboard entries.
- [ ] Check whether source-derived task impacts updated task pages and aggregate task progress snapshots, or were explicitly listed under `needs_user_review`.
- [ ] Check that learning path updates separate `Saved For Later` from `Recently Learned`.
- [ ] Check that `inbox/` contains no processed content after ingest.
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
