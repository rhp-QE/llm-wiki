# Lint Checklist

Use this checklist during `llm-wiki Lint`.

## Structure

- [ ] Top-level `AGENTS.md` exists.
- [ ] `wiki/index.md` exists.
- [ ] `wiki/首页.md` exists.
- [ ] `wiki/log.md` exists.
- [ ] `wiki/logs/AGENTS.md` exists.
- [ ] Active monthly log exists under `wiki/logs/YYYY-MM.md`.
- [ ] `wiki/maps/地图.md` exists.
- [ ] `wiki/maps/AGENTS.md` exists.
- [ ] `wiki/indexes/索引.md` exists.
- [ ] `wiki/indexes/AGENTS.md` exists.
- [ ] Active domains have `README.md` and `AGENTS.md`.
- [ ] `system/skills/llm-wiki/SKILL.md` exists.
- [ ] `system/skills/llm-wiki/SKILL.md` is a thin bootstrap/router and does not embed full workflow bodies.
- [ ] `system/workflows/README.md` exists.
- [ ] Workflow files exist for inbox, task, ingest, query, lint, migration, and report.
- [ ] `system/policies/README.md` exists.
- [ ] Policy files exist for source preservation, URL evidence, task granularity, task evidence, task impact, and learning progress.
- [ ] `system/schema.md` exists.
- [ ] `system/evals/ingest-checklist.md` exists.
- [ ] `system/evals/task-checklist.md` exists.
- [ ] `system/templates/ingest-plan.md` exists.
- [ ] `system/templates/ingest-report.md` exists.
- [ ] `system/templates/source-note.md` exists.
- [ ] `system/templates/link-source.md` exists.
- [ ] `system/templates/task.md` exists.
- [ ] `system/templates/task-evidence-source.md` exists.
- [ ] Common domain templates exist for person, self profile, event, concept, learning topic, Q&A, reflection, craft practice, project, theme, mental model, report, map, index page, and writing article.
- [ ] `sources/tasks/README.md` exists.
- [ ] `wiki/tasks/README.md` and `wiki/tasks/AGENTS.md` exist.

## Workflow Gates

- [ ] Mutating instructions require `system/resolver.md` preflight.
- [ ] Mutating instructions route to exactly one primary `system/workflows/*.md` file before writes.
- [ ] Cross-workflow hard rules are referenced from `system/policies/` instead of duplicated into `SKILL.md`.
- [ ] Ingest instructions require nearest domain `AGENTS.md` before writes.
- [ ] Ingest instructions require checking existing pages and aliases.
- [ ] Ingest instructions require checking existing compatible sources before creating new source files.
- [ ] Mutating final output includes files read, created, updated, sources, links, citations, maintenance, open questions, and review needs.

## Links

- [ ] `python3 system/scripts/lint-obsidian-links.py` passes.
- [ ] `python3 system/scripts/lint-source-format.py` passes.
- [ ] Non-code compiled `wiki/` pages use relative Markdown links instead of wikilinks, so VS Code clicks do not create wrong files.
- [ ] Associated local Markdown documents use clickable standard Markdown links (`[label](relative/path.md)`) by default.
- [ ] Source evidence references and source-to-wiki target references are clickable Markdown links when the target is a local Markdown file and navigation is intended.
- [ ] Code-form paths such as ``sources/...`` or ``wiki/...`` are used only for audit inventories, command examples, or literal path documentation, not for navigational associations.
- [ ] New pages have internal links.
- [ ] Domain README files are discoverable from `wiki/index.md`.
- [ ] Task domain and task dashboard are discoverable from `wiki/index.md`.
- [ ] Obsidian maps are discoverable from `wiki/首页.md` and `wiki/index.md`.
- [ ] Retrieval indexes are discoverable from `wiki/index.md`.
- [ ] Important aliases point to canonical pages.
- [ ] No obvious broken path links.
- [ ] Link checks cover wiki pages, source pages, reports, maps, indexes, and source-to-wiki target links touched by the update.
- [ ] No non-code `[[wiki/...]]` links that could create `wiki/wiki/...` in the clean `wiki/` vault.
- [ ] No ambiguous short wikilinks where `sources/` and `wiki/` share the same target stem.

## Sources

- [ ] Compiled pages cite source Markdown links, source titles, or explicit user input.
- [ ] Inference is marked when evidence is incomplete.
- [ ] Raw source files are preserved.
- [ ] Same-day, same-subject, same-topic incremental updates are appended to existing compatible source files, not split into duplicate files.
- [ ] Appended source fragments preserve raw payloads with fragment IDs and timing metadata outside `## Raw Material`.
- [ ] Markdown-like `## Raw Material` sections are not hidden inside added outer code fences.
- [ ] URL-backed sources record URL metadata, fetch purpose, source ownership, archive policy, archive reason when needed, coverage, and are routed by content form rather than treated as automatic tech/learning.
- [ ] URL-backed sources do not store full linked content by default without a stated reason.
- [ ] User-owned durable URL-backed sources preserve accessible original payloads verbatim in `## Raw Material` before compiled pages are written.
- [ ] Failed or inaccessible user-owned durable URL-backed sources are marked `needs-review` and do not produce compiled personal facts from URL metadata alone.
- [ ] Very large important URL/chat sources use a bounded extraction policy, including a 500 Chinese character core extraction cap and evidence anchors.
- [ ] Very large user-owned durable URL-backed sources use ordered chunks, stable imported file paths, or another auditable full-preservation method instead of summary-only preservation.
- [ ] Query rules prefer local URL snapshots over repeated live fetches.
- [ ] Skill-tree sources distinguish `active-study`, `future-reference`, `background-reading`, `review`, `archive-only`, or `unknown` intent when relevant.
- [ ] Saved-for-later, not-started, and skimmed skill materials use `counts_as_progress: false` and are not listed as real learning progress.
- [ ] Source-worthy long-term task evidence is preserved under `sources/tasks/` with `source_type: task_evidence`.
- [ ] Source-derived task evidence in diary, learning, project, event, or reflection sources links to affected tasks or is marked `needs-review`.
- [ ] Lightweight task state, dashboard reordering, and mechanical status changes are not archived as sources.

## Schema

- [ ] Frontmatter exists on durable pages.
- [ ] `type` matches the owning domain.
- [ ] Status fields use values allowed by `system/schema.md` or the nearest domain `AGENTS.md`.
- [ ] Task pages use valid task status, priority, area, source, and linked page fields.
- [ ] Task pages use valid `evidence_policy` values: `none`, `task-page-only`, or `source-backed`.
- [ ] Source-backed task pages list existing `source_records` under `sources/tasks/`.
- [ ] Source-derived pages with task-progress language have `Related Tasks` links or an explicit `needs_user_review` note.
- [ ] Time-varying facts have captured/effective dates and compiled-page timeline, current-state timestamp, or "as of" qualifier.
- [ ] Canonical `todo.md` dashboard entries link to task pages; lightweight one-off checkboxes are clearly dashboard-only or marked for migration.
- [ ] Tiny one-off todos are not over-promoted into `wiki/tasks/`, and multi-step shared-goal todos are grouped under parent task checklists when appropriate.
- [ ] Learning paths separate `Saved For Later` from `Recently Learned`.
- [ ] Tech pages do not use `understood`, `applied`, or `validated` without source-backed mastery evidence.
- [ ] Example pages marked `status: example` clearly say they are examples and are not counted as real personal progress.
- [ ] Index pages under `wiki/indexes/` link to canonical pages/source files with standard Markdown links and do not become a second source of truth.

## Quality

- [ ] Pages contain enough detail to be useful later.
- [ ] Map pages act as navigation, not duplicate summaries.
- [ ] The page is not a generic summary detached from the user.
- [ ] Open questions are captured.
- [ ] Open questions, saved references, learning practice tasks, and tracked todos are not conflated.
- [ ] The active monthly log was updated.
