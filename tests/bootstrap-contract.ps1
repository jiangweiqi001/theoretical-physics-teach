[CmdletBinding()]
param()

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

$repoRoot = (Resolve-Path -LiteralPath (Join-Path $PSScriptRoot '..')).Path
$failures = [System.Collections.Generic.List[string]]::new()

$singletonTemplates = @(
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
)

$placeholderPolicyPattern = '(?is)\{\{\.\.\.\}\}\s+are\s+inert\s+schema\s+placeholders.*?not\s+registered\s+entities.*?PENDING.*?stable\s+ID.*?allocation\s+protocol'
$liveObsidianLinkPattern = '\[\['
$concreteSampleIdPattern = '(?<![A-Za-z0-9_])(?:N-S\d+-\d+|CMAP-(?:GLOBAL-\d+|L-\d+(?:-\d+)*|\d+(?:-[A-Za-z0-9]+)*)|S\d+(?:-V\d+)?|EV-\d+|REL-\d+|RUN-\d+|D-\d+|C-\d+|E-\d+|P-\d+|T-\d+|Y-\d+|Q-\d+|R-\d+|L-\d+)(?![A-Za-z0-9_])'

function Assert-BootstrapContract {
    param(
        [Parameter(Mandatory = $true)]
        [bool]$Condition,

        [Parameter(Mandatory = $true)]
        [string]$RelativePath,

        [Parameter(Mandatory = $true)]
        [string]$Message
    )

    if ($Condition) {
        Write-Output "PASS: ${RelativePath}: $Message"
        return
    }

    $failure = "${RelativePath}: $Message"
    $script:failures.Add($failure) | Out-Null
    [Console]::Error.WriteLine("FAIL: $failure")
}

function Get-LineMatchDiagnostics {
    param(
        [Parameter(Mandatory = $true)]
        [string]$Text,

        [Parameter(Mandatory = $true)]
        [string]$Pattern
    )

    $diagnostics = [System.Collections.Generic.List[string]]::new()
    $lines = $Text -split '\r?\n'
    for ($index = 0; $index -lt $lines.Count; $index++) {
        $matches = [regex]::Matches($lines[$index], $Pattern)
        foreach ($match in $matches) {
            $diagnostics.Add("line $($index + 1): $($match.Value)") | Out-Null
        }
    }

    return @($diagnostics)
}

foreach ($relativePath in $singletonTemplates) {
    $path = Join-Path $repoRoot $relativePath
    $exists = Test-Path -LiteralPath $path -PathType Leaf
    Assert-BootstrapContract $exists $relativePath 'singleton template exists'
    if (-not $exists) {
        continue
    }

    $text = Get-Content -LiteralPath $path -Raw -Encoding UTF8
    $hasPolicy = [regex]::IsMatch($text, $placeholderPolicyPattern)
    Assert-BootstrapContract $hasPolicy $relativePath 'declares the inert placeholder bootstrap policy'

    $linkDiagnostics = @(Get-LineMatchDiagnostics $text $liveObsidianLinkPattern)
    $linkMessage = 'contains no live-looking Obsidian links'
    if ($linkDiagnostics.Count -gt 0) {
        $linkMessage += '. Found: ' + ($linkDiagnostics -join '; ')
    }
    Assert-BootstrapContract ($linkDiagnostics.Count -eq 0) $relativePath $linkMessage

    $idDiagnostics = @(Get-LineMatchDiagnostics $text $concreteSampleIdPattern)
    $idMessage = 'contains no concrete sample IDs'
    if ($idDiagnostics.Count -gt 0) {
        $idMessage += '. Found: ' + ($idDiagnostics -join '; ')
    }
    Assert-BootstrapContract ($idDiagnostics.Count -eq 0) $relativePath $idMessage
}

if ($failures.Count -gt 0) {
    exit 1
}

exit 0
