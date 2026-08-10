# Theoretical Physics Math Teach Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Publish a tested, explicit-only Agent Skill that builds source-driven Obsidian teaching workspaces for theoretical physics with multi-source notation, derivation, state, review, and optional code mapping.

**Architecture:** A concise root `SKILL.md` routes work to three focused protocols and copy-ready Markdown templates. A PowerShell contract test validates package structure and invariants, while three agent scenarios test behavior that static assertions cannot prove.

**Tech Stack:** Agent Skills Markdown, Codex `agents/openai.yaml`, Obsidian Markdown/LaTeX, PowerShell contract tests, Git, GitHub CLI.

---

## File Map

| Path | Responsibility |
| --- | --- |
| `SKILL.md` | Explicit trigger, invariant rules, workspace state machine, and protocol routing |
| `agents/openai.yaml` | Codex UI metadata and implicit-invocation prohibition |
| `references/source-workflow.md` | Material registration, provenance, notation, and cross-source synthesis |
| `references/physics-pedagogy.md` | Baseline, lesson, derivation, writeback, review, and mastery rules |
| `references/code-theory-bridge.md` | Conditional mapping from equations and approximations to code |
| `assets/templates/*.md` | Canonical workspace document templates |
| `tests/static-contract.ps1` | Executable structural assertions |
| `tests/scenarios/*.md` | Behavioral prompts and pass/fail observations |
| `tests/baseline-observations.md` | Verbatim RED behavior from an agent without the skill |
| `tests/green-observations.md` | Verbatim GREEN behavior from an agent using the skill |
| `README.md` | Positioning, installation, invocation, workspace, limitations, and attribution |
| `LICENSE` | MIT license retaining upstream notice and adding new-work copyright |
| `NOTICE.md` | Derivative origin, material changes, and non-endorsement statement |

### Task 1: Create behavioral RED scenarios

**Files:**
- Create: `tests/scenarios/01-conflicting-notation.md`
- Create: `tests/scenarios/02-resume-and-writeback.md`
- Create: `tests/scenarios/03-code-theory-bridge.md`
- Create: `tests/baseline-observations.md`

- [ ] **Step 1: Write the conflicting-notation scenario**

The prompt supplies two short mock sources: `S1` uses `G(k,\omega)` and energy relative to `\mu`; `S2` uses `\mathcal G(p,p_0)` and absolute energy. It asks for the next lesson under time pressure. The expected RED failure is silent normalization into one notation, absent source IDs, or a claim of equivalence without assumptions.

- [ ] **Step 2: Write the resume-and-writeback scenario**

The prompt states that a learner previously stopped at the Fourier transform from `G^R(k,t)` to `G^R(k,\omega)` and has now understood the missing convergence step. It asks to continue quickly while also requesting every calculation and logical implication. The expected RED failure is restarting the lesson, leaving the clarification only in chat, failing to update a canonical resume file, or compressing the transform behind “similarly” without displaying the convergence factor and integral.

- [ ] **Step 3: Write the code-theory scenario**

The prompt supplies a paper equation for a screened interaction and a small pseudocode loop over momentum/frequency. It asks what the code does. The expected RED failure is a generic code summary without mapping variables, approximations, discretization, outputs, and validation back to the equation.

- [ ] **Step 4: Run all scenarios without the new skill**

For each scenario, run the extractor with the corresponding filename:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File tests/extract-user-prompts.ps1 tests/scenarios/<file>.md
```

Dispatch **only the extractor output** to an independent agent with no access to the intended design. Never dispatch the whole scenario file or its evaluator-only section. Save concrete decisions and quotations to `tests/baseline-observations.md`.

Expected: at least one specified failure in each scenario.

- [ ] **Step 5: Commit RED artifacts**

Run:

```powershell
git add tests/scenarios tests/baseline-observations.md
git commit -m "test: capture baseline teaching failures"
```

### Task 2: Write and verify the failing static contract

**Files:**
- Create: `tests/static-contract.ps1`

- [ ] **Step 1: Write the contract test**

The script resolves the repository root, accumulates failures, and asserts:

- required package, protocol, legal, and template files exist;
- `SKILL.md` frontmatter contains the exact name and an explicit-invocation trigger;
- `agents/openai.yaml` contains `allow_implicit_invocation: false`;
- the skill names `CURRENT-STATE.md`, `NOTATION-CROSSWALK.md`, `SYNTHESIS.md`, and conversation writeback;
- the skill explicitly permits long Notes and forbids skipped calculation or logic steps;
- the lesson template begins with `## Notation and conventions` and requires every new symbol to be defined before use;
- the package contains no canonical `lessons/*.html` or `reference/*.html` paths;
- `NOTICE.md` identifies `mattpocock/skills`;
- `LICENSE` retains `Copyright (c) 2026 Matt Pocock`.

It prints one `PASS:` line per assertion, prints `FAIL:` lines to stderr, and exits 1 when any assertion fails.

- [ ] **Step 2: Run the contract and verify RED**

Run:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File tests/static-contract.ps1
```

Expected: FAIL because `SKILL.md` and the package files do not exist.

- [ ] **Step 3: Commit the failing contract**

```powershell
git add tests/static-contract.ps1
git commit -m "test: define skill package contract"
```

### Task 3: Implement metadata, licensing, and attribution

**Files:**
- Create: `agents/openai.yaml`
- Create: `LICENSE`
- Create: `NOTICE.md`

- [ ] **Step 1: Add Codex metadata**

```yaml
interface:
  display_name: "Theoretical Physics Math Teach"
  short_description: "Study theory sources with rigorous derivations"
policy:
  allow_implicit_invocation: false
```

- [ ] **Step 2: Add MIT terms**

Use the standard MIT license text. Preserve `Copyright (c) 2026 Matt Pocock` and add `Copyright (c) 2026 jiangweiqi001` on the next line.

- [ ] **Step 3: Add derivative notice**

`NOTICE.md` states:

- the project is derived from Matt Pocock's `teach` in `mattpocock/skills`;
- upstream is MIT licensed;
- this project is independent and not endorsed by Matt Pocock;
- material changes include physics-first source workflows, Markdown-only artifacts, multi-source notation and synthesis, resumable state, conversation writeback, evidence-based mastery, and optional code mapping.

- [ ] **Step 4: Commit legal metadata**

```powershell
git add agents/openai.yaml LICENSE NOTICE.md
git commit -m "chore: add skill metadata and attribution"
```

### Task 4: Implement workspace templates

**Files:**
- Create: `assets/templates/MISSION.md`
- Create: `assets/templates/BASELINE.md`
- Create: `assets/templates/MATERIALS.md`
- Create: `assets/templates/ROADMAP.md`
- Create: `assets/templates/CURRENT-STATE.md`
- Create: `assets/templates/CONCEPT-MAP.md`
- Create: `assets/templates/NOTATION-CROSSWALK.md`
- Create: `assets/templates/GLOSSARY.md`
- Create: `assets/templates/SYNTHESIS.md`
- Create: `assets/templates/OPEN-QUESTIONS.md`
- Create: `assets/templates/REVIEW-QUEUE.md`
- Create: `assets/templates/NOTES.md`
- Create: `assets/templates/LESSON.md`
- Create: `assets/templates/LEARNING-RECORD.md`

- [ ] **Step 1: Add state and mission templates**

Each file contains explicit headings rather than blank placeholders:

- `MISSION.md`: physical questions, supplied sources, prior knowledge, constraints, target mastery levels, completion evidence;
- `BASELINE.md`: question, learner response, observed evidence, prerequisite implication, confidence;
- `CURRENT-STATE.md`: active phase, lesson, source anchor, exact equation/proof step, obstacle, last evidence, next action;
- `NOTES.md`: language, notation, pacing, assessment, and presentation preferences.

- [ ] **Step 2: Add source and synthesis templates**

- `MATERIALS.md` uses a table with source ID, title, type, version, local path or URL, addressability, role, and availability;
- `NOTATION-CROSSWALK.md` records source location, symbol, type/domain, meaning, dimensions, conventions, cross-source relation, and assumptions;
- `GLOSSARY.md` records Chinese term, source-language term, definition, source ID, and first use;
- `SYNTHESIS.md` records object/problem, source, assumptions, method, approximation, result, validity regime, and relation classification;
- `OPEN-QUESTIONS.md` records question, status, source anchor, missing evidence, and next verification.

- [ ] **Step 3: Add curriculum and evidence templates**

- `ROADMAP.md` contains phases, prerequisite edges, source anchors, mastery target, exit evidence, and status;
- `CONCEPT-MAP.md` contains concept nodes and explicit prerequisite edges;
- `REVIEW-QUEUE.md` contains target, current level, failed evidence, review method, due condition, and result;
- `LESSON.md` begins its content with `## Notation and conventions`, defines every new symbol before use, then follows the remaining physics lesson protocol and includes provenance labels;
- `LEARNING-RECORD.md` records task, unaided response, hints, mastery level, remaining gap, and state changes.

- [ ] **Step 4: Commit templates**

```powershell
git add assets/templates
git commit -m "feat: add physics learning workspace templates"
```

### Task 5: Implement focused protocols

**Files:**
- Create: `references/source-workflow.md`
- Create: `references/physics-pedagogy.md`
- Create: `references/code-theory-bridge.md`

- [ ] **Step 1: Write source workflow**

Define material registration, stable source IDs, exact anchors, four provenance labels, source-local notation, relation classifications, assumption maps, and `SYNTHESIS.md` comparison fields. Require unavailable evidence to be recorded rather than invented.

- [ ] **Step 2: Write physics pedagogy**

Define one-question diagnostics, four mastery levels, a mandatory leading Note-level notation section, definitions of every new glyph/type/domain/meaning/dimension/convention before use, dependency-sized Notes with no length cap, complete intermediate calculations, explicit logical justifications, physical interpretation, limiting and dimensional checks, Chinese/source-language terminology, resume behavior, canonical conversation writeback, review queue updates, and pure-math support rules.

- [ ] **Step 3: Write code-theory bridge**

Activate only for supplied code or numerical material. Require mappings among equations, code locations, variables, units, discretization, truncation, regulators, inputs, outputs, convergence checks, and non-claims. Require architecture-level explanation before line-level commentary.

- [ ] **Step 4: Commit protocols**

```powershell
git add references
git commit -m "feat: add source, pedagogy, and code protocols"
```

### Task 6: Implement the core skill

**Files:**
- Create: `SKILL.md`

- [ ] **Step 1: Add valid frontmatter**

```yaml
---
name: theoretical-physics-math-teach
description: Use when a user explicitly invokes this skill to study supplied theoretical-physics papers, textbooks, lecture notes, or associated code across multiple sessions.
---
```

- [ ] **Step 2: Add invariant rules**

Require a user-designated workspace outside the installed skill, Markdown-only artifacts, source-grounded claims, source-local notation, a leading notation section in every Note, definitions of all new symbols before use, exact resume state, canonical writeback, no Note length cap, and no skipped calculation or logic steps.

- [ ] **Step 3: Add action routing**

- new material or cross-source question: read `references/source-workflow.md`;
- diagnostic, lesson, clarification, or review: read `references/physics-pedagogy.md`;
- supplied code or numerical method: also read `references/code-theory-bridge.md`;
- copy missing workspace documents from `assets/templates/` without overwriting populated files.

- [ ] **Step 4: Add completion gate**

Before finishing a teaching turn, update `CURRENT-STATE.md`, patch or link the canonical lesson, record new source/notation/synthesis facts, record demonstrated evidence, and validate local links.

- [ ] **Step 5: Commit the skill**

```powershell
git add SKILL.md
git commit -m "feat: implement theoretical physics teaching skill"
```

### Task 7: Add public documentation

**Files:**
- Create: `README.md`

- [ ] **Step 1: Document positioning**

Explain that the skill is source-driven, physics-first, pure-math-supporting, Markdown-only, multi-source, and explicit-only.

- [ ] **Step 2: Document installation and use**

Provide Codex installation by copying or cloning the repository into the user's skills directory, the invocation `$theoretical-physics-math-teach`, a minimal example with multiple papers, and the generated workspace table.

- [ ] **Step 3: Document limitations and attribution**

State that the skill does not replace primary sources, does not guarantee correctness, does not silently resolve contradictory conventions, does not require a website, and is an independent MIT derivative of Matt Pocock's `teach`.

- [ ] **Step 4: Commit README**

```powershell
git add README.md
git commit -m "docs: document installation and teaching workflow"
```

### Task 8: Verify GREEN and refactor

**Files:**
- Modify: `tests/green-observations.md`
- Modify only if tests expose a gap: `SKILL.md`, `references/*.md`, `assets/templates/*.md`

- [ ] **Step 1: Run static contract**

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File tests/static-contract.ps1
```

Expected: all assertions print `PASS` and exit 0.

- [ ] **Step 2: Validate with the Codex skill validator**

```powershell
& 'C:\Python313\python.exe' 'C:\Users\25739\.codex\skills\.system\skill-creator\scripts\quick_validate.py' .
```

Expected: `Skill is valid!`

- [ ] **Step 3: Run GREEN agent scenarios**

For each scenario, run the extractor with the corresponding filename:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File tests/extract-user-prompts.ps1 tests/scenarios/<file>.md
```

Dispatch **only the extractor output** to an independent agent instructed to read and follow `SKILL.md`. Never dispatch the whole scenario file or its evaluator-only section. Save concrete outputs and observations to `tests/green-observations.md`.

Expected: all listed GREEN behaviors appear and none of the corresponding RED failures recur.

- [ ] **Step 4: Refactor only observed gaps**

Patch the smallest relevant instruction or template, rerun the affected scenario, then rerun the full static contract.

- [ ] **Step 5: Commit validation artifacts**

```powershell
git add tests/green-observations.md SKILL.md references assets/templates
git commit -m "test: verify skill behavior"
```

### Task 9: Publish v0.1.0

**Files:**
- No new local files unless verification finds a documentation defect.

- [ ] **Step 1: Run final verification**

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File tests/static-contract.ps1
& 'C:\Python313\python.exe' 'C:\Users\25739\.codex\skills\.system\skill-creator\scripts\quick_validate.py' .
git diff --check
git status --short
```

Expected: tests pass, validator reports valid, diff check is clean, and worktree is clean.

- [ ] **Step 2: Create the public GitHub repository**

```powershell
gh repo create jiangweiqi001/theoretical-physics-math-teach --public --source . --remote origin --description "Source-driven Obsidian teaching skill for theoretical physics"
```

- [ ] **Step 3: Push main and tag**

```powershell
git push -u origin main
git tag -a v0.1.0 -m "Initial tested release"
git push origin v0.1.0
```

- [ ] **Step 4: Verify remote publication**

```powershell
gh repo view jiangweiqi001/theoretical-physics-math-teach --json nameWithOwner,url,visibility,defaultBranchRef
gh release create v0.1.0 --title "v0.1.0" --notes "Initial source-driven theoretical physics teaching skill."
```

Expected: public repository, `main` default branch, visible `v0.1.0` release.
