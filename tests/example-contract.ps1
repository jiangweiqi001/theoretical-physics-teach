[CmdletBinding()]
param()

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

$repoRoot = (Resolve-Path -LiteralPath (Join-Path $PSScriptRoot '..')).Path
$exampleRoot = Join-Path $repoRoot 'examples/retarded-propagator'
$failures = [System.Collections.Generic.List[string]]::new()
$utf8 = [System.Text.UTF8Encoding]::new($false, $true)

function Assert-Example {
    param(
        [Parameter(Mandatory = $true)][bool]$Condition,
        [Parameter(Mandatory = $true)][string]$Message
    )
    if ($Condition) {
        Write-Output "PASS: $Message"
        return
    }
    $script:failures.Add($Message) | Out-Null
    [Console]::Error.WriteLine("FAIL: $Message")
}

function Read-ExampleText {
    param([Parameter(Mandatory = $true)][string]$RelativePath)
    $path = Join-Path $exampleRoot $RelativePath
    if (-not (Test-Path -LiteralPath $path -PathType Leaf)) {
        return ''
    }
    return [System.IO.File]::ReadAllText($path, $utf8)
}

$requiredFiles = @(
    'MISSION.md'
    'MATERIALS.md'
    'BASELINE.md'
    'CURRENT-STATE.md'
    'sources/DEMO-SRC-001.md'
    'lessons/L-DEMO-0001-free-retarded-propagator.md'
    'learning-records/EV-DEMO-0001.md'
)

foreach ($relativePath in $requiredFiles) {
    Assert-Example (
        Test-Path -LiteralPath (Join-Path $exampleRoot $relativePath) -PathType Leaf
    ) "example file exists: $relativePath"
}

$lesson = Read-ExampleText 'lessons/L-DEMO-0001-free-retarded-propagator.md'
$state = Read-ExampleText 'CURRENT-STATE.md'
$evidence = Read-ExampleText 'learning-records/EV-DEMO-0001.md'
$allText = $lesson + "`n" + $state + "`n" + $evidence

$headings = [regex]::Matches($lesson, '(?m)^##[ \t]+([^\r\n]+)')
$firstHeading = if ($headings.Count -gt 0) { $headings[0].Groups[1].Value.Trim() } else { '' }
$finalHeading = if ($headings.Count -gt 0) { $headings[$headings.Count - 1].Groups[1].Value.Trim() } else { '' }

Assert-Example ($firstHeading -ceq 'Notation and conventions') 'example lesson starts with notation and conventions'
Assert-Example ($finalHeading -ceq 'End-of-Note checkpoint') 'example lesson ends with the checkpoint'
Assert-Example ($lesson.Contains('^resume-regulated-integral')) 'example lesson contains the exact resume block'
Assert-Example (
    $state.Contains('[[lessons/L-DEMO-0001-free-retarded-propagator#^resume-regulated-integral]]')
) 'CURRENT-STATE links the exact resume block'
Assert-Example ($state.Contains('Current obstacle')) 'CURRENT-STATE names the current obstacle'
Assert-Example ($state.Contains('Next observable action')) 'CURRENT-STATE names one next action'
Assert-Example ($allText.Contains('Illustrative demo data')) 'example records are visibly illustrative'
Assert-Example ($evidence.Contains('Unaided response')) 'example separates the unaided response'
Assert-Example ($evidence.Contains('Learner self-report')) 'example separates learner self-report'
Assert-Example ($evidence.Contains('Assisted explanation')) 'example separates assisted explanation'
Assert-Example ($lesson.Contains('first dependent point')) 'clarification is located at the first dependent point'
Assert-Example (
    $lesson.Contains('propagator becomes large') -and $lesson.Contains('denominator becomes small')
) 'pole interpretation states that the propagator grows while its denominator shrinks'
Assert-Example ($lesson.Contains('$\hbar$')) 'natural-unit convention defines the reduced Planck constant glyph'
$rawGreekGlyphs = @([char]0x03B7, [char]0x03C9, [char]0x03BE, [char]0x03B8)
Assert-Example (
    -not ($rawGreekGlyphs | Where-Object { $lesson.Contains([string]$_) })
) 'example lesson uses LaTeX commands instead of raw Greek glyphs'
Assert-Example (-not $allText.Contains('chat transcript')) 'example contains no detached chat transcript'
Assert-Example (-not $allText.Contains('clarification appendix')) 'example contains no clarification appendix'
Assert-Example (-not $allText.Contains('RUN-000001')) 'example makes no live Run claim'
Assert-Example (-not $allText.Contains('CMAP-GLOBAL-0001')) 'example makes no live Code Map claim'

if (Test-Path -LiteralPath $exampleRoot -PathType Container) {
    & python -X utf8 (Join-Path $repoRoot 'scripts/validate_workspace.py') $exampleRoot
    Assert-Example ($LASTEXITCODE -eq 0) 'example workspace passes the read-only validator'
}

if ($failures.Count -gt 0) {
    Write-Output "Example contract failed: $($failures.Count) assertion(s)."
    exit 1
}

Write-Output 'Example contract passed.'
exit 0
