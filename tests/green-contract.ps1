[CmdletBinding()]
param()

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

$repoRoot = Split-Path -Parent $PSScriptRoot
$accepted = @(
    'tests/green-outputs/01-conflicting-notation.md'
    'tests/green-outputs/02-resume-and-writeback.md'
    'tests/green-outputs/03-code-theory-bridge.md'
)
$failures = 0

function Assert-True {
    param(
        [Parameter(Mandatory = $true)][bool]$Condition,
        [Parameter(Mandatory = $true)][string]$Label
    )

    if ($Condition) {
        Write-Output "PASS: $Label"
    }
    else {
        Write-Output "FAIL: $Label"
        $script:failures++
    }
}

foreach ($relativePath in $accepted) {
    $path = Join-Path $repoRoot $relativePath
    Assert-True (Test-Path -LiteralPath $path -PathType Leaf) "$relativePath exists"
    if (-not (Test-Path -LiteralPath $path -PathType Leaf)) {
        continue
    }

    $utf8 = [System.Text.UTF8Encoding]::new($false, $true)
    $text = [System.IO.File]::ReadAllText($path, $utf8)
    $firstLine = ($text -split "`r?`n", 2)[0]
    $firstH2 = [regex]::Match($text, '(?m)^##\s+(.+)$')

    Assert-True ($firstLine -ceq 'Provisional response-only artifact; no canonical write performed.') "$relativePath declares provisional response-only status first"
    Assert-True ($firstH2.Success -and $firstH2.Groups[1].Value.Trim() -ceq 'Notation and conventions') "$relativePath starts Note content with the notation contract"
    Assert-True (-not $text.Contains('\(') -and -not $text.Contains('\)') -and -not $text.Contains('\[') -and -not $text.Contains('\]')) "$relativePath uses only dollar-delimited LaTeX"
    Assert-True (-not [regex]::IsMatch($text, '\b(?:EV|LESSON|SOURCE|RELATION|NOTATION|CODE_MAP|RUN)-\d+\b')) "$relativePath does not invent a stable canonical ID"
    Assert-True (-not $text.Contains('[[') -and -not $text.Contains(']]')) "$relativePath emits no live Obsidian link"
    Assert-True (-not $text.Contains([char]0xFFFD) -and -not $text.Contains([char]0x9225)) "$relativePath contains no replacement character or known em-dash mojibake"
    Assert-True ($text.TrimEnd().EndsWith('Canonical writeback is not complete.')) "$relativePath ends with the non-write status"
}

$utf8 = [System.Text.UTF8Encoding]::new($false, $true)
$scenario2 = [System.IO.File]::ReadAllText((Join-Path $repoRoot $accepted[1]), $utf8)
Assert-True ($scenario2.Contains('{{EVIDENCE_ID_PENDING}}')) 'scenario 02 uses a pending Evidence placeholder'
Assert-True ($scenario2.Contains('2026-08-10') -and $scenario2.Contains('2026-08-09')) 'scenario 02 preserves both evidence dates'

$scenario3 = [System.IO.File]::ReadAllText((Join-Path $repoRoot $accepted[2]), $utf8)
Assert-True (
    $scenario3.Contains('Unassigned ') -and
    $scenario3.Contains('supplied excerpt; snapshot registration pending')
) 'scenario 03 uses the pending snapshot sentinel'
Assert-True ($scenario3.Contains('No execution or validation claim is made.')) 'scenario 03 states the no-run boundary'
Assert-True ([regex]::IsMatch($scenario3, '\bm\s*\\mapsto\s*-m-1')) 'scenario 03 states the fermionic partner map'

if ($failures -gt 0) {
    Write-Output "GREEN output contract failed: $failures assertion(s)."
    exit 1
}

Write-Output 'GREEN output contract passed.'
