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
$chineseReadme = if (Test-Path -LiteralPath (Join-Path $repoRoot 'README.zh-CN.md')) {
    Read-Utf8 'README.zh-CN.md'
} else {
    ''
}

if ($Section -in @('Identity', 'All')) {
    Assert-Rebrand ($skill -match '(?m)^name:\s*theoretical-physics-teach\s*$') 'new Skill name is canonical'
    Assert-Rebrand ($skill.Contains('$theoretical-physics-teach')) 'new explicit invocation is documented'
    Assert-Rebrand ($metadata -match '(?m)^\s*display_name:\s*"Theoretical Physics Teach"\s*$') 'Codex display name is physics-only'
    Assert-Rebrand ($metadata -match '(?m)^\s*allow_implicit_invocation:\s*false\s*$') 'explicit-only policy is preserved'
    Assert-Rebrand ($readme.Contains('github.com/jiangweiqi001/theoretical-physics-teach')) 'README uses the new repository URL'
    Assert-Rebrand ($readme.Contains('$theoretical-physics-teach')) 'README uses the new invocation'
    foreach ($text in @($skill, $metadata, $readme, $chineseReadme)) {
        Assert-Rebrand (-not $text.Contains('theoretical-physics-math-teach')) 'current identity surface contains no former identifier'
    }
}

if ($Section -in @('Scope', 'All')) {
    $scopeFiles = @(
        'SKILL.md',
        'README.md',
        'README.zh-CN.md',
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
    Assert-Rebrand ($readme.Contains('Current release: `v0.4.0`.')) 'README names v0.4.0'
    Assert-Rebrand (
        Test-Path -LiteralPath (Join-Path $repoRoot 'README.zh-CN.md') -PathType Leaf
    ) 'Chinese README exists'
    Assert-Rebrand (
        -not [regex]::IsMatch($readme, '(?i)\b(?:star|starring)\s+(?:this\s+|the\s+)?repository\b')
    ) 'README contains no repository-star request'
    Assert-Rebrand ($readme.Contains('actions/workflows/validate.yml/badge.svg')) 'README retains the validation badge'
}

if ($failures.Count -gt 0) { exit 1 }
Write-Output 'Theoretical-physics-only rebrand contract passed.'
exit 0
