# Coherent Notes, Assessment, and Publication Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Release `v0.2.0` with coherent clarification writeback, exact Obsidian resume links, option-first assessment, trustworthy conditional code explanation, deterministic workspace validation, CI, and a polished public README.

**Architecture:** Preserve the existing canonical workspace and three reference protocols. Add behavior first as failing contracts, implement shared invariants in `SKILL.md`, place detailed teaching and code rules in their existing references, encode output state in the four affected templates, and add one standalone read-only Python validator plus focused tests. Keep GitHub presentation downstream of verified behavior so README claims remain executable.

**Tech Stack:** Agent Skills Markdown, Obsidian wikilinks and MathJax LaTeX, PowerShell contract tests, Python 3 standard library, GitHub Actions on Windows, GitHub CLI.

---

## File map

- `SKILL.md`: short mandatory behavior and routing rules.
- `references/physics-pedagogy.md`: full coherence transaction and assessment protocol.
- `references/code-theory-bridge.md`: corresponding-code eligibility and physical-quantity mapping protocol.
- `assets/templates/LESSON.md`: learner-facing Note navigation, continuity, conditional code order, and final checkpoint schema.
- `assets/templates/BASELINE.md`: adaptive option-first diagnostic schema.
- `assets/templates/CURRENT-STATE.md`: exact Note heading/block resume links.
- `assets/templates/LEARNING-RECORD.md`: recognition-versus-produced-work evidence fields.
- `assets/templates/REVIEW-QUEUE.md`: option-first review with stronger follow-up gates.
- `tests/static-contract.ps1`: deterministic text/package contract.
- `tests/scenario-contract.ps1`: evaluator-isolation and gate-count checks for all behavioral scenarios.
- `tests/scenarios/04-coherent-clarification-writeback.md`: mid-derivation clarification pressure scenario.
- `tests/scenarios/05-conditional-code-explanation.md`: corresponding-code versus no-code gate scenario.
- `scripts/validate_workspace.py`: read-only Obsidian/Markdown workspace validator.
- `tests/test_validate_workspace.py`: temporary-workspace validator tests.
- `.github/workflows/validate.yml`: public deterministic validation.
- `README.md`: public product page whose claims match the contracts.

### Task 1: Define RED contracts for coherent Notes and assessments

**Files:**
- Modify: `tests/static-contract.ps1:75-445`
- Create: `tests/scenario-contract.ps1`
- Create: `tests/scenarios/04-coherent-clarification-writeback.md`
- Create: `tests/scenarios/05-conditional-code-explanation.md`

- [ ] **Step 1: Add production assertions before changing production files**

Load the four newly affected templates and require these exact policies in the indicated owners:

```powershell
$baselineTemplate = Get-RepositoryText 'assets/templates/BASELINE.md'
$currentStateTemplate = Get-RepositoryText 'assets/templates/CURRENT-STATE.md'
$reviewQueueTemplate = Get-RepositoryText 'assets/templates/REVIEW-QUEUE.md'

$coherentWritebackPolicy = 'A coherent writeback must make the Note read as if the clarification had been designed in place from the start.'
$detachedAppendixPolicy = 'Do not append a detached chat transcript or clarification appendix.'
$optionDefaultPolicy = 'Multiple-choice or true/false is the default for initial diagnosis, end-of-Note checkpoints, and ordinary knowledge checks.'
$recognitionBoundaryPolicy = 'Passing an option item alone does not establish reconstruction mastery.'
$finalCheckpointHeading = '## End-of-Note checkpoint'
$headingLinkPolicy = 'Use [[note#heading]] for section links and [[note#^block-id]] only when an exact equation or derivation step needs a stable deep link.'
$codeEligibilityPolicy = 'Use corresponding implementation material only when it is official or author-associated open-source code at a pinned commit, a user-supplied immutable snapshot, or anchored pseudocode sufficient for the mapping.'

foreach ($target in @(
    @{ Name = 'SKILL.md'; Text = $skillText }
    @{ Name = 'references/physics-pedagogy.md'; Text = $pedagogyText }
)) {
    Assert-Contract $target.Text.Contains($coherentWritebackPolicy) "$($target.Name) requires coherent in-place writeback"
    Assert-Contract $target.Text.Contains($detachedAppendixPolicy) "$($target.Name) forbids detached clarification appendices"
    Assert-Contract $target.Text.Contains($optionDefaultPolicy) "$($target.Name) defaults assessments to option questions"
    Assert-Contract $target.Text.Contains($recognitionBoundaryPolicy) "$($target.Name) separates recognition from reconstruction"
}

Assert-Contract $lessonTemplate.Contains($finalCheckpointHeading) 'LESSON.md contains the exact final checkpoint heading'
Assert-Contract $lessonTemplate.Contains($headingLinkPolicy) 'LESSON.md defines Obsidian heading and block deep links'
Assert-Contract $currentStateTemplate.Contains('First unfinished section or block link') 'CURRENT-STATE.md stores an exact unfinished deep link'
Assert-Contract $baselineTemplate.Contains('Misconception mapped to each distractor') 'BASELINE.md maps distractors to diagnostic meanings'
Assert-Contract $learningRecordTemplate.Contains($recognitionBoundaryPolicy) 'LEARNING-RECORD.md separates option evidence from reconstruction'
Assert-Contract $reviewQueueTemplate.Contains($optionDefaultPolicy) 'REVIEW-QUEUE.md defaults ordinary review checks to option questions'
Assert-Contract $codeBridgeText.Contains($codeEligibilityPolicy) 'code protocol restricts corresponding implementation material'
```

- [ ] **Step 2: Write the coherent-writeback scenario**

Create a marked user prompt containing a Note whose derivation jumps from the regulated integral to the frequency propagator and whose following paragraph uses that result. The learner says the sign in the exponential evaluation is unclear. The evaluator-only section must have six Core PASS gates:

1. patches notation first if a new symbol is introduced;
2. inserts the clarification at the jump rather than at the file end;
3. rewrites both incoming and outgoing transitions and removes obsolete stuck wording;
4. preserves valid source/provenance labels and repairs local links or step numbers;
5. updates `CURRENT-STATE.md` with an exact section/block resume link and one next action;
6. ends the learner-facing Note with a multiple-choice or true/false checkpoint without claiming reconstruction mastery from that answer alone.

Use exactly one `<!-- BEGIN USER PROMPT -->` and one `<!-- END USER PROMPT -->`, followed by `---` and `## Evaluator only`.

- [ ] **Step 3: Write the conditional-code scenario**

Create one marked prompt with two registered papers. Paper A links an author repository and a pinned mock commit plus a short loop. Paper B supplies equations but no repository, pseudocode, or reproducibility material. Require six Core PASS gates:

1. activates the code bridge only for Paper A;
2. does not invent code or pseudocode for Paper B;
3. places the code explanation after the theory;
4. gives pedagogical pseudocode labeled Reconstructed and anchored to the visible code;
5. maps every physical quantity through definition, approximation, discretization, code variable, units, shape/indices, update, output, and validation observable;
6. makes no execution or validation claim without a Run.

- [ ] **Step 4: Add the scenario isolation contract**

Implement `tests/scenario-contract.ps1` to enumerate `tests/scenarios/*.md`, require exactly one begin/end marker, require one evaluator-only section after the end marker, require exactly six `- [ ]` Core PASS items, call `tests/extract-user-prompts.ps1`, and reject extracted text containing `Evaluator only`, `Core PASS`, or either marker.

- [ ] **Step 5: Run RED verification**

Run:

```powershell
./tests/static-contract.ps1
./tests/scenario-contract.ps1
```

Expected: `scenario-contract.ps1` passes; `static-contract.ps1` exits 1 only on the newly required production phrases and fields.

- [ ] **Step 6: Commit the RED contracts**

```powershell
git add tests/static-contract.ps1 tests/scenario-contract.ps1 tests/scenarios/04-coherent-clarification-writeback.md tests/scenarios/05-conditional-code-explanation.md
git commit -m "test: define coherent note and assessment contracts"
```

### Task 2: Implement coherent writeback and option-first pedagogy

**Files:**
- Modify: `SKILL.md:12-134`
- Modify: `references/physics-pedagogy.md:5-113`

- [ ] **Step 1: Add core invariants to `SKILL.md`**

Add the exact coherence, detached-appendix, option-default, and recognition-boundary strings from Task 1. Require the agent to read the complete active Note before editing, integrate at the first dependent statement or equation, repair transitions and obsolete text, and update the end checkpoint. Keep source-local notation, evidence ownership, and response-only non-claims unchanged.

- [ ] **Step 2: Define the full coherence transaction in the pedagogy reference**

Under canonical writeback, specify this ordered transaction:

```text
read complete Note and linked local context
locate first dependent sentence/equation/step
patch leading notation first
insert or replace explanation in place
rewrite transition in and transition out
remove obsolete stuck wording and duplicates
repair numbering, terminology, provenance, and links
update the final checkpoint
audit continuity through the first downstream result
atomically update CURRENT-STATE.md
```

State that a genuinely separate prerequisite receives its own linked Note plus a bridge in the parent.

- [ ] **Step 3: Add the assessment protocol**

Require one item at a time; three or four parallel plausible options for multiple choice; varied correct-option position; no length, grammar, overlap, trick, all/none, or accidental-answer cues; true/false only for one precise proposition; and “cannot be determined” only when evidence sufficiency is the target. Require every learner-facing Note to end with the exact H2 `## End-of-Note checkpoint` and withhold the answer until the learner responds.

For derivation, proof, calculation, cross-source translation, and implementation targets, require the smallest necessary produced-work follow-up after the option item. Keep the option response as interpretation/recognition evidence unless stronger work is observed.

- [ ] **Step 4: Run targeted and existing tests**

```powershell
./tests/static-contract.ps1
./tests/bootstrap-contract.ps1
./tests/green-contract.ps1
```

Expected: failures remain only for templates and code eligibility not yet implemented; no existing contract regresses.

- [ ] **Step 5: Commit the pedagogy implementation**

```powershell
git add SKILL.md references/physics-pedagogy.md
git commit -m "feat: integrate clarifications into coherent lesson flow"
```

### Task 3: Encode resume links and assessment state in templates

**Files:**
- Modify: `assets/templates/LESSON.md:1-445`
- Modify: `assets/templates/BASELINE.md:1-44`
- Modify: `assets/templates/CURRENT-STATE.md:1-72`
- Modify: `assets/templates/LEARNING-RECORD.md:21-119`
- Modify: `assets/templates/REVIEW-QUEUE.md:1-38`

- [ ] **Step 1: Add learner-facing navigation and continuity rules**

In `LESSON.md`, add fields for prerequisite Notes, related Notes, and next Note using canonical Obsidian links. Add the exact policy:

```text
Use [[note#heading]] for section links and [[note#^block-id]] only when an exact equation or derivation step needs a stable deep link.
```

Require linked heading/block stability, continuity repair after edits, and removal of inactive scaffolding and empty conditional sections from instantiated learner Notes. Keep `## Notation and conventions` as the first H2.

- [ ] **Step 2: Make the final checkpoint structurally last**

Move next-dependency metadata before the final learner check. End the template with:

```markdown
## End-of-Note checkpoint

- Question type: multiple-choice or true/false by default; produced-work follow-up only when the target requires it
- One concept or evidence category tested:
- Question shown without its answer:
- Options, when multiple-choice: three or four parallel plausible choices with varied correct-position placement
- Misconception mapped to each distractor:
- Observable interpretation/recognition criterion:
- Required derivation, proof, calculation, translation, or implementation follow-up, when stronger mastery is targeted:
- Evidence remains pending until the learner responds.
```

- [ ] **Step 3: Extend exact resume state**

Add to `CURRENT-STATE.md`:

```markdown
- Active Note section or block link:
- Exact formula, proof step, code operation, or sentence label:
- Last completed section or block link:
- First unfinished section or block link:
```

Retain atomic replacement and history ownership.

- [ ] **Step 4: Extend baseline, evidence, and review schemas**

In `BASELINE.md`, add question type, complete option text, correct-option position stored only after response, misconception mapping, and produced-work follow-up. In `LEARNING-RECORD.md`, add option response, evidence class, and the exact recognition boundary sentence. In `REVIEW-QUEUE.md`, add the option-default sentence plus a produced-work follow-up field for stronger capabilities.

- [ ] **Step 5: Run all template contracts**

```powershell
./tests/static-contract.ps1
./tests/bootstrap-contract.ps1
./tests/scenario-contract.ps1
```

Expected: all non-code production assertions pass; bootstrap templates remain inert with no live sample links or IDs.

- [ ] **Step 6: Commit the template changes**

```powershell
git add assets/templates/LESSON.md assets/templates/BASELINE.md assets/templates/CURRENT-STATE.md assets/templates/LEARNING-RECORD.md assets/templates/REVIEW-QUEUE.md
git commit -m "feat: add exact resume links and option-first checkpoints"
```

### Task 4: Harden the conditional code–theory bridge

**Files:**
- Modify: `SKILL.md:39-52,94-107`
- Modify: `references/code-theory-bridge.md:1-87`
- Modify: `assets/templates/LESSON.md:164-416`

- [ ] **Step 1: Tighten code eligibility without breaking supplied-code support**

Add the exact code-eligibility policy from Task 1. Permit targeted public discovery only when the user authorizes it, and restrict discovery to repositories linked by the paper, authors, project, or official documentation. Require a pinned commit before a canonical mapping. Keep user-supplied snapshots and anchored pseudocode eligible.

- [ ] **Step 2: Add the physical-quantity derivation chain**

For every mapped quantity require these fields:

```text
theoretical definition and exact anchor
derivation, approximation, or reconstruction chain
discretized representation
code variable or array
units and domain
shape, storage order, and indices
initialization and update rule
output destination and consumer
validation observable and non-claim
```

Require the explanatory order theory → approximation → numerical representation → anchored pseudocode → loop/solver physics → outputs → validation.

- [ ] **Step 3: Distinguish pedagogical pseudocode**

Require reconstructed pseudocode to carry a **Reconstructed** label and exact links to pinned code steps. Prohibit presenting it as literal source or evidence of execution. When no trustworthy corresponding material exists, `Blocked` remains for required implementation and `N/A` or omission remains for optional implementation.

- [ ] **Step 4: Update the conditional lesson schema**

Add the quantity-chain table to the Active code section and state that the entire section is omitted from learner-facing instantiated Notes when N/A. Keep code after physical derivation/comparison and before the final checkpoint.

- [ ] **Step 5: Run code and regression contracts**

```powershell
./tests/static-contract.ps1
./tests/green-contract.ps1
./tests/scenario-contract.ps1
```

Expected: all pass.

- [ ] **Step 6: Commit the code bridge**

```powershell
git add SKILL.md references/code-theory-bridge.md assets/templates/LESSON.md
git commit -m "feat: explain only trustworthy corresponding code"
```

### Task 5: Build the read-only workspace validator with TDD

**Files:**
- Create: `scripts/validate_workspace.py`
- Create: `tests/test_validate_workspace.py`
- Create: `tests/fixtures/validator/valid/CURRENT-STATE.md`
- Create: `tests/fixtures/validator/valid/lessons/L-000001.md`
- Create: `tests/fixtures/validator/valid/lessons/L-000002.md`
- Create: `tests/fixtures/validator/invalid/CURRENT-STATE.md`
- Create: `tests/fixtures/validator/invalid/lessons/broken.md`
- Create: `tests/fixtures/validator/invalid/lessons/page.html`
- Modify: `tests/static-contract.ps1:75-104`

- [ ] **Step 1: Write failing validator tests**

Use `unittest` against committed read-only fixtures so the test suite creates and deletes no workspace directories. Implement the test module as:

```python
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


if __name__ == "__main__":
    unittest.main()
```

The valid fixture must include `[[lessons/L-000002#Result]]`, `[[lessons/L-000002#^eq-result]]`, inline `$x$`, display `$$x=1$$`, and an inert `[[{{LESSON_LINK}}]]`. The invalid Note must contain links to a missing Note, missing heading, and missing block; a repeated `^duplicate` block ID; a backslash-parenthesis delimiter; and a `latex` fence. The `.html` fixture establishes `non-markdown-artifact`.

- [ ] **Step 2: Run RED validator tests**

```powershell
python -m unittest tests.test_validate_workspace -v
```

Expected: import failure because `scripts.validate_workspace` does not exist.

- [ ] **Step 3: Implement the minimal validator**

Implement this public API and CLI contract without any write operation:

```python
from __future__ import annotations

import argparse
from dataclasses import dataclass
from pathlib import Path


@dataclass(frozen=True)
class Issue:
    path: str
    line: int
    code: str
    message: str

def validate_workspace(root: Path) -> list[Issue]:
    """Return deterministic read-only structural issues for a learning workspace."""
    root = root.resolve()
    issues: list[Issue] = []
    notes = index_markdown_notes(root, issues)
    check_canonical_artifacts(root, issues)
    for note in notes.values():
        check_math_and_blocks(note, issues)
        check_wikilinks(note, notes, issues)
    return sorted(issues, key=lambda item: (item.path.casefold(), item.line, item.code, item.message))


def main() -> int:
    parser = argparse.ArgumentParser(description="Validate an Obsidian theoretical-physics learning workspace without modifying it.")
    parser.add_argument("workspace", type=Path)
    args = parser.parse_args()
    issues = validate_workspace(args.workspace.resolve())
    for issue in issues:
        print(f"{issue.path}:{issue.line}: {issue.code}: {issue.message}")
    return 1 if issues else 0


if __name__ == "__main__":
    raise SystemExit(main())
```

Define `IndexedNote` with `path`, workspace-relative path, UTF-8 text, headings, block IDs, and line arrays. Implement `index_markdown_notes`, `check_canonical_artifacts`, `check_math_and_blocks`, and `check_wikilinks` as focused helpers. Scan `.md` under the workspace while excluding `.git` and `.worktrees`. Inspect canonical `lessons/` and `reference/` for non-Markdown artifacts. Index Markdown headings and per-file explicit block IDs. Resolve wikilinks by relative path, workspace path, or a unique filename stem; reject zero or multiple candidates as `missing-note`. Skip any target containing `{{` or `}}`. Match heading fragments exactly after trimming and block fragments after `#^`. Detect forbidden backslash-parenthesis/bracket delimiters and math inside `latex`, `tex`, or `math` code fences. Never call a write, move, remove, rename, or directory-creation API.

- [ ] **Step 4: Run GREEN validator tests and CLI smoke test**

```powershell
python -m unittest tests.test_validate_workspace -v
python scripts/validate_workspace.py tests/fixtures/validator/valid
```

Expected: all tests pass and the valid fixture exits 0.

- [ ] **Step 5: Register validator files in the package contract**

Add `scripts/validate_workspace.py` and `tests/test_validate_workspace.py` to required paths in `tests/static-contract.ps1`, then run:

```powershell
./tests/static-contract.ps1
python -m unittest tests.test_validate_workspace -v
```

Expected: both pass.

- [ ] **Step 6: Commit the validator**

```powershell
git add scripts/validate_workspace.py tests/test_validate_workspace.py tests/fixtures/validator tests/static-contract.ps1
git commit -m "feat: validate Obsidian learning workspace links"
```

### Task 6: Add CI and rewrite the public README

**Files:**
- Create: `.github/workflows/validate.yml`
- Modify: `tests/static-contract.ps1:75-104,412-441`
- Modify: `README.md:1-138`

- [ ] **Step 1: Add failing publication assertions**

Require the workflow file and README phrases:

```powershell
Assert-Contract (Test-Path (Join-Path $repoRoot '.github/workflows/validate.yml')) 'GitHub validation workflow exists'
Assert-Contract $readmeText.Contains('Read the paper. Preserve the notation. Finish the derivation. Resume exactly where you stopped.') 'README has the theoretical-physics tagline'
Assert-Contract $readmeText.Contains('## Why this skill exists') 'README explains the project motivation'
Assert-Contract $readmeText.Contains('## What happens when you say "this step is unclear"') 'README explains coherent writeback'
Assert-Contract $readmeText.Contains('## A serious paper-reading workflow') 'README shows the complete workflow'
Assert-Contract $readmeText.Contains('## Stateless summary vs. this skill') 'README contains the comparison table'
Assert-Contract $readmeText.Contains('v0.2.0') 'README names the current release'
```

Run `./tests/static-contract.ps1`. Expected: only workflow/README assertions fail.

- [ ] **Step 2: Create the GitHub Actions workflow**

Use this structure:

```yaml
name: validate
on:
  push:
  pull_request:
permissions:
  contents: read
jobs:
  contracts:
    runs-on: windows-latest
    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-python@v5
        with:
          python-version: '3.12'
      - shell: pwsh
        run: ./tests/static-contract.ps1
      - shell: pwsh
        run: ./tests/bootstrap-contract.ps1
      - shell: pwsh
        run: ./tests/scenario-contract.ps1
      - shell: pwsh
        run: ./tests/green-contract.ps1
      - shell: pwsh
        run: python -m unittest tests.test_validate_workspace -v
```

- [ ] **Step 3: Rewrite README around verified value**

Keep authorship, audience, install, explicit invocation, limitations, and MIT attribution accurate. Add:

- the exact tagline;
- a “why” section centered on the difficulty of following notation-heavy papers across sessions;
- a Mermaid workflow from source registration through optional code and the next exact resume point;
- a comparison table covering source notation, derivation depth, chat persistence, exact resume, assessment evidence, and code non-claims;
- an Obsidian Markdown example using `$...$`, `$$...$$`, `[[note#heading]]`, and `[[note#^block-id]]`;
- the coherent response to “this step is unclear”;
- code explanation eligibility and physical-quantity trace;
- validation commands, update instructions, and `v0.2.0`.

Do not add the CI badge in this task because no public workflow run exists yet. Do not add unverifiable adoption, correctness, performance, or endorsement claims.

- [ ] **Step 4: Run publication contracts**

```powershell
./tests/static-contract.ps1
python -m unittest tests.test_validate_workspace -v
git diff --check
```

Expected: all pass with no whitespace errors.

- [ ] **Step 5: Commit CI and README**

```powershell
git add .github/workflows/validate.yml README.md tests/static-contract.ps1
git commit -m "docs: present the complete theoretical physics workflow"
```

### Task 7: Full verification, integration, and `v0.2.0` publication

**Files:**
- Verify all changed files
- Update: installed copy at `C:/Users/25739/.agents/skills/theoretical-physics-math-teach`
- External: GitHub repository metadata and `v0.2.0` release

- [ ] **Step 1: Run the full local verification matrix**

```powershell
./tests/static-contract.ps1
./tests/bootstrap-contract.ps1
./tests/scenario-contract.ps1
./tests/green-contract.ps1
python -m unittest tests.test_validate_workspace -v
python -X utf8 C:/Users/25739/.codex/skills/.system/skill-creator/scripts/quick_validate.py .
git diff --check
git status --short
```

Expected: every command exits 0 and the worktree is clean.

- [ ] **Step 2: Invoke branch-finishing review**

Use `superpowers:finishing-a-development-branch`. Review the complete branch diff against the accepted design. Fast-forward or merge `codex/v0.2-coherent-notes` into `main` without rewriting `v0.1.1` history.

- [ ] **Step 3: Re-run the full verification matrix on `main`**

Run the commands from Step 1 at the main repository root. Expected: all pass and `main` is clean.

- [ ] **Step 4: Push and verify GitHub Actions**

```powershell
git push origin main
gh run list --repo jiangweiqi001/theoretical-physics-math-teach --workflow validate --limit 1
```

Wait for the exact pushed commit’s workflow conclusion. Expected: `success`. Do not add a validation badge or publish the release if the run fails.

- [ ] **Step 5: Add the truthful validation badge and verify it**

After the first successful public run, add this badge immediately below the README title:

```markdown
[![validate](https://github.com/jiangweiqi001/theoretical-physics-math-teach/actions/workflows/validate.yml/badge.svg)](https://github.com/jiangweiqi001/theoretical-physics-math-teach/actions/workflows/validate.yml)
```

Commit `README.md`, push `main`, and wait for the new pushed commit’s `validate` workflow conclusion. Expected: `success`.

- [ ] **Step 6: Update public metadata**

Set the description to a concise independent theoretical-physics learning skill description. Set topics including `agent-skills`, `theoretical-physics`, `physics-education`, `obsidian`, `latex`, `research-papers`, `many-body-physics`, and `quantum-field-theory`. Read the values back with GitHub CLI.

- [ ] **Step 7: Publish `v0.2.0`**

Create a non-draft, non-prerelease tag/release at the verified `main` SHA. Release notes must list coherent writeback, exact deep-link resume, option-first assessment, conditional code mapping, the workspace validator, and CI. Verify the tag SHA equals `origin/main`.

- [ ] **Step 8: Synchronize the installed copy without deleting it**

Copy only the changed and newly created release files into `C:/Users/25739/.agents/skills/theoretical-physics-math-teach`, creating `.github/workflows` and `scripts` when absent. Do not remove or recursively delete any existing file or directory. Compare normalized UTF-8 content for every production file, run installed `tests/static-contract.ps1`, validator unit tests, and `quick_validate.py` against the installed directory.

- [ ] **Step 9: Report completion with evidence**

Report the release URL, verified commit, CI run, installed path, test matrix, and the exact UEG workspace continuation command:

```text
$theoretical-physics-math-teach
Use C:\Users\25739\Desktop\Obsidian\UEG场论\学习 as the canonical learning workspace.
Read MISSION.md and CURRENT-STATE.md completely, reopen the active Note at its exact section or block link, and continue from the first unfinished step.
```
