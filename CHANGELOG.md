# Changelog

All notable changes to `theoretical-physics-teach` are documented here.

## Unreleased

No unreleased changes.

## v0.4.0 — 2026-08-11

### Added

- Focused `CODE-MAP.md` and `RUN-RECORD.md` templates for optional implementation records.
- A self-contained, validator-backed exact-resume and coherent-writeback example.
- Full Chinese documentation, current architecture documentation, and an end-to-end walkthrough.
- Required first and final lesson H2 validation.
- Relative public-document link validation.
- Deterministic runtime-only ZIP packaging.
- Windows and Ubuntu validation with pinned GitHub Actions and Dependabot maintenance.
- A Codex `default_prompt` that explicitly invokes `$theoretical-physics-teach`.

### Changed

- Reduced `LESSON.md` to learner-facing theory, derivation, assessment, and concise optional code explanation; registry schemas now load only when needed.
- Clarified that new canonical Code Maps live under `reference/code-maps/` and Runs under `execution-records/`.
- Reorganized public onboarding around a five-minute start and observable outputs.

### Compatibility

- No automatic learning-workspace migration occurs.
- Existing pre-v0.4 Code Maps embedded in lessons remain valid.
- New Code Maps and Runs use external focused templates.
- Course workspaces remain outside the installed Skill directory and are not modified by Skill installation or upgrade.

## v0.3.0 — 2026-08-11

- Completed the theoretical-physics-only rename and explicit invocation `$theoretical-physics-teach`.
- Preserved exact resume, coherent writeback, notation-first Notes, option-first checks, and conditional code mapping.

## v0.2.0 — 2026-08-11

- Added coherent in-place clarification writeback, exact heading/block resume links, stronger notation audits, conditional code explanation, workspace validation, and public behavioral scenarios.

## v0.1.1 — 2026-08-10

- Hardened source provenance, canonical evidence ownership, template lifecycle rules, and behavioral scenario isolation.

## v0.1.0 — 2026-08-10

- Published the independent MIT-licensed source-driven teaching Skill with Obsidian Markdown templates, multi-source notation crosswalks, complete derivations, evidence-based mastery, and optional code-theory mapping.

See [README.md](README.md), [README.zh-CN.md](README.zh-CN.md), and the [architecture](docs/architecture.md) for the maintained current behavior.
