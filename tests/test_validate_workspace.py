from pathlib import Path
import unittest

from scripts.validate_workspace import validate_workspace


FIXTURES = Path(__file__).parent / "fixtures" / "validator"


class WorkspaceValidationTests(unittest.TestCase):
    def issue_codes(self, fixture: str) -> set[str]:
        return {issue.code for issue in validate_workspace(FIXTURES / fixture)}

    def test_valid_obsidian_links_math_and_placeholders_pass(self) -> None:
        self.assertEqual(set(), self.issue_codes("valid"))

    def test_missing_note_target_fails(self) -> None:
        self.assertIn("missing-note", self.issue_codes("invalid"))

    def test_missing_heading_and_block_targets_fail(self) -> None:
        codes = self.issue_codes("invalid")
        self.assertIn("missing-heading", codes)
        self.assertIn("missing-block", codes)

    def test_duplicate_block_id_in_one_file_fails(self) -> None:
        self.assertIn("duplicate-block", self.issue_codes("invalid"))

    def test_forbidden_math_delimiter_and_fenced_math_fail(self) -> None:
        codes = self.issue_codes("invalid")
        self.assertIn("forbidden-math-delimiter", codes)
        self.assertIn("fenced-math", codes)

    def test_non_markdown_lesson_artifact_fails(self) -> None:
        self.assertIn("non-markdown-artifact", self.issue_codes("invalid"))

    def test_lesson_first_h2_must_be_notation_and_conventions(self) -> None:
        self.assertIn("lesson-first-h2", self.issue_codes("invalid"))

    def test_lesson_final_h2_must_be_end_checkpoint(self) -> None:
        self.assertIn("lesson-final-h2", self.issue_codes("invalid"))


if __name__ == "__main__":
    unittest.main()
