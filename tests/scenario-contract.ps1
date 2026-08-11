[CmdletBinding()]
param()

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

$repoRoot = (Resolve-Path -LiteralPath (Join-Path $PSScriptRoot '..')).Path
$scenarioDirectory = Join-Path $PSScriptRoot 'scenarios'
$extractor = Join-Path $PSScriptRoot 'extract-user-prompts.ps1'
$beginMarker = '<!-- BEGIN USER PROMPT -->'
$endMarker = '<!-- END USER PROMPT -->'
$failures = [System.Collections.Generic.List[string]]::new()

function Add-Failure {
    param([string]$Message)
    $script:failures.Add($Message) | Out-Null
    [Console]::Error.WriteLine("FAIL: $Message")
}

function Add-Pass {
    param([string]$Message)
    Write-Output "PASS: $Message"
}

$scenarioFiles = @(Get-ChildItem -LiteralPath $scenarioDirectory -Filter '*.md' -File | Sort-Object Name)
if ($scenarioFiles.Count -lt 6) {
    Add-Failure 'at least six behavioral scenarios exist'
}

foreach ($scenarioFile in $scenarioFiles) {
    $lines = @(Get-Content -LiteralPath $scenarioFile.FullName)
    $beginIndices = @(for ($index = 0; $index -lt $lines.Count; $index++) {
        if ($lines[$index] -eq $beginMarker) { $index }
    })
    $endIndices = @(for ($index = 0; $index -lt $lines.Count; $index++) {
        if ($lines[$index] -eq $endMarker) { $index }
    })

    if ($beginIndices.Count -ne 1 -or $endIndices.Count -ne 1 -or $endIndices[0] -le $beginIndices[0]) {
        Add-Failure "$($scenarioFile.Name) has exactly one ordered prompt marker pair"
        continue
    }
    Add-Pass "$($scenarioFile.Name) has exactly one ordered prompt marker pair"

    $evaluatorIndex = -1
    for ($index = $endIndices[0] + 1; $index -lt $lines.Count; $index++) {
        if ($lines[$index] -eq '## Evaluator only - never dispatch') {
            $evaluatorIndex = $index
            break
        }
    }
    if ($evaluatorIndex -lt 0) {
        Add-Failure "$($scenarioFile.Name) has an evaluator-only section after the prompt"
        continue
    }
    Add-Pass "$($scenarioFile.Name) has an evaluator-only section after the prompt"

    $coreIndex = -1
    for ($index = $evaluatorIndex + 1; $index -lt $lines.Count; $index++) {
        if ($lines[$index] -eq '### Core PASS checklist') {
            $coreIndex = $index
            break
        }
    }
    $coreCount = 0
    if ($coreIndex -ge 0) {
        for ($index = $coreIndex + 1; $index -lt $lines.Count; $index++) {
            if ($lines[$index] -match '^###? ' -and $index -gt ($coreIndex + 1)) { break }
            if ($lines[$index] -match '^- \[ \] ') { $coreCount++ }
        }
    }
    if ($coreCount -ne 6) {
        Add-Failure "$($scenarioFile.Name) has exactly six Core PASS items; found $coreCount"
    } else {
        Add-Pass "$($scenarioFile.Name) has exactly six Core PASS items"
    }

    $extracted = (& $extractor $scenarioFile.FullName) -join [Environment]::NewLine
    if ($extracted.Contains('Evaluator only') -or
        $extracted.Contains('Core PASS') -or
        $extracted.Contains($beginMarker) -or
        $extracted.Contains($endMarker)) {
        Add-Failure "$($scenarioFile.Name) extracted prompt contains evaluator or marker leakage"
    } else {
        Add-Pass "$($scenarioFile.Name) extracted prompt is isolated"
    }
}

if ($failures.Count -gt 0) {
    exit 1
}

Write-Output 'Behavioral scenario contract passed.'
exit 0
