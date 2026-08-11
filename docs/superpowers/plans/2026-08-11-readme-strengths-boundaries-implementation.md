# README Strengths and Boundaries Implementation Plan

> **For agentic workers:** Execute inline with test-first documentation changes and verify every publication surface before merging.

**Goal:** Add a bilingual researcher-facing strengths-and-boundaries section without changing Skill behavior.

**Architecture:** Keep the change on the public documentation surface. Use `tests/rebrand-contract.ps1` as the regression contract, then update the two READMEs, navigation links, and Unreleased changelog entry.

**Tech Stack:** Markdown, PowerShell contracts, Python documentation/package tests, GitHub Actions.

---

### Task 1: Define the publication contract

**Files:**
- Modify: `tests/rebrand-contract.ps1`

- [ ] Add assertions for the English and Chinese headings.
- [ ] Require the distinction between efficiency from avoiding repeated work and non-negotiable derivation depth.
- [ ] Require source-corpus, correctness, and Run-record claim boundaries.
- [ ] Run the publication contract and verify that it fails because the sections do not exist.

### Task 2: Add the bilingual documentation

**Files:**
- Modify: `README.md`
- Modify: `README.zh-CN.md`
- Modify: `CHANGELOG.md`

- [ ] Add both navigation links.
- [ ] Add the six-row paired strength/boundary table in English.
- [ ] Add the equivalent Chinese table without weakening or expanding any claim.
- [ ] Add the Unreleased changelog entry.
- [ ] Run the publication contract and public-link checker until they pass.

### Task 3: Verify and publish

**Files:**
- No further production files.

- [ ] Run every PowerShell contract.
- [ ] Run all Python unit tests and package-link checks.
- [ ] Run the official Skill validator and `git diff --check`.
- [ ] Review the final diff for duplication, scope drift, and encoding damage.
- [ ] Commit, push, create a pull request, wait for Windows and Ubuntu CI, and merge.
- [ ] Fast-forward local `main` and copy only the two updated README files into the installed Skill with recoverable backups.

