# Chat Math Rendering Compatibility Design

## Goal

Keep canonical Obsidian Notes mathematically standard while making diagnostics and checkpoints readable in chat hosts whose inline-LaTeX renderer is absent or unreliable.

## Approved format boundary

- Canonical Notes and response-only Note previews continue to use `$...$` for inline LaTeX and `$$...$$` for display LaTeX.
- Learner-facing chat prompts are a separate delivery surface. Do not rely on inline LaTeX inside prose, list items, or option labels there.
- In chat, write short expressions with readable Unicode/plain text, such as `Γ > 0` and `−Γ/(x²+Γ²)`.
- When an expression cannot be represented clearly in Unicode/plain text, place it in a standalone display-math block. Keep surrounding prose and option labels outside the delimiter.
- If the learner reports that displayed mathematics still does not render, immediately restate the complete item in Unicode/plain text without changing its mathematical content or allocating a new diagnostic.

## Assessment behavior

The rule applies to initial diagnostics, ordinary knowledge checks, end-of-Note checkpoint delivery in chat, and produced-work prompts. It does not weaken the existing requirements of one item at a time, plausible distractors, withheld answers, or the separation between recognition and reconstruction.

The canonical checkpoint stored in the Note remains Obsidian-native LaTeX. Chat delivery may be a renderer-safe restatement of that same item; the learner is answering the same diagnostic, so the stable Diagnostic ID remains unchanged.

## Files and ownership

- `SKILL.md` owns the high-level boundary between canonical Note formatting and chat delivery.
- `references/physics-pedagogy.md` owns the operational rules for rendering and fallback during assessment.
- `tests/static-contract.ps1` prevents removal or accidental reversal of the boundary.
- `README.md`, `README.zh-CN.md`, and `CHANGELOG.md` explain the behavior to users without changing workspace schemas.

## Non-goals

- Do not replace LaTeX in canonical Notes with Unicode approximations.
- Do not introduce HTML, JavaScript, browser lessons, screenshots, or renderer-specific markup.
- Do not assume one host's Markdown renderer is universal.
- Do not duplicate, close, or reopen a diagnostic merely because its presentation format changed.
- Do not alter notation, physical meaning, option order, or the mastery criterion during fallback.

## Verification

- Add static-contract assertions first and observe the expected RED failure.
- Add the minimal Skill/protocol wording and bilingual public documentation.
- Run all PowerShell contracts, the Python suite, the official Skill validator, Markdown-link checks, package tests, and diff/encoding checks.
- Synchronize the installed Skill only after the repository version passes.
