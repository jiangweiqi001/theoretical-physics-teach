from __future__ import annotations

import argparse
from dataclasses import dataclass
from pathlib import Path
import re
from urllib.parse import unquote


MARKDOWN_LINK_RE = re.compile(
    r"(?<!!)\[[^\]]+\]\((?P<target><[^>]+>|[^)\s]+)(?:\s+['\"][^'\"]*['\"])?\)"
)
HEADING_RE = re.compile(r"^\s{0,3}#{1,6}\s+(.+?)\s*$")
EXTERNAL_SCHEMES = ("http://", "https://", "mailto:", "data:")


@dataclass(frozen=True)
class LinkIssue:
    source: str
    target: str
    message: str


def _github_slug(heading: str) -> str:
    value = heading.strip().rstrip("#").rstrip().casefold()
    value = re.sub(r"[^\w\- ]", "", value, flags=re.UNICODE)
    return re.sub(r"\s+", "-", value)


def _heading_slugs(path: Path) -> set[str]:
    slugs: set[str] = set()
    counts: dict[str, int] = {}
    for line in path.read_text(encoding="utf-8").splitlines():
        match = HEADING_RE.match(line)
        if not match:
            continue
        base = _github_slug(match.group(1))
        count = counts.get(base, 0)
        counts[base] = count + 1
        slugs.add(base if count == 0 else f"{base}-{count}")
    return slugs


def check_markdown_links(root: Path, sources: list[Path]) -> list[LinkIssue]:
    """Return deterministic issues for relative links in selected Markdown files."""
    root = root.resolve()
    issues: list[LinkIssue] = []

    for source in sorted(sources, key=lambda item: item.as_posix().casefold()):
        source_path = (root / source).resolve()
        source_label = source.as_posix()
        try:
            source_path.relative_to(root)
        except ValueError:
            issues.append(LinkIssue(source_label, source_label, "source is outside repository root"))
            continue
        if not source_path.is_file():
            issues.append(LinkIssue(source_label, source_label, "source file does not exist"))
            continue

        text = source_path.read_text(encoding="utf-8")
        for match in MARKDOWN_LINK_RE.finditer(text):
            raw_target = match.group("target").strip("<>")
            if raw_target.casefold().startswith(EXTERNAL_SCHEMES) or raw_target.startswith("#"):
                continue

            decoded_target = unquote(raw_target)
            path_part, separator, fragment = decoded_target.partition("#")
            target_path = (source_path.parent / path_part).resolve()
            try:
                target_path.relative_to(root)
            except ValueError:
                issues.append(
                    LinkIssue(source_label, raw_target, "relative target resolves outside repository root")
                )
                continue

            if not target_path.is_file():
                issues.append(LinkIssue(source_label, raw_target, "relative target does not exist"))
                continue

            if separator and fragment and target_path.suffix.casefold() == ".md":
                if fragment.casefold() not in _heading_slugs(target_path):
                    issues.append(
                        LinkIssue(
                            source_label,
                            raw_target,
                            f"heading fragment #{fragment} does not exist in {target_path.relative_to(root).as_posix()}",
                        )
                    )

    return sorted(
        issues,
        key=lambda item: (item.source.casefold(), item.target.casefold(), item.message),
    )


def main() -> int:
    parser = argparse.ArgumentParser(
        description="Check relative Markdown links in selected public documentation files."
    )
    parser.add_argument("paths", nargs="+", type=Path)
    parser.add_argument("--root", type=Path, default=Path.cwd())
    args = parser.parse_args()

    issues = check_markdown_links(args.root, args.paths)
    for issue in issues:
        print(f"{issue.source}: {issue.target}: {issue.message}")
    return 1 if issues else 0


if __name__ == "__main__":
    raise SystemExit(main())
