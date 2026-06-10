# Task Evidence Source Template

````markdown
---
type: source
source_type: task_evidence
title:
origin:
created:
captured:
status: new
delivery: direct-task-command | task-update | inbox | imported-file | manual
original_payload: direct-user-request | user-update | inbox | imported-file | manual
raw_preservation: verbatim
task_page:
task_event: created | check-in | execution-log | milestone | missed | blocked | unblocked | review | completed | dropped
task_evidence_scope: goal | routine | habit | project | learning | life | review | other
importance: normal | important | very-important
tags: []
---

# {Title}

## Raw Material

Preserve the user's task or task-update wording here verbatim.

For grouped records, preserve each update as a fragment:

### Fragment f001

- Origin:
- Captured:
- Related task:
- Original order:

```text
{raw user task/update}
```

## Archival Note

Explain why this task event is source-worthy under the Task Evidence Gate.

## Linked Task

- Task page:

## Evidence Use

List compiled pages that may cite this evidence, such as task pages, project pages, learning paths, themes, events, or reports.
````
