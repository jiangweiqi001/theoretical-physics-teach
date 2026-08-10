from __future__ import annotations

import argparse
from dataclasses import dataclass
from pathlib import Path
import re


WIKILINK_RE = re.compile(r"\[\[([^\]]+)\]\]")
HEADING_RE = re.compile(r"^\s{0,3}#{1,6}\s+(.+?)\s*$")
BLOCK_RE = re.compile(r"(?:^|\s)\^([A-Za-z0-9-]+)\s*$")
FENCE_RE = re.compile(r"^\s*(`{3,}|~{3,})(.*)$")
FORBIDDEN_MATH_RE = re.compile(r"\\[()\[\]]")
EXCLUDED_PARTS = frozenset({".git", ".worktrees"})
MATH_FENCE_LANGUAGES = frozenset({"latex", "math", "tex"})


@dataclass(frozen=True)
class Issue:
    path: str
    line: int
    code: str
    message: str


@dataclass(frozen=True)
class IndexedNote:
    path: Path
    relative_path: str
    text: str
    lines: tuple[str, ...]
    headings: frozenset[str]
    blocks: frozenset[str]


def _relative(root: Path, path: Path) -> str:
    return path.relative_to(root).as_posix()


def _is_excluded(root: Path, path: Path) -> bool:
    relative_parts = path.relative_to(root).parts
    return any(part in EXCLUDED_PARTS for part in relative_parts)


def _line_number(text: str, offset: int) -> int:
    return text.count("\n", 0, offset) + 1


def index_markdown_notes(root: Path, issues: list[Issue]) -> dict[Path, IndexedNote]:
    notes: dict[Path, IndexedNote] = {}
    for path in sorted(root.rglob("*.md"), key=lambda item: item.as_posix().casefold()):
        if _is_excluded(root, path):
            continue
        try:
            text = path.read_text(encoding="utf-8")
        except UnicodeDecodeError as error:
            issues.append(
                Issue(
                    _relative(root, path),
                    1,
                    "decode-error",
                    f"file is not valid UTF-8: {error}",
                )
            )
            continue

        lines = tuple(text.splitlines())
        headings: set[str] = set()
        blocks: set[str] = set()
        for line in lines:
            heading_match = HEADING_RE.match(line)
            if heading_match:
                headings.add(heading_match.group(1).rstrip("#").rstrip())
            block_match = BLOCK_RE.search(line)
            if block_match:
                blocks.add(block_match.group(1))

        resolved = path.resolve()
        notes[resolved] = IndexedNote(
            path=resolved,
            relative_path=_relative(root, path),
            text=text,
            lines=lines,
            headings=frozenset(headings),
            blocks=frozenset(blocks),
        )
    return notes


def check_canonical_artifacts(root: Path, issues: list[Issue]) -> None:
    for directory_name in ("lessons", "reference"):
        directory = root / directory_name
        if not directory.is_dir():
            continue
        for path in sorted(directory.rglob("*"), key=lambda item: item.as_posix().casefold()):
            if not path.is_file() or _is_excluded(root, path):
                continue
            if path.suffix.casefold() != ".md":
                issues.append(
                    Issue(
                        _relative(root, path),
                        1,
                        "non-markdown-artifact",
                        "canonical lessons and reference Notes must use the .md extension",
                    )
                )


def check_math_and_blocks(note: IndexedNote, issues: list[Issue]) -> None:
    seen_blocks: dict[str, int] = {}
    active_fence: str | None = None

    for line_number, line in enumerate(note.lines, start=1):
        if FORBIDDEN_MATH_RE.search(line):
            issues.append(
                Issue(
                    note.relative_path,
                    line_number,
                    "forbidden-math-delimiter",
                    "use $...$ or $$...$$ instead of backslash-parenthesis/bracket delimiters",
                )
            )

        fence_match = FENCE_RE.match(line)
        if fence_match:
            fence_token = fence_match.group(1)
            fence_character = fence_token[0]
            if active_fence is None:
                active_fence = fence_character
                language = fence_match.group(2).strip().split(maxsplit=1)
                if language and language[0].casefold() in MATH_FENCE_LANGUAGES:
                    issues.append(
                        Issue(
                            note.relative_path,
                            line_number,
                            "fenced-math",
                            "render lesson mathematics with MathJax delimiters, not a math code fence",
                        )
                    )
            elif fence_character == active_fence:
                active_fence = None
            continue

        if active_fence is not None and "$$" in line:
            issues.append(
                Issue(
                    note.relative_path,
                    line_number,
                    "fenced-math",
                    "display mathematics is inside a code fence",
                )
            )

        block_match = BLOCK_RE.search(line)
        if block_match:
            block_id = block_match.group(1)
            if block_id in seen_blocks:
                issues.append(
                    Issue(
                        note.relative_path,
                        line_number,
                        "duplicate-block",
                        f"block ID ^{block_id} already appeared on line {seen_blocks[block_id]}",
                    )
                )
            else:
                seen_blocks[block_id] = line_number


def _candidate_paths(root: Path, current: IndexedNote, target: str) -> tuple[Path, ...]:
    normalized_target = target.replace("\\", "/").strip()
    target_path = Path(normalized_target)
    if target_path.suffix.casefold() != ".md":
        target_path = target_path.with_suffix(".md")

    candidates = {
        (current.path.parent / target_path).resolve(),
        (root / target_path).resolve(),
    }
    return tuple(sorted(candidates, key=lambda item: item.as_posix().casefold()))


def _resolve_note_target(
    root: Path,
    current: IndexedNote,
    target: str,
    notes: dict[Path, IndexedNote],
) -> IndexedNote | None:
    exact_matches = [notes[path] for path in _candidate_paths(root, current, target) if path in notes]
    unique_exact = {match.path: match for match in exact_matches}
    if len(unique_exact) == 1:
        return next(iter(unique_exact.values()))
    if len(unique_exact) > 1:
        return None

    target_stem = Path(target.replace("\\", "/")).stem.casefold()
    stem_matches = [note for note in notes.values() if note.path.stem.casefold() == target_stem]
    if len(stem_matches) == 1:
        return stem_matches[0]
    return None


def check_wikilinks(
    root: Path,
    note: IndexedNote,
    notes: dict[Path, IndexedNote],
    issues: list[Issue],
) -> None:
    for match in WIKILINK_RE.finditer(note.text):
        link_body = match.group(1).split("|", maxsplit=1)[0].strip()
        if "{{" in link_body or "}}" in link_body:
            continue

        if "#" in link_body:
            target_text, fragment = link_body.split("#", maxsplit=1)
        else:
            target_text, fragment = link_body, ""

        target_text = target_text.strip()
        line_number = _line_number(note.text, match.start())
        if target_text:
            target_note = _resolve_note_target(root, note, target_text, notes)
        else:
            target_note = note

        if target_note is None:
            issues.append(
                Issue(
                    note.relative_path,
                    line_number,
                    "missing-note",
                    f"cannot resolve a unique Note target for [[{link_body}]]",
                )
            )
            continue

        fragment = fragment.strip()
        if not fragment:
            continue
        if fragment.startswith("^"):
            block_id = fragment[1:]
            if block_id not in target_note.blocks:
                issues.append(
                    Issue(
                        note.relative_path,
                        line_number,
                        "missing-block",
                        f"target {target_note.relative_path} has no block ^{block_id}",
                    )
                )
        elif fragment not in target_note.headings:
            issues.append(
                Issue(
                    note.relative_path,
                    line_number,
                    "missing-heading",
                    f"target {target_note.relative_path} has no heading {fragment!r}",
                )
            )


def validate_workspace(root: Path) -> list[Issue]:
    """Return deterministic read-only structural issues for a learning workspace."""
    root = root.resolve()
    if not root.is_dir():
        return [Issue(".", 0, "missing-workspace", f"workspace directory does not exist: {root}")]

    issues: list[Issue] = []
    notes = index_markdown_notes(root, issues)
    check_canonical_artifacts(root, issues)
    for note in notes.values():
        check_math_and_blocks(note, issues)
        check_wikilinks(root, note, notes, issues)
    return sorted(
        issues,
        key=lambda item: (item.path.casefold(), item.line, item.code, item.message),
    )


def main() -> int:
    parser = argparse.ArgumentParser(
        description="Validate an Obsidian theoretical-physics learning workspace without modifying it."
    )
    parser.add_argument("workspace", type=Path)
    args = parser.parse_args()
    issues = validate_workspace(args.workspace.resolve())
    for issue in issues:
        print(f"{issue.path}:{issue.line}: {issue.code}: {issue.message}")
    return 1 if issues else 0


if __name__ == "__main__":
    raise SystemExit(main())
