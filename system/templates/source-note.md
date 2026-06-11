# Source Note Template

```markdown
---
type: source
source_type: article | book | chat | diary | learning | media | note | idea | project | qa | reflection | task_evidence | other
title:
origin:
created:
captured:
status: new | ingested | ignored | needs-review | example
rating:
delivery:
original_payload:
raw_preservation:
content_form:
original_url:
accessed:
fetch_status: fetched | partial | failed | manual
archive_policy: metadata-only | excerpted | full
coverage: full | partial | metadata-only
importance: normal | important | very-important
preservation_limit:
learning_intent: active-study | future-reference | background-reading | review | archive-only | unknown
learning_state: not-started | saved | skimmed | studied | practiced | applied | validated | unknown
counts_as_progress: true | false
priority: low | medium | high | unknown
progress_evidence: user-stated | source-note | exercise | project-use | repeated-use | assessment | inference | none
task_page:
task_event: created | check-in | execution-log | milestone | missed | blocked | unblocked | review | completed | dropped
task_evidence_scope: goal | routine | habit | project | learning | life | review | other
tags: []
---

# {Title}

## Raw Material

For user-provided pasted text, uploaded file content, imported notes, inbox captures, diary, learning notes, chat excerpts, reflections, project notes, and other durable material, paste the original payload here verbatim. Preserve wording, line breaks, order, and fragment boundaries. Do not summarize, translate, normalize, clean up, omit, or rewrite inside this section.

## URL / Origin

Use this when the source is URL-backed. Record original URL, access time, fetch status, archive policy, and coverage. A URL-only submission is not the full original linked content. Do not paste full linked content by default; prefer a bounded evidence package plus AI core extraction unless full archival is short, user-provided, explicitly requested, or otherwise justified.

If user context marks the source as important (`important`, `importent`, `非常重要`, `重要`, or equivalent), preserve core information carefully. If URL-linked or fetched content is very large, use `preservation_limit: core-extraction-500-zh-chars` and do not paste the full content by default. If the user pasted or uploaded the full content itself, keep that user-provided payload verbatim in `## Raw Material`.

## AI Core Extraction

## Evidence Excerpts / Anchors

## Why It Was Captured

## Learning / Skill Progress

Use only for skill-tree or learning material. Do not apply to ordinary diary, people, event, relationship, or factual life sources.

- Learning intent:
- Learning state:
- Counts as progress:
- Priority:
- Progress evidence:

## Task Evidence

Use only for `source_type: task_evidence`. Preserve source-worthy long-term task goals or execution updates under `sources/tasks/`, not lightweight task state.

- Task page:
- Task event:
- Evidence scope:
- Why source-worthy:

## Initial Notes

## Potential Wiki Targets
```
