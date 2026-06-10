# Wiki Log

Use this log for meaningful wiki operations.

Format:

```markdown
## YYYY-MM-DD

- Operation:
- Inputs:
- Created:
- Updated:
- Links added:
- Open questions:
```

## 2026-06-10

- Operation: strengthened llm-wiki ingest workflow constraints and audit gates.
- Inputs: user request to improve constraints that make agents follow the ingest flow.
- Created: `system/evals/ingest-checklist.md`, `system/templates/ingest-plan.md`.
- Updated: `AGENTS.md`, `system/skills/llm-wiki/SKILL.md`, `system/codex-skills/llm-wiki/SKILL.md`, `/root/.codex/skills/llm-wiki/SKILL.md`, `system/resolver.md`, `system/maintenance.md`, `system/evals/lint-checklist.md`, `system/templates/ingest-report.md`, `README.md`, `START_HERE.md`, `wiki/log.md`.
- Links added: none.
- Open questions: none.

- Operation: ingested 2026-06-09 Beijing diary about work, personal wiki exploration, sleep target, interview, and career anxiety.
- Inputs: user-provided diary entry beginning "日记：北京 天气晴朗。早上 9.55 起床..."
- Created: `sources/diary/2026/2026-06-09-beijing-work-wiki-career.md`, `wiki/events/2026-06-09-beijing-work-wiki-career.md`, `wiki/themes/career-direction.md`, `wiki/themes/sleep-and-routine.md`, `wiki/projects/personal-llm-wiki.md`, `wiki/projects/agent-development-internal-transfer.md`, `wiki/learning/agent-development/index.md`, `wiki/people/guo-ruojun.md`, `wiki/craft/ios-first-frame-optimization.md`.
- Updated: `wiki/index.md`, `todo.md`, `wiki/log.md`.
- Links added: `[[2026-06-09-beijing-work-wiki-career]]`, `[[career-direction]]`, `[[sleep-and-routine]]`, `[[personal-llm-wiki]]`, `[[agent-development-internal-transfer]]`, `[[wiki/learning/agent-development/index|Agent Development Learning]]`, `[[guo-ruojun|郭若均]]`, `[[ios-first-frame-optimization]]`.
- Open questions: clarify sleep time notation; define target internal transfer role; capture actual iOS first-frame metric details; clarify relationship with 郭若均.

- Operation: lint repair for diary date and interview date.
- Inputs: user correction that the diary was for 2026-06-09 and the 小黑盒 interview was the next day, 2026-06-10 afternoon.
- Created: none.
- Updated: `sources/diary/2026/2026-06-09-beijing-work-wiki-career.md`, `wiki/events/2026-06-09-beijing-work-wiki-career.md`, `wiki/index.md`, `todo.md`, and linked people/project/theme/learning/craft pages.
- Links added: none.
- Open questions: sleep time notation is still ambiguous.

## 2026-06-09

- Operation: ingested C++ template explicit instantiation learning note.
- Inputs: user message: "我今天学习了 c++ 模板的显示实例化，可以把实现放到 cc文件内 避免 .h膨胀".
- Created: `sources/learning/cpp/2026-06-09-cpp-template-explicit-instantiation.md`, `wiki/tech/cpp/templates/explicit-instantiation.md`, `wiki/learning/cpp/index.md`, `wiki/qa/cpp-template-explicit-instantiation-cc.md`.
- Updated: `wiki/tech/README.md`, `wiki/index.md`, `wiki/log.md`.
- Links added: `[[explicit-instantiation|C++ template explicit instantiation]]`, `[[cpp-template-explicit-instantiation-cc]]`, `[[wiki/learning/cpp/index|C++ Learning]]`.
- Open questions: confirm through a real C++ build whether the user's preferred project pattern should use explicit instantiation definitions only, or also `extern template` declarations.

- Operation: initialized personal LLM-wiki scaffold.
- Inputs: user-provided context about LLM-wiki, Karpathy's pattern, Agentara, skill design, mobile consumption, and personal/technical knowledge workflows.
- Created: top-level wiki structure, local operating rules, `llm-wiki` skill, domain schemas, templates, and eval scaffolding.
- Updated: `wiki/index.md`.
- Links added: initial domain map.
- Open questions: first real source sample has not been ingested yet.

- Operation: added an example Go learning ingest path.
- Inputs: hypothetical Go `defer` learning note from the conversation.
- Created: `inbox/example-go-defer.md`, `sources/learning/go/2026-06-09-go-defer-example.md`, `wiki/learning/go/index.md`, `wiki/tech/go/syntax/defer.md`, `wiki/qa/go-defer-return-order.md`.
- Updated: `wiki/index.md`.
- Links added: `[[defer]]`, `[[go-defer-return-order]]`, `[[wiki/learning/go/index|Go Learning]]`.
- Open questions: example pages are marked `status: example` and should not be treated as real personal progress.

- Operation: incorporated incremental and stock knowledge lifecycle into the wiki operating system.
- Inputs: user-provided GBrain lifecycle notes and skill specification.
- Created: `system/lifecycle.md`, `wiki/reports/README.md`, `wiki/reports/AGENTS.md`, `system/templates/ingest-report.md`, `system/templates/migration-report.md`.
- Updated: `system/skills/llm-wiki/SKILL.md`, `system/resolver.md`, `system/maintenance.md`, `wiki/index.md`, `system/evals/routing-evals.jsonl`, `README.md`, `AGENTS.md`.
- Links added: `[[wiki/reports/README|Reports]]`.
- Open questions: no real migration has been run yet; sample validation remains required before any full import.

- Operation: added new-session and inbox drop instructions.
- Inputs: user concern that a fresh Codex session will not know how to operate this wiki.
- Created: `START_HERE.md`, `inbox/NEW_NOTE_TEMPLATE.md`.
- Updated: `README.md`.
- Links added: none.
- Open questions: none.

- Operation: installed global Codex skill for llm-wiki bootstrap.
- Inputs: user requested avoiding repeated bootstrap copy-paste across new Codex sessions.
- Created: `system/codex-skills/llm-wiki/SKILL.md`, `/root/.codex/skills/llm-wiki/SKILL.md`.
- Updated: `README.md`, `START_HERE.md`.
- Links added: none.
- Open questions: future Codex sessions may need to be restarted to load newly installed skills.

- Operation: added short command-style triggers for llm-wiki usage.
- Inputs: user requested direct `/skill-xxx` style usage instead of verbose prompts.
- Created: none.
- Updated: `system/codex-skills/llm-wiki/SKILL.md`, `README.md`, `START_HERE.md`.
- Links added: none.
- Open questions: if a Codex client intercepts unknown slash commands, use `$llm-wiki` plus the same verb as fallback.
