# Maintenance Manual

This file owns lint phases and derived-structure rebuild checks. It is the operational companion to `system/workflows/lint.md` and `system/evals/lint-checklist.md`.

Run maintenance when:

- The user asks for lint or health check.
- A batch ingest completes.
- New schema or directory rules are introduced.
- The wiki starts producing weak or contradictory answers.
- A setup or migration finishes and derived structures need rebuilding.

## Lint Phases

### 1. Structure Check

- Required top-level directories exist.
- `wiki/index.md` links to major domains.
- `wiki/首页.md` exists for Obsidian browsing.
- `wiki/maps/地图.md` and `wiki/maps/AGENTS.md` exist for visual maps.
- `wiki/indexes/索引.md` and `wiki/indexes/AGENTS.md` exist for retrieval indexes.
- `wiki/log.md` exists as the log index.
- `todo.md` exists as the active task dashboard.
- `sources/tasks/README.md` exists for long-term task evidence.
- `wiki/logs/AGENTS.md` exists for monthly log rules.
- The active monthly log under `wiki/logs/YYYY-MM.md` exists.
- `system/schema.md` exists as the cross-domain type and status registry.
- `system/workflows/README.md` and all primary workflow files exist.
- `system/policies/README.md` and all shared policy files exist.
- `system/skills/llm-wiki/SKILL.md` remains a thin bootstrap/router and does not embed workflow bodies.
- Each active domain has `README.md` and `AGENTS.md`.
- Mutating workflow checklists exist under `system/evals/`.

### 2. Link Check

- Run `python3 system/scripts/lint-obsidian-links.py` before declaring Obsidian links healthy.
- Local Markdown links across `wiki/`, `sources/`, `reports`, maps, indexes, and system docs resolve from the file where they appear.
- Internal compiled wiki links use relative Markdown paths and point to existing pages.
- Source evidence links and source-to-wiki target links use relative Markdown paths when the target is a local Markdown file and navigation is intended.
- Associated local Markdown documents are not left as non-clickable code paths such as ``sources/...`` or ``wiki/...`` except in audit inventories, command examples, or literal path documentation.
- Non-code compiled `wiki/` pages use relative Markdown links instead of wikilinks, so VS Code clicks do not create wrong files.
- Short wikilinks are not ambiguous across `sources/` and `wiki/` when a path-qualified link would be clearer.
- No non-code `[[wiki/...]]` links remain; they can resolve to `wiki/wiki/...` when `wiki/` is opened as the vault.
- Obsidian-facing Markdown links use relative paths that resolve from the file location.
- New pages have at least one relevant link.
- Important people/events/themes have backlinks.
- Map pages link to canonical domain pages and avoid duplicating source summaries.

### 3. Source Check

- Run `python3 system/scripts/lint-source-format.py` before declaring source formatting healthy.
- Compiled claims have sources or are marked as inference.
- Source pages are not rewritten as polished wiki pages.
- Markdown-like raw material under `## Raw Material` is not wrapped in an added outer code fence, so diary/note sources remain readable as Markdown.
- Same-day, same-subject, same-topic incremental updates are appended to compatible existing source files, not split into duplicate files.
- Appended source fragments have fragment IDs and timing/context metadata outside `## Raw Material`.
- Ingested sources are marked or logged.
- Source-worthy long-term task evidence is archived under `sources/tasks/` with `source_type: task_evidence`.
- Lightweight task state and mechanical task status changes are not archived as sources.

### 4. Duplicate Check

- Alias collisions are reviewed.
- Similar people, concepts, and events are not duplicated.

### 5. Staleness Check

- Pages with `updated` older than the review horizon are inspected.
- Time-varying facts have captured/effective dates and compiled-page timeline entries, current-state timestamps, or "as of" qualifiers.
- Retrieval indexes under `wiki/indexes/` are marked stale or rebuilt after large ingest or migration.
- Active learning paths and projects have current status.
- Open task pages and `todo.md` dashboard entries are consistent.
- Task page `progress_*` fields, `## Progress Snapshot`, `todo.md`, and `wiki/tasks/任务.md` aggregate snapshots are consistent and not stale for the requested review horizon.
- Source-backed task pages have existing `source_records`; long-term task execution evidence is not trapped only in `wiki/tasks/`.
- Diary, learning, project, event, and reflection pages with task-progress language have `Related Tasks`, task updates, or explicit `needs_user_review` notes.
- Canonical task pages are not being created for every tiny one-off action; lightweight dashboard-only todos remain in `todo.md` unless they need serious tracking.
- Multi-step shared-goal todos are grouped under parent task checklists when appropriate.
- Past-due, blocked, waiting, and stale tasks are visible for review.
- Example pages marked `status: example` are not treated as real user progress.

### 6. Output

Return:

```text
checked:
issues:
fixed:
needs_user_review:
next_actions:
```

## Ingest Audit

After meaningful ingest, also check `system/evals/ingest-checklist.md`:

- The source was preserved.
- Routing and target domains were recorded.
- Existing pages and aliases were checked.
- New pages followed domain schemas and templates.
- Source paths, internal links, and the active monthly log were updated.
- Source and wiki references intended for navigation are clickable Markdown links.
- Same-day, same-subject, same-topic updates appended to compatible existing source files instead of creating duplicate source files.
- Time-varying facts include captured/effective dates and compiled-page timeline or "as of" context.
- `python3 system/scripts/lint-obsidian-links.py` was run or touched local Markdown links were manually verified.
- Failed, skipped, or subjective items are listed under `needs_user_review`.

## Derived Structure Rebuild

After migration or large ingest, rebuild:

- `wiki/index.md` domain links and current status.
- `wiki/首页.md` and `wiki/maps/` when Obsidian navigation changes.
- Domain README/index pages.
- Self-profile pages under `wiki/self/` when identity, values, drivers, pressure patterns, or current direction change materially.
- Alias notes or alias frontmatter.
- Timeline pages when event volume justifies them.
- Retrieval indexes under `wiki/indexes/`, such as entities, aliases, timeline, and source manifest.
- Review queues in `wiki/learning/`.
- Task pages under `wiki/tasks/` and the root `todo.md` dashboard.
- Reports under `wiki/reports/`.

Log every rebuild in the active monthly log under `wiki/logs/YYYY-MM.md`.
