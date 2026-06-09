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
- Each active domain has `README.md` and `AGENTS.md`.

### 2. Link Check

- Internal wikilinks point to existing or intentionally planned pages.
- New pages have at least one relevant link.
- Important people/events/themes have backlinks.

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

### 6. Output

Return:

```text
checked:
issues:
fixed:
needs_user_review:
next_actions:
```

## Derived Structure Rebuild

After migration or large ingest, rebuild:

- `wiki/index.md` domain links and current status.
- Domain README/index pages.
- Alias notes or alias frontmatter.
- Timeline pages when event volume justifies them.
- Review queues in `wiki/learning/`.
- Reports under `wiki/reports/`.

Log every rebuild in `wiki/log.md`.
