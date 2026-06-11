# New Note Template

Copy this file when dropping new material into `inbox/`.

```markdown
# {Title}

Date: YYYY-MM-DD
Type: learning | diary | article | idea | project | qa | reflection | note | other
Source: URL or original location if any
Delivery: url | pasted-text | file | manual
Importance: normal | important | very-important
Context: why you saved this, if known

## Raw Note

Write the note here. It can be messy.

## Why It Matters

Optional. Why you want to remember this.

## Questions

Optional. What is still unclear?

## Suggested Targets

Optional. For example:

- Go learning
- Writing idea
- Personal reflection
- Person / event / theme
```

Use `Type: diary` or put `日记` / `diary` in the title only when this should be treated as diary during later Ingest. If the type is omitted, later Ingest should not guess diary from the content.

For URL-only inbox drops, it is enough to fill `Source` and optional `Context`. The agent should not fetch, summarize, classify, or route the URL until explicit Ingest.

Use `Importance: important` / `very-important`, or words such as `important`, `importent`, `重要`, `非常重要`, when the later Ingest should preserve the core information more carefully. Very large important content still should not be saved in full by default; later Ingest should keep a 500 Chinese character core extraction plus evidence anchors.
