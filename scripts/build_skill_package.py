from __future__ import annotations

import argparse
from pathlib import Path
import zipfile


ROOT_FILES = (
    "SKILL.md",
    "README.md",
    "README.zh-CN.md",
    "LICENSE",
    "NOTICE.md",
)
RUNTIME_DIRECTORIES = ("agents", "assets", "references")
SCRIPT_FILES = ("scripts/validate_workspace.py",)
FIXED_ZIP_TIMESTAMP = (1980, 1, 1, 0, 0, 0)


def _runtime_manifest(root: Path) -> list[str]:
    members = set(ROOT_FILES) | set(SCRIPT_FILES)
    for directory_name in RUNTIME_DIRECTORIES:
        directory = root / directory_name
        if not directory.is_dir():
            raise FileNotFoundError(f"required runtime directory does not exist: {directory}")
        for path in directory.rglob("*"):
            if not path.is_file() or "__pycache__" in path.parts or path.suffix == ".pyc":
                continue
            members.add(path.relative_to(root).as_posix())

    for relative_path in members:
        path = root / relative_path
        if not path.is_file():
            raise FileNotFoundError(f"required runtime file does not exist: {path}")
    return sorted(members, key=str.casefold)


def _normalized_utf8_bytes(path: Path) -> bytes:
    text = path.read_text(encoding="utf-8")
    return text.replace("\r\n", "\n").replace("\r", "\n").encode("utf-8")


def _refuse_runtime_source_output(root: Path, output: Path) -> None:
    for directory_name in RUNTIME_DIRECTORIES + ("scripts",):
        source_root = (root / directory_name).resolve()
        try:
            output.relative_to(source_root)
        except ValueError:
            continue
        raise ValueError(f"output archive must not be inside runtime source directory: {source_root}")


def build_package(root: Path, output: Path) -> list[str]:
    """Build a deterministic runtime-only Skill ZIP and return its member manifest."""
    root = root.resolve()
    output = output.resolve()
    if not root.is_dir():
        raise FileNotFoundError(f"repository root does not exist: {root}")
    _refuse_runtime_source_output(root, output)
    manifest = _runtime_manifest(root)

    output.parent.mkdir(parents=True, exist_ok=True)
    with zipfile.ZipFile(output, mode="w", compression=zipfile.ZIP_STORED) as package:
        for relative_path in manifest:
            info = zipfile.ZipInfo(relative_path, date_time=FIXED_ZIP_TIMESTAMP)
            info.create_system = 3
            info.external_attr = 0o100644 << 16
            info.flag_bits |= 0x800
            package.writestr(info, _normalized_utf8_bytes(root / relative_path))
    return manifest


def main() -> int:
    parser = argparse.ArgumentParser(
        description="Build the deterministic runtime-only theoretical-physics-teach ZIP."
    )
    parser.add_argument("--root", type=Path, default=Path.cwd())
    parser.add_argument("--output", type=Path, required=True)
    args = parser.parse_args()

    manifest = build_package(args.root, args.output)
    print(f"Built {args.output.resolve()} with {len(manifest)} runtime files.")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
