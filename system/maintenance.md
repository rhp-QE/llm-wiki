# Maintenance Manual

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
- `wiki/log.md` exists as the log index.
- `todo.md` exists as the active task dashboard.
- `wiki/logs/AGENTS.md` exists for monthly log rules.
- The active monthly log under `wiki/logs/YYYY-MM.md` exists.
- `system/schema.md` exists as the cross-domain type and status registry.
- Each active domain has `README.md` and `AGENTS.md`.
- Mutating workflow checklists exist under `system/evals/`.

### 2. Link Check

- Internal wikilinks point to existing or intentionally planned pages.
- Short wikilinks are not ambiguous across `sources/` and `wiki/` when a path-qualified link would be clearer.
- New pages have at least one relevant link.
- Important people/events/themes have backlinks.
- Map pages link to canonical domain pages and avoid duplicating source summaries.

### 3. Source Check

- Compiled claims have sources or are marked as inference.
- Source pages are not rewritten as polished wiki pages.
- Ingested sources are marked or logged.

### 4. Duplicate Check

- Alias collisions are reviewed.
- Similar people, concepts, and events are not duplicated.

### 5. Staleness Check

- Pages with `updated` older than the review horizon are inspected.
- Active learning paths and projects have current status.
- Open task pages and `todo.md` dashboard entries are consistent.
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
- Source paths, wikilinks, and the active monthly log were updated.
- Failed, skipped, or subjective items are listed under `needs_user_review`.

## Derived Structure Rebuild

After migration or large ingest, rebuild:

- `wiki/index.md` domain links and current status.
- `wiki/首页.md` and `wiki/maps/` when Obsidian navigation changes.
- Domain README/index pages.
- Alias notes or alias frontmatter.
- Timeline pages when event volume justifies them.
- Review queues in `wiki/learning/`.
- Task pages under `wiki/tasks/` and the root `todo.md` dashboard.
- Reports under `wiki/reports/`.

Log every rebuild in the active monthly log under `wiki/logs/YYYY-MM.md`.
