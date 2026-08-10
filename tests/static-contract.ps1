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
        $text = Get-Content -LiteralPath $path -Raw
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

$tagMessage = 'skill instructions and templates contain no forbidden HTML markup tags'
$htmlPathMessage = 'skill instructions and templates contain no canonical lesson or reference HTML paths'
$stylePathMessage = 'skill instructions and templates contain no canonical lesson or reference CSS/JavaScript paths'
if ($tagDiagnostics.Count -gt 0) {
    $tagMessage += '. Matches: ' + ($tagDiagnostics -join '; ')
}
if ($htmlPathDiagnostics.Count -gt 0) {
    $htmlPathMessage += '. Matches: ' + ($htmlPathDiagnostics -join '; ')
}
if ($stylePathDiagnostics.Count -gt 0) {
    $stylePathMessage += '. Matches: ' + ($stylePathDiagnostics -join '; ')
}

Assert-Contract ($tagDiagnostics.Count -eq 0) $tagMessage
Assert-Contract ($htmlPathDiagnostics.Count -eq 0) $htmlPathMessage
Assert-Contract ($stylePathDiagnostics.Count -eq 0) $stylePathMessage

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

$licenseText = Get-RepositoryText 'LICENSE'
Assert-Contract (
    $licenseText.Contains('Copyright (c) 2026 Matt Pocock')
) 'LICENSE retains the Matt Pocock copyright notice'

if ($failures.Count -gt 0) {
    exit 1
}

exit 0
