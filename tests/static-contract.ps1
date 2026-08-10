[CmdletBinding()]
param()

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

$repoRoot = (Resolve-Path -LiteralPath (Join-Path $PSScriptRoot '..')).Path
$failures = [System.Collections.Generic.List[string]]::new()

function Assert-Contract {
    param(
        [Parameter(Mandatory = $true)]
        [bool]$Condition,

        [Parameter(Mandatory = $true)]
        [string]$Message
    )

    if ($Condition) {
        Write-Output "PASS: $Message"
        return
    }

    $script:failures.Add($Message) | Out-Null
    [Console]::Error.WriteLine("FAIL: $Message")
}

function Get-RepositoryText {
    param(
        [Parameter(Mandatory = $true)]
        [string]$RelativePath
    )

    $path = Join-Path $repoRoot $RelativePath
    if (-not (Test-Path -LiteralPath $path -PathType Leaf)) {
        return ''
    }

    $utf8 = [System.Text.UTF8Encoding]::new($false, $true)
    return [System.IO.File]::ReadAllText($path, $utf8)
}

function Get-RepositoryRelativePath {
    param(
        [Parameter(Mandatory = $true)]
        [string]$FullPath
    )

    return $FullPath.Substring($repoRoot.Length).TrimStart([char[]]@('/', '\')) -replace '\\', '/'
}

function Get-InstructionMatchDiagnostics {
    param(
        [Parameter(Mandatory = $true)]
        [System.Collections.Generic.IEnumerable[string]]$Paths,

        [Parameter(Mandatory = $true)]
        [string]$Pattern
    )

    foreach ($path in $Paths) {
        $relativePath = Get-RepositoryRelativePath $path
        $utf8 = [System.Text.UTF8Encoding]::new($false, $true)
        $text = [System.IO.File]::ReadAllText($path, $utf8)
        foreach ($match in [regex]::Matches($text, $Pattern)) {
            $snippet = [regex]::Replace($match.Value, '\s+', ' ').Trim()
            if ($snippet.Length -gt 120) {
                $snippet = $snippet.Substring(0, 117) + '...'
            }
            "${relativePath}: $snippet"
        }
    }
}

$requiredPaths = @(
    'SKILL.md'
    'agents/openai.yaml'
    'references/source-workflow.md'
    'references/physics-pedagogy.md'
    'references/code-theory-bridge.md'
    'assets/templates/MISSION.md'
    'assets/templates/BASELINE.md'
    'assets/templates/MATERIALS.md'
    'assets/templates/ROADMAP.md'
    'assets/templates/CURRENT-STATE.md'
    'assets/templates/CONCEPT-MAP.md'
    'assets/templates/NOTATION-CROSSWALK.md'
    'assets/templates/GLOSSARY.md'
    'assets/templates/SYNTHESIS.md'
    'assets/templates/OPEN-QUESTIONS.md'
    'assets/templates/REVIEW-QUEUE.md'
    'assets/templates/NOTES.md'
    'assets/templates/LESSON.md'
    'assets/templates/LEARNING-RECORD.md'
    'README.md'
    'LICENSE'
    'NOTICE.md'
    '.github/workflows/validate.yml'
    'scripts/validate_workspace.py'
    'tests/test_validate_workspace.py'
    'tests/scenario-contract.ps1'
    'tests/scenarios/04-coherent-clarification-writeback.md'
    'tests/scenarios/05-conditional-code-explanation.md'
)

foreach ($relativePath in $requiredPaths) {
    $exists = Test-Path -LiteralPath (Join-Path $repoRoot $relativePath) -PathType Leaf
    Assert-Contract $exists "required file exists: $relativePath"
}

$skillText = Get-RepositoryText 'SKILL.md'
$pedagogyText = Get-RepositoryText 'references/physics-pedagogy.md'
$codeBridgeText = Get-RepositoryText 'references/code-theory-bridge.md'
$skillFrontmatter = ''
$frontmatterMatch = [regex]::Match(
    $skillText,
    '\A---\r?\n(?<frontmatter>.*?)\r?\n---(?:\r?\n|\z)',
    [System.Text.RegularExpressions.RegexOptions]::Singleline
)
if ($frontmatterMatch.Success) {
    $skillFrontmatter = $frontmatterMatch.Groups['frontmatter'].Value
}

$expectedDescription = 'Use when a user explicitly invokes this skill to study supplied theoretical-physics papers, textbooks, lecture notes, or associated code across multiple sessions.'
$namePattern = '(?m)^name:\s*theoretical-physics-math-teach\s*$'
$descriptionPattern = '(?m)^description:\s*["'']?' + [regex]::Escape($expectedDescription) + '["'']?\s*$'

Assert-Contract ([regex]::IsMatch($skillFrontmatter, $namePattern)) 'SKILL.md frontmatter has the exact skill name'
Assert-Contract ([regex]::IsMatch($skillFrontmatter, $descriptionPattern)) 'SKILL.md frontmatter has the explicit-invocation description'

$openAiMetadata = Get-RepositoryText 'agents/openai.yaml'
Assert-Contract (
    [regex]::IsMatch($openAiMetadata, '(?m)^\s*allow_implicit_invocation:\s*false\s*$')
) 'agents/openai.yaml disables implicit invocation'

foreach ($requiredSkillPhrase in @(
    'CURRENT-STATE.md'
    'NOTATION-CROSSWALK.md'
    'SYNTHESIS.md'
    'conversation writeback'
    'scripts/validate_workspace.py'
)) {
    Assert-Contract (
        $skillText.IndexOf($requiredSkillPhrase, [System.StringComparison]::OrdinalIgnoreCase) -ge 0
    ) "SKILL.md mentions $requiredSkillPhrase"
}

$longNotePattern = '(?is)(?:\bno\s+Note\s+length\s+cap\b|\bNotes?\b.{0,80}\b(?:may|can)\s+be\s+long\b|\bNotes?\b.{0,80}\bas long as (?:is )?required\b)'
$noSkippedStepsPattern = '(?is)\bno\s+skipped\s+calculation\s+(?:or|and)\s+logic\s+steps\b'
Assert-Contract ([regex]::IsMatch($skillText, $longNotePattern)) 'SKILL.md explicitly permits Notes to be as long as required'
Assert-Contract ([regex]::IsMatch($skillText, $noSkippedStepsPattern)) 'SKILL.md forbids skipped calculation or logic steps'

$lessonTemplate = Get-RepositoryText 'assets/templates/LESSON.md'
$baselineTemplate = Get-RepositoryText 'assets/templates/BASELINE.md'
$currentStateTemplate = Get-RepositoryText 'assets/templates/CURRENT-STATE.md'
$learningRecordTemplate = Get-RepositoryText 'assets/templates/LEARNING-RECORD.md'
$reviewQueueTemplate = Get-RepositoryText 'assets/templates/REVIEW-QUEUE.md'
$firstLevelTwoHeading = [regex]::Match($lessonTemplate, '(?m)^##[ \t]+([^\r\n]+)')
Assert-Contract (
    $firstLevelTwoHeading.Success -and
    $firstLevelTwoHeading.Groups[1].Value.Trim() -ceq 'Notation and conventions'
) 'LESSON.md starts with the leading section ## Notation and conventions'

$defineBeforeUsePattern = '(?is)\b(?:define(?:s|d)? every new symbol|every new symbol (?:must be |is )?defined)\b.{0,80}\bbefore (?:first )?use\b'
Assert-Contract (
    [regex]::IsMatch($lessonTemplate, $defineBeforeUsePattern)
) 'LESSON.md requires every new symbol to be defined before use'

$coherentWritebackPolicy = 'A coherent writeback must make the Note read as if the clarification had been designed in place from the start.'
$detachedAppendixPolicy = 'Do not append a detached chat transcript or clarification appendix.'
$optionDefaultPolicy = 'Multiple-choice or true/false is the default for initial diagnosis, end-of-Note checkpoints, and ordinary knowledge checks.'
$recognitionBoundaryPolicy = 'Passing an option item alone does not establish reconstruction mastery.'
$finalCheckpointHeading = 'End-of-Note checkpoint'
$headingLinkPolicy = 'Use [[note#heading]] for section links and [[note#^block-id]] only when an exact equation or derivation step needs a stable deep link.'
$codeEligibilityPolicy = 'Use corresponding implementation material only when it is official or author-associated open-source code at a pinned commit, a user-supplied immutable snapshot, or anchored pseudocode sufficient for the mapping.'

foreach ($policyTarget in @(
    @{ Name = 'SKILL.md'; Text = $skillText }
    @{ Name = 'references/physics-pedagogy.md'; Text = $pedagogyText }
)) {
    Assert-Contract (
        $policyTarget.Text.Contains($coherentWritebackPolicy)
    ) "$($policyTarget.Name) requires coherent in-place writeback"
    Assert-Contract (
        $policyTarget.Text.Contains($detachedAppendixPolicy)
    ) "$($policyTarget.Name) forbids detached clarification appendices"
    Assert-Contract (
        $policyTarget.Text.Contains($optionDefaultPolicy)
    ) "$($policyTarget.Name) defaults assessments to option questions"
    Assert-Contract (
        $policyTarget.Text.Contains($recognitionBoundaryPolicy)
    ) "$($policyTarget.Name) separates recognition from reconstruction"
}

$levelTwoHeadings = [regex]::Matches($lessonTemplate, '(?m)^##[ \t]+([^\r\n]+)')
$lastLevelTwoHeading = if ($levelTwoHeadings.Count -gt 0) {
    $levelTwoHeadings[$levelTwoHeadings.Count - 1].Groups[1].Value.Trim()
} else {
    ''
}
Assert-Contract (
    $lastLevelTwoHeading -ceq $finalCheckpointHeading
) 'LESSON.md ends with the exact heading ## End-of-Note checkpoint'
Assert-Contract (
    $lessonTemplate.Contains($headingLinkPolicy)
) 'LESSON.md defines Obsidian heading and block deep links'
Assert-Contract (
    $currentStateTemplate.Contains('First unfinished section or block link')
) 'CURRENT-STATE.md stores an exact unfinished deep link'
Assert-Contract (
    $baselineTemplate.Contains('Misconception mapped to each distractor')
) 'BASELINE.md maps distractors to diagnostic meanings'
Assert-Contract (
    $learningRecordTemplate.Contains($recognitionBoundaryPolicy)
) 'LEARNING-RECORD.md separates option evidence from reconstruction'
Assert-Contract (
    $reviewQueueTemplate.Contains($optionDefaultPolicy)
) 'REVIEW-QUEUE.md defaults ordinary review checks to option questions'
Assert-Contract (
    $codeBridgeText.Contains($codeEligibilityPolicy)
) 'code protocol restricts corresponding implementation material'

$mathDelimiterPolicy = 'Use $...$ for inline LaTeX and $$...$$ for display LaTeX.'
foreach ($policyTarget in @(
    @{ Name = 'SKILL.md'; Text = $skillText }
    @{ Name = 'references/physics-pedagogy.md'; Text = $pedagogyText }
    @{ Name = 'assets/templates/LESSON.md'; Text = $lessonTemplate }
)) {
    Assert-Contract (
        $policyTarget.Text.Contains($mathDelimiterPolicy)
    ) "$($policyTarget.Name) states: $mathDelimiterPolicy"
}

$emDash = [char]0x2014
$pendingSourceSentinel = "Unassigned $emDash supplied excerpt; snapshot registration pending"

foreach ($requiredResponseOnlySkillPhrase in @(
    'Stateful course use requires a real user-designated workspace.'
    'response-only finished Note, preview, or exact patch'
    'Provisional response-only artifact; no canonical write performed.'
    $pendingSourceSentinel
    'Canonical writeback is not complete.'
    'If response-only was not explicitly requested, ask for the workspace and stop.'
)) {
    Assert-Contract (
        $skillText.Contains($requiredResponseOnlySkillPhrase)
    ) "SKILL.md states response-only policy: $requiredResponseOnlySkillPhrase"
}

foreach ($requiredResponseOnlyPedagogyPhrase in @(
    'response-only finished Note, preview, or exact patch'
    'Provisional response-only artifact; no canonical write performed.'
    $pendingSourceSentinel
    'Canonical writeback is not complete.'
)) {
    Assert-Contract (
        $pedagogyText.Contains($requiredResponseOnlyPedagogyPhrase)
    ) "physics-pedagogy.md states response-only policy: $requiredResponseOnlyPedagogyPhrase"
}

$provisionalIdPolicies = @(
    'Only after reading the complete canonical index may you allocate a stable ID.'
    'Absence from the prompt is not evidence that an index is empty.'
    '{{EVIDENCE_ID_PENDING}}'
    'no live Obsidian link'
    'Do not claim that a canonical record was created.'
)
foreach ($provisionalIdTarget in @(
    @{ Name = 'SKILL.md'; Text = $skillText }
    @{ Name = 'references/physics-pedagogy.md'; Text = $pedagogyText }
    @{ Name = 'assets/templates/LESSON.md'; Text = $lessonTemplate }
)) {
    foreach ($provisionalIdPolicy in $provisionalIdPolicies) {
        Assert-Contract (
            $provisionalIdTarget.Text.Contains($provisionalIdPolicy)
        ) "$($provisionalIdTarget.Name) states provisional ID policy: $provisionalIdPolicy"
    }
}

$notationContinuationPolicy = 'Before first use of any new symbol in added prose or formulas, display or apply a patch to the leading notation section that completes every symbol-definition field.'
$symbolInventoryPolicy = 'Perform a symbol inventory audit before delivery.'
$continuationHeadingPolicy = 'The first H2 of that continuation output must still be exactly `## Notation and conventions`.'
$leftToRightNotationPolicy = 'Audit the notation section from top to bottom and each entry from left to right.'
$notationGraphPolicy = 'Build the complete symbol-and-code-identifier dependency graph before drafting the notation section, then emit entries in topological order.'
$completeGroupedEntryPolicy = 'A grouped entry is allowed only when it completely defines every member and uses no dependency that is defined later.'
$historicalEvidencePolicy = 'Preserve each dated prior Evidence boundary explicitly: date, evidence category, exact capability demonstrated, and exact unfinished boundary.'
foreach ($notationPolicyTarget in @(
    @{ Name = 'SKILL.md'; Text = $skillText }
    @{ Name = 'references/physics-pedagogy.md'; Text = $pedagogyText }
)) {
    Assert-Contract (
        $notationPolicyTarget.Text.Contains($notationContinuationPolicy)
    ) "$($notationPolicyTarget.Name) requires the continuation notation patch"
    Assert-Contract (
        $notationPolicyTarget.Text.Contains($symbolInventoryPolicy)
    ) "$($notationPolicyTarget.Name) requires a pre-delivery symbol inventory"
    Assert-Contract (
        $notationPolicyTarget.Text.Contains($continuationHeadingPolicy)
    ) "$($notationPolicyTarget.Name) preserves the exact first H2 in continuation output"
    Assert-Contract (
        $notationPolicyTarget.Text.Contains($leftToRightNotationPolicy)
    ) "$($notationPolicyTarget.Name) requires a mechanical notation dependency audit"
    Assert-Contract (
        $notationPolicyTarget.Text.Contains($notationGraphPolicy)
    ) "$($notationPolicyTarget.Name) requires a notation dependency graph"
    Assert-Contract (
        $notationPolicyTarget.Text.Contains($completeGroupedEntryPolicy)
    ) "$($notationPolicyTarget.Name) requires dependency-closed grouped notation entries"
    Assert-Contract (
        $notationPolicyTarget.Text.Contains($historicalEvidencePolicy)
    ) "$($notationPolicyTarget.Name) preserves dated prior Evidence boundaries"
}
Assert-Contract (
    $lessonTemplate.Contains('### Pre-delivery symbol inventory audit') -and
    $lessonTemplate.Contains($symbolInventoryPolicy)
) 'LESSON.md contains an explicit pre-delivery symbol inventory checklist'
Assert-Contract (
    $lessonTemplate.Contains($continuationHeadingPolicy)
) 'LESSON.md preserves the exact first H2 in continuation output'
Assert-Contract (
    $lessonTemplate.Contains($leftToRightNotationPolicy)
) 'LESSON.md requires a mechanical notation dependency audit'
Assert-Contract (
    $lessonTemplate.Contains($notationGraphPolicy)
) 'LESSON.md requires a notation dependency graph'
Assert-Contract (
    $lessonTemplate.Contains($completeGroupedEntryPolicy)
) 'LESSON.md requires dependency-closed grouped notation entries'
Assert-Contract (
    $lessonTemplate.Contains($historicalEvidencePolicy)
) 'LESSON.md preserves dated prior Evidence boundaries'
Assert-Contract (
    $learningRecordTemplate.Contains($historicalEvidencePolicy)
) 'LEARNING-RECORD.md preserves dated prior Evidence boundaries'

$recursiveNotationPolicies = @(
    'First use includes symbols inside another symbol''s definition, domain, units, anchor, convention, or example cell.'
    'Order notation entries by dependency.'
    'clearly grouped mathematical primitives entry'
    'A grouped primitives entry does not waive dependencies: dummy symbols introduced inside it must be defined earlier or eliminated.'
    'Code identifiers, unit glyphs, derived approximants, and error or variation symbols are not exempt; define each separately before first use.'
    'Repeat the inventory scan until no undefined glyph remains.'
)
foreach ($recursiveNotationTarget in @(
    @{ Name = 'SKILL.md'; Text = $skillText }
    @{ Name = 'references/physics-pedagogy.md'; Text = $pedagogyText }
    @{ Name = 'assets/templates/LESSON.md'; Text = $lessonTemplate }
)) {
    foreach ($recursiveNotationPolicy in $recursiveNotationPolicies) {
        Assert-Contract (
            $recursiveNotationTarget.Text.Contains($recursiveNotationPolicy)
        ) "$($recursiveNotationTarget.Name) states recursive notation policy: $recursiveNotationPolicy"
    }
}

$unicodeOutputPolicy = 'Preserve the exact Unicode em dash U+2014 in canonical sentinels; if decoded tool output contains mojibake, repair it before delivery or writeback.'
foreach ($unicodePolicyTarget in @(
    @{ Name = 'SKILL.md'; Text = $skillText }
    @{ Name = 'references/physics-pedagogy.md'; Text = $pedagogyText }
)) {
    Assert-Contract (
        $unicodePolicyTarget.Text.Contains($unicodeOutputPolicy)
    ) "$($unicodePolicyTarget.Name) requires Unicode-sentinel repair before delivery"
    Assert-Contract (
        -not $unicodePolicyTarget.Text.Contains([char]0xFFFD) -and
        -not $unicodePolicyTarget.Text.Contains([char]0x9225)
    ) "$($unicodePolicyTarget.Name) contains no replacement character or known em-dash mojibake"
}

$executionNonClaimPolicy = 'No execution or validation claim is made.'
foreach ($codePolicyTarget in @(
    @{ Name = 'references/code-theory-bridge.md'; Text = $codeBridgeText }
    @{ Name = 'assets/templates/LESSON.md'; Text = $lessonTemplate }
)) {
    Assert-Contract (
        $codePolicyTarget.Text.Contains('Immutable-anchor status') -and
        $codePolicyTarget.Text.Contains($pendingSourceSentinel)
    ) "$($codePolicyTarget.Name) requires an explicit immutable-anchor status"
    Assert-Contract (
        $codePolicyTarget.Text.Contains('intended output or interface') -and
        $codePolicyTarget.Text.Contains($executionNonClaimPolicy)
    ) "$($codePolicyTarget.Name) forbids execution or validation claims without a canonical Run"
}

$lessonHtml = @(
    Get-ChildItem -LiteralPath (Join-Path $repoRoot 'lessons') -Filter '*.html' -File -Recurse -ErrorAction SilentlyContinue
)
$referenceHtml = @(foreach ($relativeDirectory in @('reference', 'references')) {
    Get-ChildItem -LiteralPath (Join-Path $repoRoot $relativeDirectory) -Filter '*.html' -File -Recurse -ErrorAction SilentlyContinue
})
$lessonHtmlPaths = @($lessonHtml | ForEach-Object { Get-RepositoryRelativePath $_.FullName })
$referenceHtmlPaths = @($referenceHtml | ForEach-Object { Get-RepositoryRelativePath $_.FullName })
$lessonHtmlMessage = 'canonical lessons contain no HTML files'
$referenceHtmlMessage = 'canonical reference and references material contains no HTML files'
if ($lessonHtmlPaths.Count -gt 0) {
    $lessonHtmlMessage += '. Found: ' + ($lessonHtmlPaths -join ', ')
}
if ($referenceHtmlPaths.Count -gt 0) {
    $referenceHtmlMessage += '. Found: ' + ($referenceHtmlPaths -join ', ')
}
Assert-Contract ($lessonHtml.Count -eq 0) $lessonHtmlMessage
Assert-Contract ($referenceHtml.Count -eq 0) $referenceHtmlMessage

$forbiddenArtifactFiles = @(Get-ChildItem -LiteralPath $repoRoot -File -Recurse -Force | Where-Object {
    $relativePath = Get-RepositoryRelativePath $_.FullName
    $isExcludedPath = $relativePath -match '^(?:tests|docs|\.git|\.worktrees)(?:/|$)'
    -not $isExcludedPath -and $_.Extension -match '(?i)^\.(?:html|css|js)$'
})
$forbiddenArtifactPaths = @($forbiddenArtifactFiles | ForEach-Object { Get-RepositoryRelativePath $_.FullName })
$forbiddenArtifactMessage = 'production package contains no HTML, CSS, or JavaScript artifact files'
if ($forbiddenArtifactPaths.Count -gt 0) {
    $forbiddenArtifactMessage += '. Found: ' + ($forbiddenArtifactPaths -join ', ')
}
Assert-Contract (
    $forbiddenArtifactFiles.Count -eq 0
) $forbiddenArtifactMessage

$instructionFiles = [System.Collections.Generic.List[string]]::new()
foreach ($relativePath in @('SKILL.md')) {
    $path = Join-Path $repoRoot $relativePath
    if (Test-Path -LiteralPath $path -PathType Leaf) {
        $instructionFiles.Add($path) | Out-Null
    }
}
foreach ($relativeDirectory in @('references', 'assets/templates')) {
    $directory = Join-Path $repoRoot $relativeDirectory
    if (Test-Path -LiteralPath $directory -PathType Container) {
        foreach ($file in Get-ChildItem -LiteralPath $directory -Filter '*.md' -File -Recurse) {
            $instructionFiles.Add($file.FullName) | Out-Null
        }
    }
}

$tagDiagnostics = @(Get-InstructionMatchDiagnostics $instructionFiles '(?i)</?[A-Za-z][A-Za-z0-9-]*(?:\s[^>]*)?\s*/?>')
$htmlPathDiagnostics = @(Get-InstructionMatchDiagnostics $instructionFiles '(?i)\b(?:lessons|references?)[/\\][^\s)\]>]*\.html\b')
$stylePathDiagnostics = @(Get-InstructionMatchDiagnostics $instructionFiles '(?i)\b(?:lessons|references?)[/\\][^\s)\]>]*\.(?:css|js)\b')
$mathDelimiterDiagnostics = @(Get-InstructionMatchDiagnostics $instructionFiles '\\[\(\)\[\]]')

$tagMessage = 'skill instructions and templates contain no forbidden HTML markup tags'
$htmlPathMessage = 'skill instructions and templates contain no canonical lesson or reference HTML paths'
$stylePathMessage = 'skill instructions and templates contain no canonical lesson or reference CSS/JavaScript paths'
$mathDelimiterMessage = 'canonical skill instructions and templates contain no backslash-parenthesis or backslash-bracket math delimiters'
if ($tagDiagnostics.Count -gt 0) {
    $tagMessage += '. Matches: ' + ($tagDiagnostics -join '; ')
}
if ($htmlPathDiagnostics.Count -gt 0) {
    $htmlPathMessage += '. Matches: ' + ($htmlPathDiagnostics -join '; ')
}
if ($stylePathDiagnostics.Count -gt 0) {
    $stylePathMessage += '. Matches: ' + ($stylePathDiagnostics -join '; ')
}
if ($mathDelimiterDiagnostics.Count -gt 0) {
    $mathDelimiterMessage += '. Matches: ' + ($mathDelimiterDiagnostics -join '; ')
}

Assert-Contract ($tagDiagnostics.Count -eq 0) $tagMessage
Assert-Contract ($htmlPathDiagnostics.Count -eq 0) $htmlPathMessage
Assert-Contract ($stylePathDiagnostics.Count -eq 0) $stylePathMessage
Assert-Contract ($mathDelimiterDiagnostics.Count -eq 0) $mathDelimiterMessage

$normalizedSkillText = [regex]::Replace($skillText, '\s+', ' ')
$markdownOnlyPolicy = 'Canonical teaching artifacts are Obsidian-compatible Markdown only.'
$noBrowserLessonPolicy = 'Do not create HTML, CSS, JavaScript, or browser-dependent lessons.'
Assert-Contract (
    $normalizedSkillText.Contains($markdownOnlyPolicy)
) "SKILL.md states: $markdownOnlyPolicy"
Assert-Contract (
    $normalizedSkillText.Contains($noBrowserLessonPolicy)
) "SKILL.md states: $noBrowserLessonPolicy"

$noticeText = Get-RepositoryText 'NOTICE.md'
Assert-Contract (
    $noticeText.IndexOf('mattpocock/skills', [System.StringComparison]::OrdinalIgnoreCase) -ge 0
) 'NOTICE.md identifies mattpocock/skills'

$readmeText = Get-RepositoryText 'README.md'
foreach ($requiredReadmePhrase in @(
    'an independent Agent Skill created, maintained, and published by [jiangweiqi001](https://github.com/jiangweiqi001)'
    '## Who this is for'
    '## How this differs from the earlier PR-oriented prototype'
    'The earlier prototype did not become an upstream pull request.'
    'The current project, architecture, templates, protocols, tests, releases, and ongoing maintenance belong to this independent repository.'
)) {
    Assert-Contract (
        $readmeText.Contains($requiredReadmePhrase)
    ) "README.md states project identity or audience boundary: $requiredReadmePhrase"
}
$chineseInvocationExample = -join @(
    [char]0x7528
    ' `$theoretical-physics-math-teach` '
    [char]0x5B66
    [char]0x8FD9
    [char]0x4E9B
    [char]0x8BBA
    [char]0x6587
)
Assert-Contract (
    $readmeText.Contains($chineseInvocationExample)
) 'README.md contains the intact Chinese explicit-invocation example'
Assert-Contract (
    -not $readmeText.Contains([char]0xFFFD) -and
    $readmeText.IndexOf([char]0x9225, [System.StringComparison]::Ordinal) -lt 0 -and
    $readmeText.IndexOf([char]0x701B, [System.StringComparison]::Ordinal) -lt 0
) 'README.md contains no replacement character or known Chinese mojibake'

foreach ($requiredPublicationPhrase in @(
    'Read the paper. Preserve the notation. Finish the derivation. Resume exactly where you stopped.'
    '## Why this skill exists'
    '## What happens when you say "this step is unclear"'
    '## A serious paper-reading workflow'
    '## Stateless summary vs. this skill'
    'v0.2.0'
)) {
    Assert-Contract (
        $readmeText.Contains($requiredPublicationPhrase)
    ) "README.md contains verified publication content: $requiredPublicationPhrase"
}

$licenseText = Get-RepositoryText 'LICENSE'
Assert-Contract (
    $licenseText.Contains('Copyright (c) 2026 Matt Pocock')
) 'LICENSE retains the Matt Pocock copyright notice'

if ($failures.Count -gt 0) {
    exit 1
}

exit 0
