# Policy Index

Policies are reusable rules that can apply across multiple workflows. Workflow files should reference these instead of duplicating their bodies.

## Policies

- `source-preservation.md`: hard source archival rules.
- `url-evidence.md`: URL capture, ingest, and query behavior.
- `task-granularity.md`: deciding lightweight todo vs canonical task vs subtask vs not task.
- `task-evidence.md`: deciding when tasks need source-backed evidence.
- `task-impact.md`: updating tasks from ingested sources.
- `learning-progress.md`: skill-tree and mastery state classification.

## Precedence

If a workflow and a policy conflict, use the stricter rule and list the conflict under `needs_user_review`. Hard preservation rules take precedence over convenience, summarization, or formatting.

