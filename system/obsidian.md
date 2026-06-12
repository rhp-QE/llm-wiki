# Obsidian Integration

This wiki can be opened as an Obsidian vault in either mode:

- Full repository vault: `/root/llm-wiki`
- Clean reading vault: `/root/llm-wiki/wiki`

For daily reading, prefer `/root/llm-wiki/wiki`. It has its own `.obsidian/` settings that hide operational files from the file explorer.

## Recommended Browsing Entry

Start with:

- `首页.md` when opening `/root/llm-wiki/wiki` as the vault.
- `wiki/首页.md` when opening `/root/llm-wiki` as the vault.
- `maps/地图.md` or `wiki/maps/地图.md` for visual maps.
- `index.md` or `wiki/index.md` for agent routing and domain discovery.

## File Explorer Cleanup

Obsidian's graph filter does not hide files from the left file explorer. Use Excluded files for that.

This repository provides two configs:

- `.obsidian/app.json` for the full repository vault.
- `wiki/.obsidian/app.json` for the clean `wiki/` vault.

The clean `wiki/` vault hides:

- `AGENTS.md`
- `README.md`
- `index.md`
- `log.md`
- `logs/`

If Obsidian was already open before these files were added, restart Obsidian or close and reopen the vault.

## Graph Filters

Use this focused graph first:

```text
path:wiki -path:AGENTS -path:README -path:wiki/index -path:wiki/log -path:wiki/logs
```

This is stored as the default global graph filter in `.obsidian/graph.json` for the full repository vault.

If opening `/root/llm-wiki/wiki` as the vault, use:

```text
-path:AGENTS -path:README -path:index -path:log -path:logs
```

This is stored in `wiki/.obsidian/graph.json`.

To focus on visual navigation:

```text
path:wiki/maps OR path:wiki/首页
```

For the clean `wiki/` vault, use:

```text
path:maps OR path:首页
```

To focus on core knowledge domains:

```text
path:wiki/themes OR path:wiki/projects OR path:wiki/events OR path:wiki/people OR path:wiki/maps
```

## Link Strategy

- Use standard relative Markdown links (`[label](relative/path.md)`) for Obsidian-facing entry pages, navigation pages, compiled wiki pages, source references, and source-to-wiki target references.
- Obsidian can navigate standard Markdown links. Prefer Markdown links over wikilinks for durable content because they also work in VS Code and GitHub-style viewers.
- Avoid non-code wikilinks in compiled `wiki/` pages; VS Code can treat unresolved wikilinks as new-file targets in the current directory.
- Do not use non-code `[[wiki/...]]` links; they resolve incorrectly when `/root/llm-wiki/wiki` is opened as the vault and can create `wiki/wiki/...` files.
- Avoid linking README, AGENTS, and agent `index.md` files from Obsidian-facing maps.
- Obsidian-facing entry pages should use relative Markdown links, for example `[地图](maps/地图.md)`, when the link must work in both the full repository vault and the clean `wiki/` vault.
- Short slug wikilinks are not used in compiled wiki pages; use explicit relative Markdown paths instead.
- Source evidence that points to a local Markdown file should be a clickable Markdown link, not a plain code path, whenever the reader is expected to jump to it.

Run this before declaring Obsidian links healthy:

```bash
python3 system/scripts/lint-obsidian-links.py
```

## Map Pages

`wiki/maps/` contains Obsidian-facing 内容地图.

Map pages should:

- Connect existing pages.
- Help visual browsing.
- Stay short.
- Avoid becoming a second source of truth.

Map pages should not:

- Duplicate source summaries.
- Replace domain README pages.
- Store agent workflow rules.

## Optional Obsidian Settings

These are manual preferences, not repository requirements:

- Pin `wiki/首页.md` as the first page.
- Turn on Backlinks and Outgoing Links core plugins.
- Use Local Graph from map pages for focused exploration.
- Hide or visually ignore `system/`, `sources/`, and `inbox/` unless doing maintenance.
