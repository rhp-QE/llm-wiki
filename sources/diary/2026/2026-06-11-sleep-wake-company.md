---
type: source
source_type: diary
title: 2026-06-11 sleep and morning company routine
origin: user message
created: 2026-06-11
captured: 2026-06-11
status: ingested
delivery: pasted-text
original_payload: user-provided
raw_preservation: verbatim
diary_date: 2026-06-11
task_impact: updates-existing
related_tasks:
  - wiki/tasks/2026-06-11-maintain-early-sleep-early-wake-routine.md
tags:
  - diary
  - sleep
  - routine
  - work
---

# 2026-06-11 Sleep And Morning Company Routine

## Raw Material

```text
$llm-wiki /ingest /diary 今天凌晨 13.29 睡觉， 早上 8.20 就起床了。 洗漱洗漱 准备去公司
```

## Metadata Normalization

- The command marker `/diary` is the explicit diary marker.
- "今天" is resolved at capture time to 2026-06-11.
- "今天凌晨 13.29 睡觉" is preserved as written in `## Raw Material`. User correction on 2026-06-11 confirms the accurate normalized time is 01:29.
- "早上 8.20" is treated as a user-stated 08:20 wake time in compiled pages.

## User Corrections

```text
13.29 仍是记法歧义；当前按 01:29 解释。未来最好直接写 01:29。 修正 准确来说是 凌晨 01:29.
```

## Initial Notes

- This source records a sleep/wake check-in for the active early sleep and wake routine.
- Interpreted against the existing target of sleeping before 01:30 and waking before 08:30, the corrected check-in meets both targets: sleep at 01:29 and wake at 08:20.
- The source also records a normal morning transition: washing up and preparing to go to the company.
