# Ingest Plan Template

Use this before writing files for complex or multi-domain ingest. It can be an internal working note or a persisted report when the user asks for review first.

```text
workflow: ingest
mode: incremental | migration-sample | query-derived-update
inputs:
source_type:
delivery:
content_form:
primary_subject:
url_fetch_strategy:
  original_url:
  fetch_status:
  local_snapshot_planned:
  query_refetch_policy:
source_destination:
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
citation_strategy:
maintenance_checks:
ambiguities:
needs_user_review:
```
