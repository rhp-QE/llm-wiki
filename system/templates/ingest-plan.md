# Ingest Plan Template

Use this before writing files for complex or multi-domain ingest. It can be an internal working note or a persisted report when the user asks for review first.

```text
workflow: ingest
mode: incremental | migration-sample | query-derived-update
inputs:
source_type:
delivery:
content_form: article | chat | thread | documentation | gist | newsletter | video | podcast | transcript | post | markdown | note | diary | life-log | project-record | draft | export | other
primary_subject:
url_fetch_strategy:
  original_url:
  fetch_status:
  fetch_purpose:
  source_ownership:
  archive_policy:
  archive_reason:
  coverage:
  local_snapshot_planned:
  query_refetch_policy:
source_destination:
existing_sources_checked:
same_day_same_topic_source_decision:
  grouping_key:
  append_target:
  new_source_reason:
target_domains:
  - domain:
    reason:
nearest_agent_rules:
existing_pages_checked:
aliases_checked:
templates_to_use:
planned_sources_created:
source_grouping_strategy:
  - group:
    source_type:
    grouping_key:
    included_inputs:
    excluded_inputs:
    reason:
planned_pages_created:
planned_pages_updated:
planned_links:
time_sensitive_updates:
  - fact:
    captured:
    effective:
    compiled_page_location:
link_validation_plan:
citation_strategy:
maintenance_checks:
ambiguities:
needs_user_review:
```
