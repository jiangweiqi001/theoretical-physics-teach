[CmdletBinding()]
param(
    [Parameter(Mandatory = $true, Position = 0)]
    [string]$ScenarioPath
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

$beginMarker = '<!-- BEGIN USER PROMPT -->'
$endMarker = '<!-- END USER PROMPT -->'
$lines = @(Get-Content -LiteralPath $ScenarioPath)

$beginIndices = @(for ($index = 0; $index -lt $lines.Count; $index++) {
    if ($lines[$index] -eq $beginMarker) {
        $index
    }
})
$endIndices = @(for ($index = 0; $index -lt $lines.Count; $index++) {
    if ($lines[$index] -eq $endMarker) {
        $index
    }
})

if ($beginIndices.Count -ne 1 -or $endIndices.Count -ne 1) {
    throw "Scenario must contain exactly one '$beginMarker' and one '$endMarker'."
}

$beginIndex = $beginIndices[0]
$endIndex = $endIndices[0]
if ($endIndex -le ($beginIndex + 1)) {
    throw 'The user prompt markers are empty or out of order.'
}

$promptLines = $lines[($beginIndex + 1)..($endIndex - 1)]
Write-Output ($promptLines -join [Environment]::NewLine)
