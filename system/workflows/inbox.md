# Workflow: Inbox Capture

Use when the user says `inbox`, `暂存`, asks to save material for later, or provides raw material without explicit ingest wording.

## Read

- `AGENTS.md`
- `wiki/index.md`
- `inbox/README.md`
- `system/resolver.md`
- `system/policies/source-preservation.md`
- `system/policies/url-evidence.md` when URLs are present

## Rules

- Write only to `inbox/`.
- Preserve the user's raw wording with minimal capture metadata.
- Before creating a new inbox note, check pending `inbox/` notes for the same day, same topic, and same thought-thread extension. If all three match and the explicit type/context is compatible, append the new fragment to that existing note with its own capture timestamp.
- Create a new inbox note when the topic, date, thought thread, or explicit type/context differs.
- For URL-only input, save only URL, capture time, and user-provided context.
- Do not fetch URLs.
- Do not classify, enrich, route, summarize, or update compiled `wiki/` pages.
- Do not create or update `sources/`.
- Do not clear the inbox item until a later explicit Ingest succeeds.
- Routine capture does not require a monthly log entry.

## Output

Return:

```text
workflow:
wiki_root:
inputs:
files_created:
files_updated:
next_actions:
```
