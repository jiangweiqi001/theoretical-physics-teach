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

    return Get-Content -LiteralPath $path -Raw
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
)

foreach ($relativePath in $requiredPaths) {
    $exists = Test-Path -LiteralPath (Join-Path $repoRoot $relativePath) -PathType Leaf
    Assert-Contract $exists "required file exists: $relativePath"
}

$skillText = Get-RepositoryText 'SKILL.md'
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
$firstLevelTwoHeading = [regex]::Match($lessonTemplate, '(?m)^##[ \t]+([^\r\n]+)')
Assert-Contract (
    $firstLevelTwoHeading.Success -and
    $firstLevelTwoHeading.Groups[1].Value.Trim() -ceq 'Notation and conventions'
) 'LESSON.md starts with the leading section ## Notation and conventions'

$defineBeforeUsePattern = '(?is)\b(?:define(?:s|d)? every new symbol|every new symbol (?:must be |is )?defined)\b.{0,80}\bbefore (?:first )?use\b'
Assert-Contract (
    [regex]::IsMatch($lessonTemplate, $defineBeforeUsePattern)
) 'LESSON.md requires every new symbol to be defined before use'

$lessonHtml = @(
    Get-ChildItem -LiteralPath (Join-Path $repoRoot 'lessons') -Filter '*.html' -File -Recurse -ErrorAction SilentlyContinue
)
$referenceHtml = @(foreach ($relativeDirectory in @('reference', 'references')) {
    Get-ChildItem -LiteralPath (Join-Path $repoRoot $relativeDirectory) -Filter '*.html' -File -Recurse -ErrorAction SilentlyContinue
})
Assert-Contract ($lessonHtml.Count -eq 0) 'canonical lessons contain no HTML files'
Assert-Contract ($referenceHtml.Count -eq 0) 'canonical reference and references material contains no HTML files'

$forbiddenArtifactFiles = @(Get-ChildItem -LiteralPath $repoRoot -File -Recurse -Force | Where-Object {
    $relativePath = $_.FullName.Substring($repoRoot.Length).TrimStart([char[]]@('/', '\')) -replace '\\', '/'
    $isExcludedPath = $relativePath -match '^(?:tests|docs|\.git|\.worktrees)(?:/|$)'
    -not $isExcludedPath -and $_.Extension -match '(?i)^\.(?:html|css|js)$'
})
Assert-Contract (
    $forbiddenArtifactFiles.Count -eq 0
) 'production package contains no HTML, CSS, or JavaScript artifact files'

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

$instructionText = ($instructionFiles | ForEach-Object {
    Get-Content -LiteralPath $_ -Raw
}) -join [Environment]::NewLine

Assert-Contract (
    -not [regex]::IsMatch($instructionText, '(?i)</?[A-Za-z][A-Za-z0-9-]*(?:\s[^>]*)?\s*/?>')
) 'skill instructions and templates contain no forbidden HTML markup tags'
Assert-Contract (
    -not [regex]::IsMatch($instructionText, '(?i)\b(?:lessons|references?)[/\\][^\s)\]>]*\.html\b')
) 'skill instructions and templates contain no canonical lesson or reference HTML paths'
Assert-Contract (
    -not [regex]::IsMatch($instructionText, '(?i)\b(?:lessons|references?)[/\\][^\s)\]>]*\.(?:css|js)\b')
) 'skill instructions and templates contain no canonical lesson or reference CSS/JavaScript paths'

$instructionClauses = @($instructionText -split '(?:;|[.!?](?=\s|$)|\r?\n)+')
$positiveBrowserRequirementClauses = @($instructionClauses | Where-Object {
    $hasPositiveVerb = $_ -match '(?i)\b(?:must|should|need(?:s)?\s+to|require(?:s|d)?|create|write|build|render|open|launch|serve|load|use)\b'
    $mentionsBrowserTechnology = $_ -match '(?i)\b(?:HTML|CSS|JavaScript|JS|browser(?:-only)?)\b'
    $isClearlyNegative =
        $_ -match '(?i)\b(?:do not|does not|don''t|never|not required|without requiring|forbid(?:s|den)?|prohibit(?:s|ed)?)\b' -or
        $_ -match '(?i)\b(?:must|should|need(?:s)?(?:\s+to)?)\s+not\b' -or
        $_ -match '(?i)\bnot\s+(?:create|write|build|render|open|launch|serve|load|use)\b' -or
        $_ -match '(?i)\b(?:no|without)\b.{0,80}\b(?:HTML|CSS|JavaScript|JS|browser(?:-only)?)\b'
    $isClearlyOptional =
        $_ -match '(?i)\boptional\b' -or
        $_ -match '(?i)\bseparate\b.{0,80}\b(?:artifact|request|project|website)\b' -or
        $_ -match '(?i)\b(?:artifact|request|project|website)\b.{0,80}\bseparate\b'

    $hasPositiveVerb -and $mentionsBrowserTechnology -and -not ($isClearlyNegative -or $isClearlyOptional)
})
Assert-Contract (
    $positiveBrowserRequirementClauses.Count -eq 0
) 'lessons do not require HTML, CSS, JavaScript, or a browser'

$noticeText = Get-RepositoryText 'NOTICE.md'
Assert-Contract (
    $noticeText.IndexOf('mattpocock/skills', [System.StringComparison]::OrdinalIgnoreCase) -ge 0
) 'NOTICE.md identifies mattpocock/skills'

$licenseText = Get-RepositoryText 'LICENSE'
Assert-Contract (
    $licenseText.Contains('Copyright (c) 2026 Matt Pocock')
) 'LICENSE retains the Matt Pocock copyright notice'

if ($failures.Count -gt 0) {
    exit 1
}

exit 0
