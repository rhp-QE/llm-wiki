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
- [ ] Active domains have `README.md` and `AGENTS.md`.
- [ ] `system/skills/llm-wiki/SKILL.md` exists.
- [ ] `system/schema.md` exists.
- [ ] `system/evals/ingest-checklist.md` exists.
- [ ] `system/evals/task-checklist.md` exists.
- [ ] `system/templates/ingest-plan.md` exists.
- [ ] `system/templates/task.md` exists.
- [ ] `system/templates/task-evidence-source.md` exists.
- [ ] `sources/tasks/README.md` exists.
- [ ] `wiki/tasks/README.md` and `wiki/tasks/AGENTS.md` exist.

## Workflow Gates

- [ ] Mutating instructions require `system/resolver.md` preflight.
- [ ] Ingest instructions require nearest domain `AGENTS.md` before writes.
- [ ] Ingest instructions require checking existing pages and aliases.
- [ ] Mutating final output includes files read, created, updated, sources, links, citations, maintenance, open questions, and review needs.

## Links

- [ ] New pages have internal links.
- [ ] Domain README files are discoverable from `wiki/index.md`.
- [ ] Task domain and task dashboard are discoverable from `wiki/index.md`.
- [ ] Obsidian maps are discoverable from `wiki/首页.md` and `wiki/index.md`.
- [ ] Important aliases point to canonical pages.
- [ ] No obvious broken path links.
- [ ] No ambiguous short wikilinks where `sources/` and `wiki/` share the same target stem.

## Sources

- [ ] Compiled pages cite source paths, source titles, or explicit user input.
- [ ] Inference is marked when evidence is incomplete.
- [ ] Raw source files are preserved.
- [ ] URL-backed sources record URL metadata, archive policy, coverage, and are routed by content form rather than treated as automatic tech/learning.
- [ ] URL-backed sources do not store full linked content by default without a stated reason.
- [ ] Very large important URL/chat sources use a bounded extraction policy, including a 500 Chinese character core extraction cap and evidence anchors.
- [ ] Query rules prefer local URL snapshots over repeated live fetches.
- [ ] Skill-tree sources distinguish `active-study`, `future-reference`, `background-reading`, `review`, `archive-only`, or `unknown` intent when relevant.
- [ ] Saved-for-later, not-started, and skimmed skill materials use `counts_as_progress: false` and are not listed as real learning progress.
- [ ] Source-worthy long-term task evidence is preserved under `sources/tasks/` with `source_type: task_evidence`.
- [ ] Lightweight task state, dashboard reordering, and mechanical status changes are not archived as sources.

## Schema

- [ ] Frontmatter exists on durable pages.
- [ ] `type` matches the owning domain.
- [ ] Status fields use values allowed by `system/schema.md` or the nearest domain `AGENTS.md`.
- [ ] Task pages use valid task status, priority, area, source, and linked page fields.
- [ ] Task pages use valid `evidence_policy` values: `none`, `task-page-only`, or `source-backed`.
- [ ] Source-backed task pages list existing `source_records` under `sources/tasks/`.
- [ ] Canonical `todo.md` dashboard entries link to task pages; lightweight one-off checkboxes are clearly dashboard-only or marked for migration.
- [ ] Tiny one-off todos are not over-promoted into `wiki/tasks/`, and multi-step shared-goal todos are grouped under parent task checklists when appropriate.
- [ ] Learning paths separate `Saved For Later` from `Recently Learned`.
- [ ] Tech pages do not use `understood`, `applied`, or `validated` without source-backed mastery evidence.
- [ ] Example pages marked `status: example` clearly say they are examples and are not counted as real personal progress.

## Quality

- [ ] Pages contain enough detail to be useful later.
- [ ] Map pages act as navigation, not duplicate summaries.
- [ ] The page is not a generic summary detached from the user.
- [ ] Open questions are captured.
- [ ] Open questions, saved references, learning practice tasks, and tracked todos are not conflated.
- [ ] The active monthly log was updated.
