#!/usr/bin/env python3
"""Lint source files for readable raw-material preservation."""

from __future__ import annotations

import re
import sys
from pathlib import Path


ROOT = Path(__file__).resolve().parents[2]
SOURCES = ROOT / "sources"

TEXT_SOURCE_TYPES = {
    "article",
    "chat",
    "diary",
    "learning",
    "note",
    "idea",
    "project",
    "qa",
    "reflection",
    "task_evidence",
    "other",
}


def parse_frontmatter(text: str) -> dict[str, str]:
    if not text.startswith("---\n"):
        return {}
    end = text.find("\n---", 4)
    if end == -1:
        return {}
    values: dict[str, str] = {}
    for line in text[4:end].splitlines():
        if ":" not in line or line.startswith(" "):
            continue
        key, value = line.split(":", 1)
        values[key.strip()] = value.strip().strip('"').strip("'")
    return values


def raw_material_section(text: str) -> str | None:
    match = re.search(r"^## Raw Material\s*$", text, re.MULTILINE)
    if not match:
        return None
    start = match.end()
    next_h2 = re.search(r"^## ", text[start:], re.MULTILINE)
    end = start + next_h2.start() if next_h2 else len(text)
    return text[start:end]


def first_nonblank_line(section: str) -> str:
    for line in section.splitlines():
        if line.strip():
            return line.strip()
    return ""


def check_sources() -> list[str]:
    errors: list[str] = []
    if not SOURCES.exists():
        return errors

    for path in sorted(SOURCES.rglob("*.md")):
        rel = path.relative_to(ROOT)
        text = path.read_text(encoding="utf-8")
        frontmatter = parse_frontmatter(text)
        source_type = frontmatter.get("source_type")
        if source_type not in TEXT_SOURCE_TYPES:
            continue
        section = raw_material_section(text)
        if section is None:
            continue
        first = first_nonblank_line(section)
        if first.startswith("```"):
            errors.append(
                f"{rel}: Raw Material starts with a code fence; preserve Markdown raw text directly unless the original payload itself begins with that fence"
            )

    return errors


def main() -> int:
    errors = check_sources()
    if errors:
        print("Source format lint failed:")
        for error in errors:
            print(f"- {error}")
        return 1
    print("Source format lint passed")
    return 0


if __name__ == "__main__":
    sys.exit(main())
