#!/usr/bin/env python3
"""Lint Obsidian links that must work in both supported vault roots."""

from __future__ import annotations

import json
import re
import sys
from pathlib import Path


ROOT = Path(__file__).resolve().parents[2]
WIKI = ROOT / "wiki"

WIKILINK_RE = re.compile(r"\[\[([^\]]+)\]\]")
MDLINK_RE = re.compile(r"(?<!!)\[([^\]]*)\]\(([^)]+)\)")
CODE_SPAN_RE = re.compile(r"`[^`]*`")


def iter_markdown_files() -> list[Path]:
    ignored_parts = {".git", ".obsidian", ".agents", ".codex"}
    return sorted(
        path
        for path in ROOT.rglob("*.md")
        if not ignored_parts.intersection(path.relative_to(ROOT).parts)
    )


def iter_content_lines(path: Path):
    in_fence = False
    for lineno, line in enumerate(path.read_text(encoding="utf-8").splitlines(), 1):
        if line.lstrip().startswith("```"):
            in_fence = not in_fence
            continue
        if in_fence:
            continue
        yield lineno, CODE_SPAN_RE.sub("", line)


def is_external_or_anchor(target: str) -> bool:
    return (
        not target
        or target.startswith("#")
        or re.match(r"^[a-zA-Z][a-zA-Z0-9+.-]*:", target) is not None
    )


def clean_markdown_target(target: str) -> str:
    return target.strip().split("#", 1)[0].split("?", 1)[0]


def check_json(errors: list[str]) -> None:
    for rel in (".obsidian/app.json", ".obsidian/graph.json", "wiki/.obsidian/app.json", "wiki/.obsidian/graph.json"):
        path = ROOT / rel
        if not path.exists():
            continue
        try:
            json.loads(path.read_text(encoding="utf-8"))
        except json.JSONDecodeError as exc:
            errors.append(f"{rel}:{exc.lineno}: invalid JSON: {exc.msg}")


def check_unexpected_wiki_wiki(errors: list[str]) -> None:
    doubled = WIKI / "wiki"
    if doubled.exists():
        errors.append("wiki/wiki exists; this usually means a clean-vault link created a duplicated wiki root")


def check_wikilinks(errors: list[str]) -> None:
    for path in iter_markdown_files():
        rel = path.relative_to(ROOT)
        for lineno, line in iter_content_lines(path):
            for match in WIKILINK_RE.finditer(line):
                target = match.group(1).split("|", 1)[0].split("#", 1)[0].strip()
                if path.is_relative_to(WIKI):
                    errors.append(
                        f"{rel}:{lineno}: use a relative Markdown link instead of [[{target}]] for VS Code-safe navigation"
                    )
                    continue
                if target.startswith("wiki/"):
                    errors.append(
                        f"{rel}:{lineno}: use a clean-vault-safe link instead of [[{target}]]"
                    )


def check_markdown_links(errors: list[str]) -> None:
    for path in sorted(WIKI.rglob("*.md")):
        rel = path.relative_to(ROOT)
        for lineno, line in iter_content_lines(path):
            for match in MDLINK_RE.finditer(line):
                target = clean_markdown_target(match.group(2))
                if is_external_or_anchor(target):
                    continue
                if target.startswith("wiki/") or target.startswith("/wiki/"):
                    errors.append(
                        f"{rel}:{lineno}: use a relative link without a wiki/ prefix: {target}"
                    )
                    continue
                if not target.endswith(".md"):
                    continue
                resolved = (path.parent / target).resolve()
                try:
                    resolved.relative_to(ROOT)
                except ValueError:
                    errors.append(f"{rel}:{lineno}: link escapes wiki root: {target}")
                    continue
                if not resolved.exists():
                    errors.append(f"{rel}:{lineno}: missing Markdown link target: {target}")


def main() -> int:
    errors: list[str] = []
    check_json(errors)
    check_unexpected_wiki_wiki(errors)
    check_wikilinks(errors)
    check_markdown_links(errors)

    if errors:
        print("Obsidian link lint failed:")
        for error in errors:
            print(f"- {error}")
        return 1

    print("Obsidian link lint passed")
    return 0


if __name__ == "__main__":
    sys.exit(main())
