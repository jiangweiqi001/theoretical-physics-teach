# Learner-Aware Assessment Granularity Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (- [ ]) syntax for tracking.

**Goal:** Add a tested learner-aware assessment-granularity policy that skips detached elementary drills without treating skipped work as mastery.

**Architecture:** Keep the invariant compact in SKILL.md, place the operational selection and recovery logic in references/physics-pedagogy.md, enforce exact phrases through the existing PowerShell static contract, and explain the advantage and boundary in both README languages. Reuse the existing workspace ownership model; add no template or schema.

**Tech Stack:** Agent Skills Markdown, Obsidian Markdown, PowerShell contracts, Python validators and package tests, Git.

---

### Task 1: Define the failing assessment-granularity contract

**Files:**
- Modify: tests/static-contract.ps1

- [ ] Add four exact policy constants:
  - Do not separately assess isolated elementary algebra or routine symbolic manipulation when it is below the learner's established assessment granularity.
  - Prefer prompts with high diagnostic value: physical interpretation, approximation validity, non-trivial derivation structure, source translation, cross-source comparison, or theory-to-code reasoning.
  - Record an explicit learner assessment-granularity preference canonically, but do not treat that preference or a skipped low-level task as mastery evidence.
  - If a later non-trivial physics task reveals an elementary operation as the actual blocking dependency, address and reassess it in context rather than reopening a detached drill.
- [ ] Require the first phrase in SKILL.md and all four phrases in references/physics-pedagogy.md.
- [ ] Run ./tests/static-contract.ps1.
- [ ] Confirm the new assertions fail because the policy text is absent while pre-existing assertions remain green.

### Task 2: Implement the minimal runtime policy

**Files:**
- Modify: SKILL.md
- Modify: references/physics-pedagogy.md

- [ ] Add the compact detached-elementary-task prohibition next to the existing assessment invariants in SKILL.md.
- [ ] Add all four operational policy sentences to the diagnostic-selection section of references/physics-pedagogy.md.
- [ ] State that produced work remains required for non-trivial reconstruction and that in-context prerequisite repair does not restart a broad elementary curriculum.
- [ ] Run ./tests/static-contract.ps1.
- [ ] Confirm all static assertions pass.

### Task 3: Document the user-facing behavior

**Files:**
- Modify: README.md
- Modify: README.zh-CN.md
- Modify: CHANGELOG.md

- [ ] Explain that the Skill learns an explicitly stated assessment granularity and stops asking detached low-information algebra drills.
- [ ] Explain that this improves research-oriented pacing but never upgrades mastery from a preference or a skipped task.
- [ ] Explain that a later demonstrated blocker is repaired locally inside the relevant physics derivation.
- [ ] Add one Unreleased changelog bullet for the behavior.
- [ ] Run Markdown-link checks and git diff --check.

### Task 4: Verify, deploy, and publish

**Files:**
- No additional production files.

- [ ] Run ./tests/static-contract.ps1.
- [ ] Run ./tests/bootstrap-contract.ps1.
- [ ] Run ./tests/scenario-contract.ps1.
- [ ] Run ./tests/green-contract.ps1.
- [ ] Run ./tests/example-contract.ps1.
- [ ] Run ./tests/rebrand-contract.ps1.
- [ ] Run python -X utf8 -m unittest discover -s tests -v.
- [ ] Run the official quick_validate.py against the repository.
- [ ] Run the repository Markdown-link checker.
- [ ] Build a deterministic Skill package in a unique temporary directory and validate it.
- [ ] Validate the real UEG learning workspace.
- [ ] Run git diff --check and inspect the complete diff for scope drift, mojibake, duplicated rules, and regression of chat-rendering or evidence boundaries.
- [ ] Commit the implementation.
- [ ] Synchronize the verified runtime files to the installed Skill with no unrelated overwrite and re-run official validation there.
- [ ] Push main and verify origin/main equals local HEAD.
