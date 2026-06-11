# Workflow: Query

Use when the user asks to consume existing wiki knowledge without changing files.

## Read

- `AGENTS.md`
- `wiki/index.md`
- relevant domain README or pages selected through `wiki/index.md`
- local `sources/` only when evidence, quotes, or ambiguity matter

## Rules

- Query is read-only. Do not mutate `inbox/`, `sources/`, `wiki/`, `system/`, or `todo.md`.
- Read compiled pages first.
- For task progress queries, read `todo.md` and `wiki/tasks/任务.md` snapshots before individual task pages.
- For URL-backed sources, use local preserved evidence before any live URL fetch.
- Do not re-fetch live URLs unless the user explicitly asks to refresh/re-read or local evidence is missing and the answer cannot be supported without it.
- Keep the answer grounded in pages consulted and source evidence.

## Output

Return:

```text
answer:
pages_consulted:
source_evidence:
uncertainties:
suggested_followups:
```

