from pathlib import Path
import subprocess
import sys
import tempfile
import unittest
import zipfile

from scripts.build_skill_package import build_package


REPO_ROOT = Path(__file__).resolve().parents[1]
ROOT_FILES = {"SKILL.md", "README.md", "README.zh-CN.md", "LICENSE", "NOTICE.md"}
DIRECTORY_PREFIXES = ("agents", "assets", "references")
SCRIPT_FILES = {"scripts/validate_workspace.py"}


def expected_manifest() -> set[str]:
    expected = set(ROOT_FILES) | set(SCRIPT_FILES)
    for directory in DIRECTORY_PREFIXES:
        for path in (REPO_ROOT / directory).rglob("*"):
            if path.is_file() and "__pycache__" not in path.parts and path.suffix != ".pyc":
                expected.add(path.relative_to(REPO_ROOT).as_posix())
    return expected


class SkillPackageTests(unittest.TestCase):
    def test_package_contains_exact_runtime_allowlist(self) -> None:
        with tempfile.TemporaryDirectory() as directory:
            archive = Path(directory) / "skill.zip"
            manifest = build_package(REPO_ROOT, archive)

            self.assertEqual(expected_manifest(), set(manifest))
            with zipfile.ZipFile(archive) as package:
                self.assertEqual(expected_manifest(), set(package.namelist()))
                forbidden = (".git/", ".github/", "tests/", "docs/", "examples/")
                self.assertFalse(any(name.startswith(forbidden) for name in package.namelist()))
                self.assertFalse(any("__pycache__" in name or name.endswith((".pyc", ".zip")) for name in package.namelist()))

    def test_package_is_byte_deterministic(self) -> None:
        with tempfile.TemporaryDirectory() as directory:
            first = Path(directory) / "first.zip"
            second = Path(directory) / "second.zip"

            build_package(REPO_ROOT, first)
            build_package(REPO_ROOT, second)

            self.assertEqual(first.read_bytes(), second.read_bytes())

    def test_output_inside_runtime_source_directory_is_rejected(self) -> None:
        with self.assertRaises(ValueError):
            build_package(REPO_ROOT, REPO_ROOT / "assets" / "forbidden.zip")

    def test_extracted_skill_has_valid_identity_and_working_validator(self) -> None:
        with tempfile.TemporaryDirectory() as directory:
            temporary = Path(directory)
            archive = temporary / "skill.zip"
            extracted = temporary / "extracted"
            workspace = temporary / "workspace"
            lesson = workspace / "lessons" / "L-000001.md"
            lesson.parent.mkdir(parents=True)
            lesson.write_text(
                "# Lesson\n\n"
                "## Notation and conventions\n\n"
                "The real variable $x$ is dimensionless.\n\n"
                "## Derivation\n\n$x=1$.\n\n"
                "## End-of-Note checkpoint\n\n"
                "Is $x$ dimensionless? The answer is withheld.\n",
                encoding="utf-8",
            )

            build_package(REPO_ROOT, archive)
            with zipfile.ZipFile(archive) as package:
                package.extractall(extracted)

            skill_text = (extracted / "SKILL.md").read_text(encoding="utf-8")
            self.assertIn("\nname: theoretical-physics-teach\n", skill_text)
            result = subprocess.run(
                [
                    sys.executable,
                    "-X",
                    "utf8",
                    str(extracted / "scripts" / "validate_workspace.py"),
                    str(workspace),
                ],
                check=False,
                capture_output=True,
                text=True,
                encoding="utf-8",
            )
            self.assertEqual("", result.stdout)
            self.assertEqual("", result.stderr)
            self.assertEqual(0, result.returncode)


if __name__ == "__main__":
    unittest.main()
