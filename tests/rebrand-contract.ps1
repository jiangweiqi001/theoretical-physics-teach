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

function ConvertFrom-CodePoints([int[]]$CodePoints) {
    return -join ($CodePoints | ForEach-Object { [char]$_ })
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
    $chineseAudienceHeading = '## ' + (ConvertFrom-CodePoints @(0x9002, 0x5408, 0x8C01))
    $chinesePhysicsOnly = ConvertFrom-CodePoints @(0x53EA, 0x9762, 0x5411, 0x7406, 0x8BBA, 0x7269, 0x7406)
    Assert-Rebrand ($chineseReadme.Contains($chineseAudienceHeading)) 'Chinese README retains a clear audience section'
    Assert-Rebrand ($chineseReadme.Contains($chinesePhysicsOnly)) 'Chinese README states the single-subject boundary'
}

if ($Section -in @('Publication', 'All')) {
    $templateCount = @(
        Get-ChildItem -LiteralPath (Join-Path $repoRoot 'assets/templates') -File -Filter '*.md'
    ).Count
    Assert-Rebrand ($readme.Contains('Current release: `v0.4.0`.')) 'README names v0.4.0'
    Assert-Rebrand (
        $readme.Contains("$templateCount maintained Markdown templates")
    ) 'README reports the current maintained-template count'
    Assert-Rebrand (
        Test-Path -LiteralPath (Join-Path $repoRoot 'README.zh-CN.md') -PathType Leaf
    ) 'Chinese README exists'
    $chinesePrototypeHeading = '## ' + (ConvertFrom-CodePoints @(0x4E0E, 0x65E9, 0x671F)) + ' PR ' + (ConvertFrom-CodePoints @(0x539F, 0x578B, 0x7684, 0x533A, 0x522B))
    $chineseNoUpstream = (ConvertFrom-CodePoints @(0x6CA1, 0x6709, 0x6210, 0x4E3A, 0x4E0A, 0x6E38)) + ' pull request'
    $chineseIndependentProject = ConvertFrom-CodePoints @(0x72EC, 0x7ACB, 0x9879, 0x76EE)
    Assert-Rebrand (
        $chineseReadme.Contains($chinesePrototypeHeading) -and
        $chineseReadme.Contains($chineseNoUpstream) -and
        $chineseReadme.Contains($chineseIndependentProject)
    ) 'Chinese README distinguishes the independent project from the earlier prototype'
    Assert-Rebrand (
        -not [regex]::IsMatch($readme, '(?i)\b(?:star|starring)\s+(?:this\s+|the\s+)?repository\b')
    ) 'README contains no repository-star request'
    Assert-Rebrand ($readme.Contains('actions/workflows/validate.yml/badge.svg')) 'README retains the validation badge'

    $englishResearcherHeading = '## Strengths and practical boundaries for researchers'
    Assert-Rebrand (
        $readme.Contains('[Strengths and practical boundaries for researchers](#strengths-and-practical-boundaries-for-researchers)')
    ) 'README navigation links the researcher strengths and boundaries section'
    Assert-Rebrand ($readme.Contains($englishResearcherHeading)) 'README contains the researcher strengths and boundaries section'
    foreach ($pairLabel in @(
        'Prior research training',
        'Source-faithful reading',
        'Derivation depth',
        'Cross-source reasoning',
        'Durable learning state',
        'Code-theory provenance'
    )) {
        Assert-Rebrand ($readme.Contains($pairLabel)) "README contains researcher pair: $pairLabel"
    }
    foreach ($boundary in @(
        'registered source corpus',
        'Persistent state is not a correctness guarantee',
        'Without a canonical Run record',
        'not from skipping the theory or shortening required derivations'
    )) {
        Assert-Rebrand ($readme.Contains($boundary)) "README states researcher boundary: $boundary"
    }

    $chineseResearcherTitle = ConvertFrom-CodePoints @(
        0x9762, 0x5411, 0x7814, 0x7A76, 0x8005, 0x7684, 0x4F18, 0x52BF,
        0x4E0E, 0x5B9E, 0x9645, 0x8FB9, 0x754C
    )
    $chineseResearcherHeading = '## ' + $chineseResearcherTitle
    Assert-Rebrand (
        $chineseReadme.Contains("[$chineseResearcherTitle](#$chineseResearcherTitle)")
    ) 'Chinese README navigation links the researcher strengths and boundaries section'
    Assert-Rebrand ($chineseReadme.Contains($chineseResearcherHeading)) 'Chinese README contains the researcher strengths and boundaries section'
    $chineseSectionMatch = [regex]::Match(
        $chineseReadme,
        '(?ms)^' + [regex]::Escape($chineseResearcherHeading) + '\s*(.+?)(?=^##\s)'
    )
    Assert-Rebrand ($chineseSectionMatch.Success) 'Chinese researcher section has a bounded body'
    if ($chineseSectionMatch.Success) {
        $chineseTableRows = [regex]::Matches($chineseSectionMatch.Groups[1].Value, '(?m)^\|').Count
        Assert-Rebrand ($chineseTableRows -ge 8) 'Chinese researcher section contains six paired table rows'
        Assert-Rebrand ($chineseSectionMatch.Groups[1].Value.Contains('Run')) 'Chinese researcher section preserves the Run boundary'
    }
}

if ($failures.Count -gt 0) { exit 1 }
Write-Output 'Theoretical-physics-only rebrand contract passed.'
exit 0
