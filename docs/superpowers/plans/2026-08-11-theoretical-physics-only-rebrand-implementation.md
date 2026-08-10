# Theoretical-Physics-Only Rebrand Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Rename the Skill, repository, invocation, metadata, release, and active installation to `theoretical-physics-teach`, while preserving the full v0.2.0 teaching workflow and removing non-physics audience positioning and repository-star promotion.

**Architecture:** Treat identity, subject scope, and publication copy as three independently testable contracts. Change current production surfaces only; preserve Git history and old tags. Publish the verified branch, rename the GitHub repository, create `v0.3.0`, install the new package in a correctly named directory, and move the prior installation to a recoverable backup outside Agent Skills discovery.

**Tech Stack:** Agent Skills Markdown, PowerShell contract tests, Python `unittest`, Git worktrees, GitHub CLI, GitHub Actions, Obsidian Markdown, LaTeX.

---

## File map

- Create `tests/rebrand-contract.ps1`: focused identity, subject-scope, and publication contract with selectable sections.
- Modify `SKILL.md`: new Skill name, invocation, title, and theoretical-physics-only operating scope.
- Modify `agents/openai.yaml`: new display name while retaining explicit-only policy.
- Modify `README.md`: new name, URLs, install paths, invocation examples, audience, release, and neutral ending.
- Modify `references/physics-pedagogy.md`: retain formal prerequisites inside physics while removing a separate subject track.
- Modify `assets/templates/MISSION.md`: record physics-relevant formal prerequisites without positioning another curriculum.
- Modify `assets/templates/CONCEPT-MAP.md`: name nodes as physical concepts or physics-required formal prerequisites.
- Modify `assets/templates/LESSON.md`: keep theorem/proof support only inside a physical learning target.
- Modify `tests/static-contract.ps1`: assert the new identity, invocation, and release.
- Modify `.github/workflows/validate.yml`: run the focused rebrand contract in CI.
- Create this implementation plan only as process documentation; historical plans and tags remain unchanged.

### Task 1: Add the failing rebrand contract

**Files:**
- Create: `tests/rebrand-contract.ps1`

- [ ] **Step 1: Write the selectable contract before changing production**

Create `tests/rebrand-contract.ps1` with three sections:

```powershell
param(
    [ValidateSet('Identity', 'Scope', 'Publication', 'All')]
    [string]$Section = 'All'
)

$ErrorActionPreference = 'Stop'
$repoRoot = (Resolve-Path (Join-Path $PSScriptRoot '..')).Path
$failures = [System.Collections.Generic.List[string]]::new()

function Read-Utf8([string]$RelativePath) {
    return [System.IO.File]::ReadAllText(
        (Join-Path $repoRoot $RelativePath),
        [System.Text.UTF8Encoding]::new($false, $true)
    )
}

function Assert-Rebrand([bool]$Condition, [string]$Message) {
    if ($Condition) {
        Write-Output "PASS: $Message"
    } else {
        Write-Output "FAIL: $Message"
        $failures.Add($Message)
    }
}

$skill = Read-Utf8 'SKILL.md'
$metadata = Read-Utf8 'agents/openai.yaml'
$readme = Read-Utf8 'README.md'

if ($Section -in @('Identity', 'All')) {
    Assert-Rebrand ($skill -match '(?m)^name:\s*theoretical-physics-teach\s*$') 'new Skill name is canonical'
    Assert-Rebrand ($skill.Contains('$theoretical-physics-teach')) 'new explicit invocation is documented'
    Assert-Rebrand ($metadata -match '(?m)^\s*display_name:\s*"Theoretical Physics Teach"\s*$') 'Codex display name is physics-only'
    Assert-Rebrand ($metadata -match '(?m)^\s*allow_implicit_invocation:\s*false\s*$') 'explicit-only policy is preserved'
    Assert-Rebrand ($readme.Contains('github.com/jiangweiqi001/theoretical-physics-teach')) 'README uses the new repository URL'
    Assert-Rebrand ($readme.Contains('$theoretical-physics-teach')) 'README uses the new invocation'
    foreach ($text in @($skill, $metadata, $readme)) {
        Assert-Rebrand (-not $text.Contains('theoretical-physics-math-teach')) 'current identity surface contains no former identifier'
    }
}

if ($Section -in @('Scope', 'All')) {
    $scopeFiles = @(
        'SKILL.md',
        'README.md',
        'references/physics-pedagogy.md',
        'assets/templates/MISSION.md',
        'assets/templates/CONCEPT-MAP.md',
        'assets/templates/LESSON.md'
    )
    $scopeText = ($scopeFiles | ForEach-Object { Read-Utf8 $_ }) -join "`n"
    foreach ($forbidden in @(
        'pure mathematics',
        'pure-mathematics',
        'physics and mathematics',
        'supporting mathematics',
        'Mathematics background reported by the learner'
    )) {
        Assert-Rebrand (
            $scopeText.IndexOf($forbidden, [System.StringComparison]::OrdinalIgnoreCase) -lt 0
        ) "production scope omits: $forbidden"
    }
    Assert-Rebrand ($readme.Contains('## Who this is for')) 'README retains a clear audience section'
    Assert-Rebrand ($readme.Contains('theoretical physics only')) 'README states the single-subject boundary'
}

if ($Section -in @('Publication', 'All')) {
    Assert-Rebrand ($readme.Contains('Current release: `v0.3.0`.')) 'README names v0.3.0'
    Assert-Rebrand (
        -not [regex]::IsMatch($readme, '(?i)\b(?:star|starring)\s+(?:this\s+|the\s+)?repository\b')
    ) 'README contains no repository-star request'
    Assert-Rebrand ($readme.Contains('actions/workflows/validate.yml/badge.svg')) 'README retains the validation badge'
}

if ($failures.Count -gt 0) { exit 1 }
Write-Output 'Theoretical-physics-only rebrand contract passed.'
```

- [ ] **Step 2: Run all three sections and verify RED**

Run:

```powershell
& .\tests\rebrand-contract.ps1 -Section Identity
& .\tests\rebrand-contract.ps1 -Section Scope
& .\tests\rebrand-contract.ps1 -Section Publication
```

Expected: each command exits `1`. Identity reports the former Skill/repository/invocation; Scope reports the former audience phrases; Publication reports `v0.2.0` and the repository-star request.

- [ ] **Step 3: Commit the RED contract**

```powershell
git add -- tests/rebrand-contract.ps1
git diff --cached --check
git commit -m "test: define theoretical physics only identity"
```

Expected: one new test file committed; production remains unchanged and RED.

### Task 2: Migrate the active identity

**Files:**
- Modify: `SKILL.md`
- Modify: `agents/openai.yaml`
- Modify: `README.md`
- Modify: `tests/static-contract.ps1`

- [ ] **Step 1: Confirm the identity section still fails**

Run:

```powershell
& .\tests\rebrand-contract.ps1 -Section Identity
```

Expected: exit `1` for the Skill name, invocation, metadata, repository URL, and former identifier.

- [ ] **Step 2: Replace the canonical Skill identity**

Apply these exact identity values:

```yaml
---
name: theoretical-physics-teach
description: Use when a user explicitly invokes this skill to study supplied theoretical-physics papers, textbooks, lecture notes, or associated code across multiple sessions.
---
```

Use this title and invocation in `SKILL.md`:

```markdown
# Theoretical Physics Teach

Run only after the user explicitly invokes `$theoretical-physics-teach`; never activate it implicitly.
```

Update `agents/openai.yaml` without changing the policy:

```yaml
interface:
  display_name: "Theoretical Physics Teach"
  short_description: "Study theory sources with rigorous derivations"
policy:
  allow_implicit_invocation: false
```

Replace every current README identity, URL, badge URL, clone destination, update path, comparison-table label, and invocation example with `theoretical-physics-teach`.

Update `tests/static-contract.ps1`:

```powershell
$namePattern = '(?m)^name:\s*theoretical-physics-teach\s*$'
```

and construct the Chinese example around:

```powershell
' `$theoretical-physics-teach` '
```

- [ ] **Step 3: Verify the identity section is GREEN**

Run:

```powershell
& .\tests\rebrand-contract.ps1 -Section Identity
& .\tests\static-contract.ps1
python -X utf8 "C:\Users\25739\.codex\skills\.system\skill-creator\scripts\quick_validate.py" .
```

Expected: all three commands exit `0`; `quick_validate.py` prints `Skill is valid!`.

- [ ] **Step 4: Commit the identity migration**

```powershell
git add -- SKILL.md agents/openai.yaml README.md tests/static-contract.ps1
git diff --cached --check
git commit -m "refactor: rename skill to theoretical physics teach"
```

### Task 3: Enforce the theoretical-physics-only scope

**Files:**
- Modify: `SKILL.md`
- Modify: `README.md`
- Modify: `references/physics-pedagogy.md`
- Modify: `assets/templates/MISSION.md`
- Modify: `assets/templates/CONCEPT-MAP.md`
- Modify: `assets/templates/LESSON.md`

- [ ] **Step 1: Confirm the scope section is RED**

Run:

```powershell
& .\tests\rebrand-contract.ps1 -Section Scope
```

Expected: exit `1` and named failures for the former audience/curriculum phrases.

- [ ] **Step 2: Tighten `SKILL.md` without weakening formal rigor**

Replace the opening scope with:

```markdown
Run only after the user explicitly invokes `$theoretical-physics-teach`; never activate it implicitly. Teach theoretical physics from the supplied sources. Introduce formal prerequisites only inside the physical theory, derivation, proof, structural comparison, or implementation that needs them, and name that downstream physical use.

Use only materials the user supplies or explicitly places in scope. Do not browse for replacements, add external sources, widen the mission, or construct a separate non-physics curriculum without the user's approval.
```

Replace the separate-lesson rule with:

```markdown
For physics, explain the physical meaning of important terms and observables and perform applicable dimensional/unit, limiting-case, symmetry/conservation, sign, normalization, and boundary checks. When a theorem or proof step is required by the physical argument, state its hypotheses, complete proof structure, edge cases or counterexamples, and exact role in that argument.
```

- [ ] **Step 3: Tighten protocol and templates**

Use physics-contained language:

```markdown
Use this protocol for diagnostics, lessons, clarification, review, and mastery decisions in theoretical physics. Introduce a formal prerequisite only when the physical theory, derivation, proof, structural comparison, or implementation depends on it, and state that exact physical use.
```

In `references/physics-pedagogy.md`, replace the separate-prerequisite branch with a theorem/proof step inside the physical argument.

Use these template labels:

```markdown
- Formal prerequisites relevant to the physical learning targets, reported by the learner:
```

```markdown
| Node ID | Physical concept or physics-required formal prerequisite | Scope | Exact source anchors | Mastery level | Status | Supporting Evidence ID + Obsidian link | Lesson path |
```

In `LESSON.md`, replace both separate-subject sentences with instructions for a theorem or proof step required by the physical argument. Preserve the notation-first contract, full derivation, physical interpretation, dimensional checks, and final checkpoint unchanged.

- [ ] **Step 4: Rewrite the README audience boundary**

State this exact boundary near the project introduction or audience section:

```markdown
This project is for theoretical physics only. Formal tools, theorem statements, and proof steps are developed when a physical argument requires them; they are not presented as a separate curriculum or audience.
```

Remove the former audience paragraph, the `related mathematical prerequisites` phrase, and the historical prototype phrase `physics and mathematics`. Keep the concrete physics areas, long derivations, source comparison, Obsidian workflow, and code bridge.

- [ ] **Step 5: Verify Scope GREEN and preserve template contracts**

Run:

```powershell
& .\tests\rebrand-contract.ps1 -Section Scope
& .\tests\static-contract.ps1
& .\tests\bootstrap-contract.ps1
git diff --check
```

Expected: all commands exit `0`.

- [ ] **Step 6: Commit the scope migration**

```powershell
git add -- SKILL.md README.md references/physics-pedagogy.md assets/templates/MISSION.md assets/templates/CONCEPT-MAP.md assets/templates/LESSON.md
git diff --cached --check
git commit -m "refactor: focus teaching scope on theoretical physics"
```

### Task 4: Finalize v0.3.0 publication copy and CI

**Files:**
- Modify: `README.md`
- Modify: `tests/static-contract.ps1`
- Modify: `.github/workflows/validate.yml`

- [ ] **Step 1: Confirm the publication section is RED**

Run:

```powershell
& .\tests\rebrand-contract.ps1 -Section Publication
```

Expected: exit `1` because README still names `v0.2.0` and requests a repository star.

- [ ] **Step 2: Publish neutral current copy**

Set:

```markdown
Current release: `v0.3.0`.
```

Remove the repository-star request. End the README with a factual statement about the maintained theoretical-physics workflow and existing MIT attribution, without a popularity claim or engagement request.

Change the static publication assertion from:

```powershell
'v0.2.0'
```

to:

```powershell
'v0.3.0'
```

- [ ] **Step 3: Add the contract to CI**

In `.github/workflows/validate.yml`, insert after checkout/setup and before the existing static contract:

```yaml
      - name: Theoretical-physics-only identity contract
        shell: pwsh
        run: ./tests/rebrand-contract.ps1 -Section All
```

- [ ] **Step 4: Verify publication and CI contracts GREEN**

Run:

```powershell
& .\tests\rebrand-contract.ps1 -Section Publication
& .\tests\rebrand-contract.ps1 -Section All
& .\tests\static-contract.ps1
git diff --check
```

Expected: all commands exit `0`; the final line of the rebrand test is `Theoretical-physics-only rebrand contract passed.`

- [ ] **Step 5: Commit publication copy**

```powershell
git add -- README.md tests/static-contract.ps1 .github/workflows/validate.yml
git diff --cached --check
git commit -m "docs: prepare theoretical physics teach v0.3.0"
```

### Task 5: Run complete local verification

**Files:**
- Verify only; no expected production changes.

- [ ] **Step 1: Run every contract and unit test**

```powershell
$ErrorActionPreference = 'Stop'
& .\tests\rebrand-contract.ps1 -Section All
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }
& .\tests\static-contract.ps1
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }
& .\tests\bootstrap-contract.ps1
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }
& .\tests\scenario-contract.ps1
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }
& .\tests\green-contract.ps1
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }
python -m unittest tests.test_validate_workspace -v
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }
python -X utf8 "C:\Users\25739\.codex\skills\.system\skill-creator\scripts\quick_validate.py" .
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }
python .\scripts\validate_workspace.py .\tests\fixtures\validator\valid
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }
git diff --check
git status --short
```

Expected: all contracts PASS, 6 Python tests PASS, `Skill is valid!`, valid fixture exits `0`, no whitespace errors, clean worktree.

- [ ] **Step 2: Run focused forbidden-copy scan**

```powershell
& .\tests\rebrand-contract.ps1 -Section All
rg -n -i "pure mathematics|pure-mathematics|physics and mathematics|supporting mathematics|star the repository|starring the repository|theoretical-physics-math-teach" SKILL.md agents/openai.yaml README.md references assets/templates
```

Expected: contract exits `0`; `rg` returns no matches on current production surfaces. Technical terms required to describe formulas and formal physics steps are allowed.

### Task 6: Integrate, rename GitHub, and publish v0.3.0

**Files:**
- External state: Git branch, GitHub repository metadata, release.

- [ ] **Step 1: Push the verified feature branch**

```powershell
git push -u origin codex/theoretical-physics-rebrand
```

Expected: branch exists on GitHub at the verified HEAD.

- [ ] **Step 2: Fast-forward main from the primary checkout**

Run from `C:\Users\25739\Desktop\Obsidian\tmp\github\theoretical-physics-math-teach`:

```powershell
git status --short
git switch main
git merge --ff-only codex/theoretical-physics-rebrand
git push origin main
```

Expected: clean main fast-forwards and the push succeeds without rewriting history.

- [ ] **Step 3: Wait for exact-SHA CI success before rename**

```powershell
$head = git rev-parse HEAD
& "C:\Program Files\GitHub CLI\gh.exe" run list --repo jiangweiqi001/theoretical-physics-math-teach --workflow validate --branch main --limit 5 --json databaseId,headSha,status,conclusion,url
```

Select only the run whose `headSha` equals `$head`, then:

```powershell
$runsJson = & "C:\Program Files\GitHub CLI\gh.exe" run list --repo jiangweiqi001/theoretical-physics-math-teach --workflow validate --branch main --limit 5 --json databaseId,headSha,status,conclusion,url
$run = ($runsJson | ConvertFrom-Json) | Where-Object headSha -EQ $head | Select-Object -First 1
if (-not $run) { throw "No validation run found for $head" }
& "C:\Program Files\GitHub CLI\gh.exe" run watch $run.databaseId --repo jiangweiqi001/theoretical-physics-math-teach --exit-status
```

Expected: exact-SHA run exits `0`.

- [ ] **Step 4: Rename the GitHub repository and update the shared remote**

```powershell
& "C:\Program Files\GitHub CLI\gh.exe" repo rename -R jiangweiqi001/theoretical-physics-math-teach theoretical-physics-teach --yes
git remote set-url origin https://github.com/jiangweiqi001/theoretical-physics-teach.git
git remote -v
```

Expected: repository is now `jiangweiqi001/theoretical-physics-teach`; fetch/push URLs use the new name.

- [ ] **Step 5: Set physics-only repository metadata and verify redirects**

```powershell
& "C:\Program Files\GitHub CLI\gh.exe" repo edit jiangweiqi001/theoretical-physics-teach --description "Source-driven theoretical-physics teaching skill with coherent Obsidian Notes, exact resume state, and optional code-theory mapping." --add-topic agent-skills --add-topic theoretical-physics --add-topic physics-education --add-topic obsidian --add-topic latex --add-topic research-papers --add-topic many-body-physics --add-topic quantum-field-theory
& "C:\Program Files\GitHub CLI\gh.exe" repo view jiangweiqi001/theoretical-physics-teach --json nameWithOwner,description,repositoryTopics,url
git ls-remote https://github.com/jiangweiqi001/theoretical-physics-math-teach.git refs/heads/main
```

Expected: new metadata names theoretical physics only; the old Git URL resolves through GitHub's redirect to the same main SHA.

- [ ] **Step 6: Confirm migrated CI and create the release**

```powershell
$head = git rev-parse HEAD
& "C:\Program Files\GitHub CLI\gh.exe" run list --repo jiangweiqi001/theoretical-physics-teach --workflow validate --branch main --limit 5 --json databaseId,headSha,status,conclusion,url
& "C:\Program Files\GitHub CLI\gh.exe" release view v0.3.0 --repo jiangweiqi001/theoretical-physics-teach
```

Expected: the exact `$head` run remains `completed/success`; release lookup reports `release not found`.

Create:

```powershell
$releaseNotes = @'
This release establishes the project's theoretical-physics-only identity while preserving the complete source-driven learning workflow.

Highlights:
- New canonical Skill name and explicit invocation: theoretical-physics-teach.
- Exact equation-, section-, and block-level resume state.
- Coherent in-place clarification writeback with full-Note continuity checks.
- Obsidian-compatible Markdown and dollar-delimited LaTeX.
- Option-first diagnosis and checkpoints without confusing recognition with reconstruction.
- Optional theory-first code mapping only for trustworthy corresponding material.
- Public contracts preventing identity and audience-positioning regressions.

This remains an independent MIT-licensed project created and maintained by jiangweiqi001, with upstream attribution retained in LICENSE and NOTICE.md.
'@
& "C:\Program Files\GitHub CLI\gh.exe" release create v0.3.0 --repo jiangweiqi001/theoretical-physics-teach --target $head --title "v0.3.0 — theoretical-physics-only identity" --notes $releaseNotes
```

Verify the exact tag and release state:

```powershell
$tagRow = git ls-remote origin refs/tags/v0.3.0
$tagSha = ($tagRow -split "`t")[0]
$releaseJson = & "C:\Program Files\GitHub CLI\gh.exe" release view v0.3.0 --repo jiangweiqi001/theoretical-physics-teach --json tagName,isDraft,isPrerelease,targetCommitish,url
$release = $releaseJson | ConvertFrom-Json
if ($tagSha -ne $head) { throw "Tag mismatch: $tagSha != $head" }
if ($release.targetCommitish -ne $head) { throw "Release target mismatch: $($release.targetCommitish) != $head" }
if ($release.isDraft -or $release.isPrerelease) { throw 'Release is not final.' }
```

Expected: no exception; tag and release target both equal `$head`, with draft and prerelease false.

### Task 7: Install the new identity and preserve the previous installation

**Files:**
- Create: `C:\Users\25739\.agents\skills\theoretical-physics-teach\...`
- Move, do not delete: prior installed Skill to `C:\Users\25739\Desktop\Obsidian\tmp\skill-backups\theoretical-physics-math-teach-v0.2.0`
- Create: `C:\Users\25739\Desktop\Obsidian\tmp\github\theoretical-physics-teach\...` as the correctly named development clone.

- [ ] **Step 1: Copy every tracked release file into the new install directory**

Run from verified main:

```powershell
$repoRoot = (Get-Location).Path
$newInstall = 'C:\Users\25739\.agents\skills\theoretical-physics-teach'
if (Test-Path -LiteralPath $newInstall) { throw "New install target already exists: $newInstall" }
New-Item -ItemType Directory -Path $newInstall | Out-Null
$tracked = git ls-files
foreach ($relativePath in $tracked) {
    $source = Join-Path $repoRoot $relativePath
    if (Test-Path -LiteralPath $source -PathType Leaf) {
        $destination = Join-Path $newInstall $relativePath
        $parent = Split-Path -Parent $destination
        if (-not (Test-Path -LiteralPath $parent -PathType Container)) {
            New-Item -ItemType Directory -Path $parent -Force | Out-Null
        }
        Copy-Item -LiteralPath $source -Destination $destination
    }
}
```

- [ ] **Step 2: Compare hashes and validate the installed package**

Hash every tracked file in source and destination and require zero mismatches:

```powershell
$mismatches = [System.Collections.Generic.List[string]]::new()
foreach ($relativePath in $tracked) {
    $source = Join-Path $repoRoot $relativePath
    if (Test-Path -LiteralPath $source -PathType Leaf) {
        $destination = Join-Path $newInstall $relativePath
        if (-not (Test-Path -LiteralPath $destination -PathType Leaf)) {
            $mismatches.Add("missing: $relativePath")
            continue
        }
        $sourceHash = (Get-FileHash -Algorithm SHA256 -LiteralPath $source).Hash
        $destinationHash = (Get-FileHash -Algorithm SHA256 -LiteralPath $destination).Hash
        if ($sourceHash -ne $destinationHash) { $mismatches.Add("hash: $relativePath") }
    }
}
if ($mismatches.Count -gt 0) { $mismatches; throw 'Installed package differs from release tree.' }
```

From `C:\Users\25739\.agents\skills\theoretical-physics-teach`, run:

```powershell
$ErrorActionPreference = 'Stop'
& .\tests\rebrand-contract.ps1 -Section All
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }
& .\tests\static-contract.ps1
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }
& .\tests\bootstrap-contract.ps1
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }
& .\tests\scenario-contract.ps1
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }
& .\tests\green-contract.ps1
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }
python -m unittest tests.test_validate_workspace -v
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }
python -X utf8 "C:\Users\25739\.codex\skills\.system\skill-creator\scripts\quick_validate.py" .
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }
python .\scripts\validate_workspace.py .\tests\fixtures\validator\valid
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }
```

Expected: zero hash mismatches; all contracts and 6 unit tests PASS; `Skill is valid!`; valid fixture exits `0`.

- [ ] **Step 3: Move the prior installation to a recoverable backup**

Resolve and validate exact paths before moving:

```powershell
$oldInstall = [System.IO.Path]::GetFullPath('C:\Users\25739\.agents\skills\theoretical-physics-math-teach')
$skillsRoot = [System.IO.Path]::GetFullPath('C:\Users\25739\.agents\skills')
$backupRoot = [System.IO.Path]::GetFullPath('C:\Users\25739\Desktop\Obsidian\tmp\skill-backups')
$backupPath = [System.IO.Path]::GetFullPath((Join-Path $backupRoot 'theoretical-physics-math-teach-v0.2.0'))
if (-not $oldInstall.StartsWith($skillsRoot + [System.IO.Path]::DirectorySeparatorChar, [System.StringComparison]::OrdinalIgnoreCase)) { throw 'Old install is outside the expected skills root.' }
if (-not $backupPath.StartsWith($backupRoot + [System.IO.Path]::DirectorySeparatorChar, [System.StringComparison]::OrdinalIgnoreCase)) { throw 'Backup target is outside the intended backup root.' }
if (Test-Path -LiteralPath $backupPath) { throw "Backup target already exists: $backupPath" }
New-Item -ItemType Directory -Path $backupRoot -Force | Out-Null
Move-Item -LiteralPath $oldInstall -Destination $backupPath
```

Expected: no deletion; the prior package is recoverable at the explicit backup path and no longer discoverable under `.agents\skills`.

- [ ] **Step 4: Create the correctly named canonical development clone**

```powershell
$newCheckout = 'C:\Users\25739\Desktop\Obsidian\tmp\github\theoretical-physics-teach'
if (Test-Path -LiteralPath $newCheckout) { throw "Checkout target already exists: $newCheckout" }
git clone https://github.com/jiangweiqi001/theoretical-physics-teach.git $newCheckout
git -C $newCheckout status --short
git -C $newCheckout rev-parse HEAD
```

Expected: new checkout is clean and HEAD equals the `v0.3.0` release commit. Preserve the older checkout and registered worktrees; do not delete them.

- [ ] **Step 5: Final end-to-end verification**

Confirm:

```powershell
Get-ChildItem -LiteralPath 'C:\Users\25739\.agents\skills' -Directory | Where-Object Name -Like 'theoretical-physics*' | Select-Object FullName
& "C:\Program Files\GitHub CLI\gh.exe" release view v0.3.0 --repo jiangweiqi001/theoretical-physics-teach --json tagName,isDraft,isPrerelease,targetCommitish,url
& "C:\Program Files\GitHub CLI\gh.exe" run list --repo jiangweiqi001/theoretical-physics-teach --workflow validate --branch main --limit 1 --json headSha,status,conclusion,url
```

Expected: only the new active install is under Agent Skills discovery; release and CI point to the same main SHA; prior install exists only in the explicit backup; no directory was deleted.
