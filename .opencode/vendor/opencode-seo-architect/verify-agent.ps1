# =============================================================
# OpenCode-SEO-Architect - Operational Verification Script
# Confirms agent registration, skill wiring, and reference
# structure integrity. Run from the project root:
#   powershell -NoProfile -ExecutionPolicy Bypass -File .\verify-agent.ps1
# Exit code 0 = ACTIVE, 1 = DEGRADED.
# =============================================================

$ErrorActionPreference = 'Stop'
$root = $PSScriptRoot
if (-not $root) { $root = Split-Path -Parent $MyInvocation.MyCommand.Path }

$script:pass = 0
$script:fail = 0

function Check([string]$name, [bool]$condition) {
    if ($condition) {
        Write-Host "  [PASS] $name" -ForegroundColor Green
        $script:pass++
    } else {
        Write-Host "  [FAIL] $name" -ForegroundColor Red
        $script:fail++
    }
}

Write-Host ""
Write-Host "==================================================" -ForegroundColor Cyan
Write-Host "  OpenCode-SEO-Architect - Operational Verification" -ForegroundColor Cyan
Write-Host "==================================================" -ForegroundColor Cyan

# ------------------------------------------------------------
# [1] Agent Registration
# ------------------------------------------------------------
Write-Host ""
Write-Host "[1] Agent Registration" -ForegroundColor Yellow

$agentPath = Join-Path $root ".opencode\agent\opencode-seo-architect.md"
Check "Agent file exists (.opencode/agent/opencode-seo-architect.md)" (Test-Path -LiteralPath $agentPath)

$agent = ""
if (Test-Path -LiteralPath $agentPath) { $agent = Get-Content -LiteralPath $agentPath -Raw }
Check "Frontmatter: mode = subagent" ($agent -match '(?m)^mode:\s*subagent\s*$')
Check "Frontmatter: description present" ($agent -match '(?m)^description:')
Check "Rule 1 registered (TITLE TAG)" ($agent -match 'TITLE TAG')
Check "Rule 2 registered (H1 TAG)" ($agent -match 'H1 TAG')
Check "Rule 3 registered (FIRST PARAGRAPH P1)" ($agent -match 'FIRST PARAGRAPH \(P1\)')
Check "Rule 4 registered (INFORMATION DENSITY)" ($agent -match 'INFORMATION DENSITY')
Check "Skill 1 wired into agent (structural-front-loading-engine)" ($agent -match 'structural-front-loading-engine')
Check "Skill 2 wired into agent (entity-disambiguation-ghost-entity)" ($agent -match 'entity-disambiguation-ghost-entity')
Check "Skill 3 wired into agent (text-only-semantic-layering-engine)" ($agent -match 'text-only-semantic-layering-engine')
Check "Agent tied to io_spec.json validation suite" ($agent -match 'io_spec\.json')
Check "Agent tied to llms.txt reference example" ($agent -match 'llms\.txt')
Check "Agent tied to system_prompt.md canonical prompt" ($agent -match 'system_prompt\.md')

# ------------------------------------------------------------
# [2] Skill Registration
# ------------------------------------------------------------
Write-Host ""
Write-Host "[2] Skill Registration" -ForegroundColor Yellow

$skillFolders = @(
    'structural-front-loading-engine',
    'entity-disambiguation-ghost-entity',
    'text-only-semantic-layering-engine',
    'technical-seo-audit-engine',
    'sitemap-generation-engine',
    'robots-optimization-engine',
    'local-seo-engine',
    'competitive-analysis-engine',
    'geo-implementation-engine',
    'content-strategy-engine'
)

foreach ($folder in $skillFolders) {
    $skillPath = Join-Path $root (".opencode\skills\" + $folder + "\SKILL.md")
    Check ("Skill file exists: " + $folder + "/SKILL.md") (Test-Path -LiteralPath $skillPath)
    if (Test-Path -LiteralPath $skillPath) {
        $skill = Get-Content -LiteralPath $skillPath -Raw
        Check ("Frontmatter name matches folder: " + $folder) ($skill -match ('(?m)^name:\s*' + [regex]::Escape($folder) + '\s*$'))
        Check ("Frontmatter description present: " + $folder) ($skill -match '(?m)^description:')
        Check ("Tied to io_spec.json reference: " + $folder) ($skill -match 'io_spec\.json')
        Check ("Tied to llms.txt reference: " + $folder) ($skill -match 'llms\.txt')
    }
}

# ------------------------------------------------------------
# [3] Reference Structures
# ------------------------------------------------------------
Write-Host ""
Write-Host "[3] Reference Structures" -ForegroundColor Yellow

# --- system_prompt.md ---
$spPath = Join-Path $root "references\system_prompt.md"
Check "references/system_prompt.md exists" (Test-Path -LiteralPath $spPath)
if (Test-Path -LiteralPath $spPath) {
    $sp = Get-Content -LiteralPath $spPath -Raw
    Check "system_prompt.md: critical rules block present" ($sp -match 'CRITICAL RULES FOR CONTENT INJECTION')
    Check "system_prompt.md: all 4 rules registered" ($sp -match 'TITLE TAG' -and $sp -match 'H1 TAG' -and $sp -match 'FIRST PARAGRAPH \(P1\)' -and $sp -match 'INFORMATION DENSITY')
    Check "system_prompt.md in sync with agent body (rules block)" ($agent -match 'CRITICAL RULES FOR CONTENT INJECTION')
}

# --- io_spec.json ---
$specPath = Join-Path $root "references\io_spec.json"
Check "references/io_spec.json exists" (Test-Path -LiteralPath $specPath)
$spec = $null
if (Test-Path -LiteralPath $specPath) {
    try { $spec = Get-Content -LiteralPath $specPath -Raw | ConvertFrom-Json } catch { $spec = $null }
    Check "io_spec.json parses as valid JSON" ($null -ne $spec)
}
if ($null -ne $spec) {
    $tc = $spec.test_case_01
    Check "test_case_01 present with input + expected output" ($null -ne $tc.input -and $null -ne $tc.expected_agent_output)
    if ($null -ne $tc.expected_agent_output) {
        $kw = $tc.input.target_keyword
        $kwLower = $kw.ToLower()
        $exp = $tc.expected_agent_output

        # Skill 1 constraints verified against the spec suite itself
        Check "Spec: title keyword at absolute beginning" ($exp.title.ToLower().StartsWith($kwLower))
        $prefix50 = $exp.title.Substring(0, [Math]::Min(50, $exp.title.Length)).ToLower()
        Check "Spec: title keyword within first 50 characters" ($prefix50.Contains($kwLower))
        Check "Spec: h1 keyword at absolute beginning" ($exp.h1.ToLower().StartsWith($kwLower))

        $fp = $exp.first_paragraph
        Check "Spec: P1 keyword wrapped in <strong> emphasis" ($fp.ToLower().Contains('<strong>' + $kwLower + '</strong>'))
        $plain = $fp -replace '<[^>]+>', ' '
        $words = @($plain -split '\s+' | Where-Object { $_ -ne '' } | Select-Object -First 25)
        Check "Spec: P1 keyword within first 25 words" (($words -join ' ').ToLower().Contains($kwLower))

        # Skill 2 constraints verified against the spec suite itself
        Check "Spec: schema_type = TechArticle" ($exp.undisclosed_metadata_injection.schema_type -eq 'TechArticle')
        $entities = @($exp.undisclosed_metadata_injection.about_entities)
        Check "Spec: about_entities sameAs array mapped" ($entities.Count -ge 1)
    }

    # --- New test case checks ---
    $tc02 = $spec.test_case_02.expected_agent_output
    Check "test_case_02 present with sitemap_url_count and priority_levels" ($null -ne $tc02.sitemap_url_count -and $null -ne $tc02.priority_levels)
    
    $tc03 = $spec.test_case_03.expected_agent_output
    Check "test_case_03 present with ai_agent_allowances and sitemap_reference" ($null -ne $tc03.ai_agent_allowances -and $null -ne $tc03.sitemap_reference)
    
    $tc04 = $spec.test_case_04.expected_agent_output
    Check "test_case_04 present with schema_type = WebApplication" ($null -ne $tc04 -and $tc04.schema_type -eq 'WebApplication')
}

# --- llms.txt ---
    $llmsPath = Join-Path $root "references\llms.txt"
    Check "references/llms.txt exists" (Test-Path -LiteralPath $llmsPath)
    if (Test-Path -LiteralPath $llmsPath) {
        $llms = Get-Content -LiteralPath $llmsPath -Raw
        Check "llms.txt: header entity block (# llms.txt / Primary Entity)" ($llms -match '# llms\.txt' -and $llms -match '# Primary Entity:')
        Check "llms.txt: lifecycle timestamp present" ($llms -match '# Last Verified Lifecycle Timestamp:')
        Check "llms.txt: Project Essence section" ($llms -match '## Project Essence')
        Check "llms.txt: Technical Framework Matrix comparison table" ($llms -match '## Technical Framework Matrix' -and $llms -match '\| Feature \|')
        Check "llms.txt: Direct Micro-Query Reference Answers" ($llms -match '## Direct Micro-Query Reference Answers')
        Check "llms.txt: Technical SEO Audit Results section" ($llms -match '## Technical SEO Audit Results')
        Check "llms.txt: Local SEO Signals section" ($llms -match '## Local SEO Signals')
        Check "llms.txt: Competitive Landscape section" ($llms -match '## Competitive Landscape')
        Check "llms.txt: GEO Implementation Status section" ($llms -match '## GEO Implementation Status')
    }

    # --- sitemap.xml ---
    $sitemapPath = Join-Path $root "references\sitemap.xml"
    Check "references/sitemap.xml exists" (Test-Path -LiteralPath $sitemapPath)
    if (Test-Path -LiteralPath $sitemapPath) {
        $sitemap = Get-Content -LiteralPath $sitemapPath -Raw
        Check "sitemap.xml contains urlset xmlns" ($sitemap -match '<urlset xmlns')
        Check "sitemap.xml contains changefreq" ($sitemap -match 'changefreq')
    }

    # --- robots.txt ---
    $robotsPath = Join-Path $root "references\robots.txt"
    Check "references/robots.txt exists" (Test-Path -LiteralPath $robotsPath)
    if (Test-Path -LiteralPath $robotsPath) {
        $robots = Get-Content -LiteralPath $robotsPath -Raw
        Check "robots.txt contains GPTBot" ($robots -match 'GPTBot')
        Check "robots.txt contains ChatGPT-User" ($robots -match 'ChatGPT-User')
        Check "robots.txt contains PerplexityBot" ($robots -match 'PerplexityBot')
        Check "robots.txt contains Google-Extended" ($robots -match 'Google-Extended')
        Check "robots.txt contains Anthropic-AI" ($robots -match 'Anthropic-AI')
        Check "robots.txt contains ClaudeBot" ($robots -match 'ClaudeBot')
        Check "robots.txt contains OAI-SearchBot" ($robots -match 'OAI-SearchBot')
        Check "robots.txt contains Host directive" ($robots -match 'Host:')
        Check "robots.txt contains Sitemap directive" ($robots -match 'Sitemap:')
    }

    # --- geo-robots.txt ---
    $geoRobotsPath = Join-Path $root "references\geo-robots.txt"
    Check "references/geo-robots.txt exists" (Test-Path -LiteralPath $geoRobotsPath)
    if (Test-Path -LiteralPath $geoRobotsPath) {
        $geoRobots = Get-Content -LiteralPath $geoRobotsPath -Raw
        Check "geo-robots.txt contains Primary Entity marker" ($geoRobots -match '# Primary Entity:')
    }

    # --- geo-schema-template.json ---
    $geoSchemaPath = Join-Path $root "references\geo-schema-template.json"
    Check "references/geo-schema-template.json exists" (Test-Path -LiteralPath $geoSchemaPath)
    $geoSchema = $null
    if (Test-Path -LiteralPath $geoSchemaPath) {
        try { $geoSchema = Get-Content -LiteralPath $geoSchemaPath -Raw | ConvertFrom-Json } catch { $geoSchema = $null }
        Check "geo-schema-template.json parses as valid JSON" ($null -ne $geoSchema)
    }
    if ($null -ne $geoSchema) {
        Check "geo-schema-template.json contains @context" ($null -ne $geoSchema.'@context')
        Check "geo-schema-template.json contains @graph" ($null -ne $geoSchema.'@graph')
    }

    # --- geo-content-structure.md ---
    $geoContentPath = Join-Path $root "references\geo-content-structure.md"
    Check "references/geo-content-structure.md exists" (Test-Path -LiteralPath $geoContentPath)
    if (Test-Path -LiteralPath $geoContentPath) {
        $geoContent = Get-Content -LiteralPath $geoContentPath -Raw
        Check "geo-content-structure.md contains '## Quick Reference Facts'" ($geoContent -match '## Quick Reference Facts')
        Check "geo-content-structure.md contains '## How'" ($geoContent -match '## How')
        Check "geo-content-structure.md contains '## Frequently Asked Questions'" ($geoContent -match '## Frequently Asked Questions')
    }

    # ------------------------------------------------------------
    # [4] Final Status
    # ------------------------------------------------------------
$total = $script:pass + $script:fail
Write-Host ""
Write-Host "--------------------------------------------------" -ForegroundColor Cyan
Write-Host ("  RESULT: " + $script:pass + "/" + $total + " checks passed") -ForegroundColor $(if ($script:fail -eq 0) { 'Green' } else { 'Red' })
if ($script:fail -eq 0) {
    Write-Host "  STATUS: OpenCode-SEO-Architect is ACTIVE" -ForegroundColor Green
    Write-Host "  Agent:  .opencode/agent/opencode-seo-architect.md (mode: subagent)" -ForegroundColor Green
    Write-Host "  Skills: 10 registered under .opencode/skills/" -ForegroundColor Green
     Write-Host "  Refs:   system_prompt.md | io_spec.json | llms.txt | sitemap.xml | robots.txt | geo-robots.txt | geo-schema-template.json | geo-content-structure.md" -ForegroundColor Green
} else {
    Write-Host ("  STATUS: DEGRADED - " + $script:fail + " check(s) failed. Fix [FAIL] items and rerun.") -ForegroundColor Red
}
Write-Host "--------------------------------------------------" -ForegroundColor Cyan
Write-Host ""

if ($script:fail -gt 0) { exit 1 } else { exit 0 }
