# Chat Math Rendering Compatibility Implementation Plan

> **For agentic workers:** Execute inline with test-first Skill changes and verify every runtime and publication surface before deployment.

**Goal:** Add a tested chat-delivery format boundary so mathematical diagnostic prompts remain readable without weakening canonical Obsidian-LaTeX Notes.

**Architecture:** Keep Note formatting unchanged and add one chat-only adapter policy. Put the invariant in `SKILL.md`, the assessment procedure and fallback in `references/physics-pedagogy.md`, enforce both with the existing static contract, and document the distinction bilingually.

**Tech Stack:** Agent Skills Markdown, Obsidian Markdown/MathJax conventions, PowerShell contracts, Python validation and packaging tests.

---

### Task 1: Define the failing contract

**Files:**
- Modify: `tests/static-contract.ps1`

- [ ] Add exact assertions that canonical Notes retain `$...$`/`$$...$$` while chat prompts do not rely on inline LaTeX.
- [ ] Require the Unicode/plain-text default, standalone display fallback, and renderer-failure restatement without a new diagnostic.
- [ ] Run `./tests/static-contract.ps1` and verify the new assertions fail only because the behavior is not yet documented.

### Task 2: Implement the format boundary

**Files:**
- Modify: `SKILL.md`
- Modify: `references/physics-pedagogy.md`

- [ ] Add the high-level chat-versus-Note boundary to the non-negotiable invariants.
- [ ] Add operational assessment formatting and fallback rules next to the checkpoint protocol.
- [ ] State that fallback preserves the item, option order, Diagnostic ID, and evidence boundary.
- [ ] Run the static contract and verify it passes.

### Task 3: Document the behavior

**Files:**
- Modify: `README.md`
- Modify: `README.zh-CN.md`
- Modify: `CHANGELOG.md`

- [ ] Explain that chat assessment uses renderer-safe Unicode/plain text while canonical Notes retain Obsidian LaTeX.
- [ ] Add the change under `Unreleased` without changing the release version.
- [ ] Run public-documentation and link checks.

### Task 4: Verify and deploy

**Files:**
- No further production files.

- [ ] Run every PowerShell contract.
- [ ] Run the full Python unit suite and the official Skill validator with UTF-8 enabled.
- [ ] Run workspace/package/link validation and `git diff --check`.
- [ ] Review the complete diff for scope drift, duplicated policy, mojibake, and accidental Note-format changes.
- [ ] Commit and push to GitHub.
- [ ] Synchronize the installed Skill from the verified repository and re-run the official validator there.
