from pathlib import Path
import tempfile
import unittest

from scripts.check_markdown_links import check_markdown_links


class MarkdownLinkCheckerTests(unittest.TestCase):
    def write(self, root: Path, relative: str, text: str) -> None:
        path = root / relative
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_text(text, encoding="utf-8")

    def test_existing_relative_file_and_heading_fragment_pass(self) -> None:
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            self.write(
                root,
                "README.md",
                "See [the guide](docs/guide.md#exact-resume-state).\n",
            )
            self.write(
                root,
                "docs/guide.md",
                "# Guide\n\n## Exact resume state\n",
            )

            self.assertEqual([], check_markdown_links(root, [Path("README.md")]))

    def test_missing_relative_target_is_reported(self) -> None:
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            self.write(root, "README.md", "See [missing](docs/missing.md).\n")

            issues = check_markdown_links(root, [Path("README.md")])

            self.assertEqual(1, len(issues))
            self.assertEqual("README.md", issues[0].source)
            self.assertEqual("docs/missing.md", issues[0].target)
            self.assertIn("does not exist", issues[0].message)

    def test_missing_heading_fragment_is_reported(self) -> None:
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            self.write(root, "README.md", "See [guide](guide.md#missing-heading).\n")
            self.write(root, "guide.md", "# Guide\n\n## Present heading\n")

            issues = check_markdown_links(root, [Path("README.md")])

            self.assertEqual(1, len(issues))
            self.assertEqual("guide.md#missing-heading", issues[0].target)
            self.assertIn("heading fragment", issues[0].message)

    def test_external_mail_and_anchor_links_are_skipped(self) -> None:
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            self.write(
                root,
                "README.md",
                "[web](https://example.org) [mail](mailto:test@example.org) [local](#title)\n\n# Title\n",
            )

            self.assertEqual([], check_markdown_links(root, [Path("README.md")]))

    def test_path_outside_root_is_rejected(self) -> None:
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            self.write(root, "README.md", "[outside](../outside.md)\n")

            issues = check_markdown_links(root, [Path("README.md")])

            self.assertEqual(1, len(issues))
            self.assertIn("outside repository root", issues[0].message)


if __name__ == "__main__":
    unittest.main()
