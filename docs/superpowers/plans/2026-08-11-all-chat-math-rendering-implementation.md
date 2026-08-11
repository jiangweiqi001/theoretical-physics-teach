# All-Chat Math Rendering Compatibility Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Extend renderer-safe mathematics from assessment prompts to every conversational teaching response without changing canonical Obsidian Note formatting.

**Architecture:** Classify output by artifact type: canonical Notes, exact patches, and response-only Note previews retain Obsidian LaTeX, while all other learner-facing chat uses Unicode/plain text with standalone display mathematics only when necessary. Put the invariant in `SKILL.md`, the operational procedure in `references/physics-pedagogy.md`, and enforce the scope and exception with static and behavioral contracts.

**Tech Stack:** Agent Skills Markdown, Obsidian Markdown/MathJax, PowerShell contract tests, Python validation and deterministic packaging.

---

### Task 1: Add failing all-chat regression contracts

**Files:**
- Create: `tests/scenarios/06-chat-explanation-rendering.md`
- Modify: `tests/scenario-contract.ps1`
- Modify: `tests/static-contract.ps1`

- [ ] **Step 1: Add the ordinary-explanation scenario**

Create a scenario in which the learner reports that inline mathematics in an earlier quasiparticle-residue explanation remained uncompiled, explicitly requests an ordinary chat explanation rather than a Note preview, and supplies the canonical formula for `Z_k`. Give the evaluator exactly six Core PASS items covering surface classification, full current-chat plain-text fallback, correct physical interpretation, absence of formula-heavy tables or nested LaTeX, preservation of canonical Note formatting, and no new diagnostic/evidence event for a format correction.

- [ ] **Step 2: Raise the scenario floor**

Change the scenario count guard from fewer than five to fewer than six and update its failure message to `at least six behavioral scenarios exist`.

- [ ] **Step 3: Add exact static expectations**

Replace the assessment-only chat policy assertions with assertions requiring these runtime behaviors:

```text
All learner-facing conversational teaching must not rely on inline LaTeX rendering.
Canonical Notes, exact canonical patches, and response-only finished Note previews are canonical artifact payloads even when transported through chat; keep their Obsidian LaTeX unchanged.
For conversational explanations, clarification answers, assessment prompts, feedback, progress summaries, and navigation, use Unicode or plain text for short mathematics and reserve LaTeX for necessary standalone display blocks.
Do not put LaTeX delimiters or commands in conversational headings, Markdown table cells, list labels, option labels, or Markdown link labels.
After any learner-reported rendering failure in the current chat, use no LaTeX delimiters or commands in later conversational mathematics unless the learner explicitly requests a LaTeX retry.
Before sending conversational mathematics, audit headings, prose, tables, lists, options, and links for inline delimiters or LaTeX commands.
Assessment prompts inherit the general conversational rendering procedure; they do not define a narrower exception.
```

Also assert that the old narrow strings `Chat-delivered assessment prompts must not rely on inline LaTeX rendering.` and `For learner-facing chat prompts, use Unicode or plain text for short mathematics and reserve LaTeX for standalone display blocks.` are absent from runtime instructions.

- [ ] **Step 4: Verify RED**

Run:

```powershell
./tests/scenario-contract.ps1
./tests/static-contract.ps1
```

Expected: the scenario structural contract passes, while static-contract fails only on the new all-chat policies and forbidden old narrow wording.

- [ ] **Step 5: Commit the RED contracts**

```powershell
git add tests/scenarios/06-chat-explanation-rendering.md tests/scenario-contract.ps1 tests/static-contract.ps1
git commit -m "test: require renderer-safe teaching chat"
```

### Task 2: Implement the runtime surface boundary

**Files:**
- Modify: `SKILL.md`
- Modify: `references/physics-pedagogy.md`

- [ ] **Step 1: Generalize the Skill invariant**

Replace the assessment-only invariant with the exact all-chat invariant and canonical-artifact exception required by Task 1. Keep the existing exact Note rule `Use $...$ for inline LaTeX and $$...$$ for display LaTeX.` unchanged and scoped only to canonical artifacts.

- [ ] **Step 2: Add one operational chat-delivery section**

Insert `## Chat delivery rendering contract` before diagnosis in `references/physics-pedagogy.md`. State the complete conversational scope, Unicode/plain-text default, necessary standalone-display exception, forbidden nested contexts, formula-heavy-table avoidance, source-notation preservation, Note-link-and-summary behavior, renderer-failure session fallback, and pre-delivery audit.

- [ ] **Step 3: Make assessment inherit the general rule**

Replace the duplicate assessment rendering paragraph with `Assessment prompts inherit the general conversational rendering procedure; they do not define a narrower exception.` Retain assessment-specific identity rules: a format-only restatement keeps option order, Diagnostic ID, mastery criterion, and Evidence boundary and is not a second attempt.

- [ ] **Step 4: Verify GREEN and inspect ambiguity**

Run:

```powershell
./tests/static-contract.ps1
rg -n -i "chat|conversation|inline latex|display block|note preview|assessment prompt|render" SKILL.md references assets/templates
```

Expected: static-contract passes; every matching runtime instruction is attributable to either canonical-artifact formatting, general conversational formatting, or assessment identity, with no assessment-only renderer boundary and no absolute chat ban that captures Note previews.

- [ ] **Step 5: Commit runtime policy**

```powershell
git add SKILL.md references/physics-pedagogy.md
git commit -m "fix: make all teaching chat renderer-safe"
```

### Task 3: Align public documentation

**Files:**
- Modify: `README.md`
- Modify: `README.zh-CN.md`
- Modify: `CHANGELOG.md`

- [ ] **Step 1: Generalize the user-facing description**

Update both READMEs so ordinary explanations, clarification answers, feedback, progress summaries, navigation, and assessments use renderer-safe conversational mathematics. State the canonical Note/patch/finished-preview exception and the current-chat no-LaTeX fallback after a reported failure.

- [ ] **Step 2: Record the unreleased change**

Replace the assessment-only changelog entry with an all-chat entry. Do not change the released version number or tag history.

- [ ] **Step 3: Verify documentation**

Run:

```powershell
python -X utf8 scripts/check_markdown_links.py README.md README.zh-CN.md CHANGELOG.md docs/architecture.md docs/walkthrough.md
rg -n "Added a chat-math rendering boundary: assessment prompts use|Short mathematics in chat questions and options|聊天题干和选项" README.md README.zh-CN.md CHANGELOG.md
git diff --check
```

Expected: link check passes; the obsolete assessment-only public wording has no matches; diff check passes.

- [ ] **Step 4: Commit documentation**

```powershell
git add README.md README.zh-CN.md CHANGELOG.md
git commit -m "docs: explain dual-surface math rendering"
```

### Task 4: Audit instruction consistency and verify the repository

**Files:**
- Modify only if a verified contradiction is found: `SKILL.md`, `references/physics-pedagogy.md`, or the affected public document.

- [ ] **Step 1: Run the conflict audit**

Inspect all runtime instruction files for these boundaries:

```powershell
rg -n -i "chat|conversation|inline latex|display latex|display block|unicode|plain text|note preview|response-only|assessment prompt|renderer|math delimiter" SKILL.md references assets/templates agents
```

Classify each match as canonical-artifact, conversational, assessment-identity, or unrelated. Fix only a concrete contradiction or ambiguous scope and re-run the static contract after each fix.

- [ ] **Step 2: Run all PowerShell contracts**

```powershell
$contracts = Get-ChildItem tests -Filter '*contract.ps1' | Sort-Object Name
foreach ($contract in $contracts) { & $contract.FullName; if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE } }
```

Expected: every contract exits zero.

- [ ] **Step 3: Run Python, Skill, link, and package validation**

```powershell
python -X utf8 -m unittest discover -s tests -v
python -X utf8 C:/Users/25739/.codex/skills/.system/skill-creator/scripts/quick_validate.py .
python -X utf8 scripts/check_markdown_links.py README.md README.zh-CN.md CHANGELOG.md docs/architecture.md docs/walkthrough.md
python -X utf8 scripts/build_skill_package.py --output dist/theoretical-physics-teach-v0.4.0.zip
```

Expected: unit tests and link check pass, the official validator prints `Skill is valid!`, and the package builds deterministically.

- [ ] **Step 4: Review the final diff and encoding**

```powershell
git diff --check
git status --short
rg -n "ï¿½|â€”|â€“|Ã|Â" SKILL.md references README.md README.zh-CN.md CHANGELOG.md tests
```

Expected: no whitespace errors, no unexpected files, and no mojibake matches.

### Task 5: Deploy the verified Skill

**Files:**
- Synchronize runtime files to: `C:/Users/25739/.agents/skills/theoretical-physics-teach`

- [ ] **Step 1: Commit any final verified fixes**

Stage only intended repository files, inspect the cached diff, and commit with a scope-specific message. Do not commit generated `dist/` output unless it is already tracked by repository policy.

- [ ] **Step 2: Push `main`**

```powershell
git push origin main
```

Expected: the remote `main` advances to the verified local commit.

- [ ] **Step 3: Synchronize the installed runtime without deleting files**

Copy the verified repository runtime files over the matching installed paths. Do not perform a recursive delete or mirror operation. Preserve installed-only state, if any.

- [ ] **Step 4: Validate the installed copy**

```powershell
python -X utf8 C:/Users/25739/.codex/skills/.system/skill-creator/scripts/quick_validate.py C:/Users/25739/.agents/skills/theoretical-physics-teach
```

Expected: `Skill is valid!` and installed `SKILL.md` plus `references/physics-pedagogy.md` are byte-identical to the repository versions.
