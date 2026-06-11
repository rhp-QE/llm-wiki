# Obsidian Integration

This wiki is safe to open as an Obsidian vault from `/root/llm_wiki`.

## Recommended Browsing Entry

Start with:

- `wiki/home.md` for human browsing.
- `wiki/maps/maps.md` for visual maps.
- `wiki/index.md` for agent routing and domain discovery.

## Graph Filters

Use this focused graph first:

```text
path:wiki -path:AGENTS -path:README -path:wiki/index -path:wiki/log -path:wiki/logs
```

This is also stored as the default global graph filter in `.obsidian/graph.json`.

To focus on visual navigation:

```text
path:wiki/maps OR path:wiki/home
```

To focus on personal context:

```text
path:wiki/themes OR path:wiki/projects OR path:wiki/events OR path:wiki/people OR path:wiki/maps
```

## Link Strategy

- Use `[[wikilink]]` for conceptual links between compiled wiki pages.
- Avoid linking README, AGENTS, and agent `index.md` files from Obsidian-facing maps.
- Prefer path-qualified links for map targets, for example `[[wiki/maps/maps|Maps]]`.
- Short slug links are acceptable for durable canonical pages with unique filenames, for example `[[career-direction]]`.
- Source evidence should usually stay as plain file paths in `Sources` sections unless the source itself is meant to be browsed as a graph node.

## Map Pages

`wiki/maps/` contains Obsidian-facing Maps of Content.

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

- Pin `wiki/home.md` as the first page.
- Turn on Backlinks and Outgoing Links core plugins.
- Use Local Graph from map pages for focused exploration.
- Hide or visually ignore `system/`, `sources/`, and `inbox/` unless doing maintenance.
