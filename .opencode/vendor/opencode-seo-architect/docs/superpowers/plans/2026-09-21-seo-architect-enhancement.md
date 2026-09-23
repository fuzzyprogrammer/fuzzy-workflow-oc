# OpenCode-SEO-Architect Enhancement Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Enhance the OpenCode-SEO-Architect sub-agent with 6 new specialized skills, GEO reference files, sitemap/robots templates, and updated agent configuration to cover the full spectrum of SEO and GEO optimization.

**Architecture:** The existing agent (opencode-seo-architect.md) dispatches 3 core skills on every optimization job. This plan adds 6 new specialized skills that extend coverage into technical SEO, sitemap/robots, local SEO, competitive analysis, and GEO implementation. New reference files provide templates and standards that the skills consume. The agent and verification script are updated to wire all 9 skills together.

**Tech Stack:** Markdown skill definitions, JSON-LD structured data, XML sitemap format, plain-text robots.txt and llms.txt, PowerShell verification.

## Global Constraints

- All new SKILL.md files must follow the existing format: frontmatter with `name`, `description`, operational objective, enforced constraints, reference structures, execution protocol
- All reference files must follow the existing naming convention under `references/`
- The GEO Strategy Guidelines (geo-schema-template.json, geo-robots.txt, geo-content-structure.md) must be respected as strict semantic layout standards
- Every new skill must be wired into the agent's Mandatory Skill Invocation list
- verify-agent.ps1 must validate every new skill registration and reference file
- Agent rules (TITLE TAG, H1 TAG, FIRST PARAGRAPH P1, INFORMATION DENSITY) must be maintained in system_prompt.md

---

### Task 1: Create Technical SEO Audit Engine Skill

**Files:**
- Create: `.opencode/skills/technical-seo-audit-engine/SKILL.md`

**Dependencies:** None (standalone)

**Interfaces:** Consumes `references/io_spec.json` for validation. Produces technical audit findings covering crawlability, Core Web Vitals, mobile, HTTPS, structured data.

- [ ] **Step 1:** Create the skill directory `.opencode/skills/technical-seo-audit-engine/`
- [ ] **Step 2:** Write `SKILL.md` with the following structure:
  - Frontmatter: `name: technical-seo-audit-engine`, description covering crawlability, indexation, Core Web Vitals, mobile, HTTPS, structured data audit
  - Operational Objective: Automate technical SEO analysis across all dimensions
  - Enforced Constraints: Must check title/H1/P1 front-loading, must validate JSON-LD presence, must check robots.txt compliance, must assess Core Web Vitals metrics
  - Reference Structures: `references/io_spec.json`, `references/system_prompt.md`
  - Execution Protocol: 1) Run crawlability check, 2) Assess Core Web Vitals, 3) Validate mobile/HTTPS, 4) Check structured data, 5) Report pass/fail per constraint
- [ ] **Step 3:** Verify the skill parses correctly by checking frontmatter name matches folder

### Task 2: Create Sitemap Generation Engine Skill

**Files:**
- Create: `.opencode/skills/sitemap-generation-engine/SKILL.md`
- Create: `references/sitemap.xml`

**Dependencies:** None

**Interfaces:** Consumes site URL structure. Produces valid XML sitemap with priority/changefreq.

- [ ] **Step 1:** Create the skill directory `.opencode/skills/sitemap-generation-engine/`
- [ ] **Step 2:** Write `SKILL.md` with:
  - Frontmatter: `name: sitemap-generation-engine`, description covering XML sitemap generation with priority levels and changefreq
  - Operational Objective: Generate and maintain XML sitemaps optimized for search engine crawlers
  - Enforced Constraints: Homepage priority 1.00, guide pages 0.80, about/contact 0.50; weekly changefreq for homepage, monthly for secondary; lastmod dates aligned to current lifecycle
  - Reference Structures: `references/sitemap.xml` template, `references/llms.txt` for primary entity
  - Execution Protocol: 1) Identify all site URLs, 2) Assign priority and changefreq, 3) Generate valid XML with urlset namespace, 4) Validate XML structure
- [ ] **Step 3:** Create `references/sitemap.xml` using the openpixal.com reference pattern adapted for seoservicelearn.com:
```xml
<?xml version="1.0" encoding="UTF-8"?>
<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">
  <url>
    <loc>https://seoservicelearn.com</loc>
    <lastmod>2026-09-21</lastmod>
    <changefreq>weekly</changefreq>
    <priority>1.00</priority>
  </url>
  <url>
    <loc>https://seoservicelearn.com/services</loc>
    <lastmod>2026-09-21</lastmod>
    <changefreq>monthly</changefreq>
    <priority>0.80</priority>
  </url>
  <url>
    <loc>https://seoservicelearn.com/about</loc>
    <lastmod>2026-09-21</lastmod>
    <changefreq>monthly</changefreq>
    <priority>0.50</priority>
  </url>
  <url>
    <loc>https://seoservicelearn.com/contact</loc>
    <lastmod>2026-09-21</lastmod>
    <changefreq>monthly</changefreq>
    <priority>0.50</priority>
  </url>
</urlset>
```

### Task 3: Create Robots Optimization Engine Skill

**Files:**
- Create: `.opencode/skills/robots-optimization-engine/SKILL.md`
- Create: `references/robots.txt`
- Create: `references/geo-robots.txt`

**Dependencies:** Task 2 (sitemap reference)

**Interfaces:** Consumes site domain. Produces robots.txt with AI crawler allowances and sitemap reference.

- [ ] **Step 1:** Create the skill directory `.opencode/skills/robots-optimization-engine/`
- [ ] **Step 2:** Write `SKILL.md` with:
  - Frontmatter: `name: robots-optimization-engine`, description covering robots.txt optimization with explicit AI agent allowances
  - Operational Objective: Configure robots.txt to allow all crawlers including AI agents (GPTBot, ChatGPT-User, PerplexityBot, Google-Extended, Anthropic-AI, ClaudeBot, OAI-SearchBot)
  - Enforced Constraints: Must include all AI agent allowances, must reference sitemap, must use Host directive
  - Reference Structures: `references/robots.txt`, `references/geo-robots.txt`, `references/sitemap.xml`
  - Execution Protocol: 1) Deploy universal Allow rule, 2) Add explicit AI agent Allow directives, 3) Add Host directive, 4) Add Sitemap reference, 5) Validate no disallow rules block critical pages
- [ ] **Step 3:** Create `references/robots.txt`:
```
User-agent: *
Allow: /

# Explicit Allowances for LLM Agents
User-agent: GPTBot
Allow: /

User-agent: ChatGPT-User
Allow: /

User-agent: PerplexityBot
Allow: /

User-agent: Google-Extended
Allow: /

User-agent: Anthropic-AI
Allow: /

User-agent: ClaudeBot
Allow: /

User-agent: OAI-SearchBot
Allow: /

# Host
Host: https://seoservicelearn.com

# Sitemaps
Sitemap: https://seoservicelearn.com/sitemap.xml
```
- [ ] **Step 4:** Create `references/geo-robots.txt` with the same structure but as a reference standard per geo-robots.txt guidelines

### Task 4: Create Local SEO Engine Skill

**Files:**
- Create: `.opencode/skills/local-seo-engine/SKILL.md`

**Dependencies:** None

**Interfaces:** Produces local SEO audit findings and local business schema recommendations.

- [ ] **Step 1:** Create the skill directory `.opencode/skills/local-seo-engine/`
- [ ] **Step 2:** Write `SKILL.md` with:
  - Frontmatter: `name: local-seo-engine`, description covering Google Business Profile optimization, NAP consistency, local schema, local keyword rankings
  - Operational Objective: Audit and optimize local search visibility signals
  - Enforced Constraints: Must validate NAP consistency, must check Google Business Profile fields, must verify local schema markup (LocalBusiness type)
  - Reference Structures: `references/io_spec.json`, `references/geo-schema-template.json`
  - Execution Protocol: 1) Audit GBP profile completeness, 2) Check NAP consistency across directories, 3) Validate LocalBusiness JSON-LD, 4) Assess local keyword rankings, 5) Review review sentiment and quantity

### Task 5: Create Competitive Analysis Engine Skill

**Files:**
- Create: `.opencode/skills/competitive-analysis-engine/SKILL.md`

**Dependencies:** None

**Interfaces:** Produces competitive landscape analysis with keyword gaps and backlink comparisons.

- [ ] **Step 1:** Create the skill directory `.opencode/skills/competitive-analysis-engine/`
- [ ] **Step 2:** Write `SKILL.md` with:
  - Frontmatter: `name: competitive-analysis-engine`, description covering competitor identification, keyword gap analysis, content gap identification, backlink comparison
  - Operational Objective: Identify top 5 competitors and perform comprehensive gap analysis
  - Enforced Constraints: Must identify competitors with higher domain authority, must map keyword gaps, must compare backlink profiles, must assess technical advantages
  - Reference Structures: `references/io_spec.json`
  - Execution Protocol: 1) Identify top 5 competitors by keyword overlap, 2) Compare domain authority and spam scores, 3) Map keyword gaps (competitors ranking for, target not), 4) Identify content gaps, 5) Compare backlink profiles, 6) Assess technical SEO advantages

### Task 6: Create GEO Implementation Engine Skill

**Files:**
- Create: `.opencode/skills/geo-implementation-engine/SKILL.md`
- Create: `references/geo-schema-template.json`
- Create: `references/geo-content-structure.md`

**Dependencies:** Task 3 (robots), Task 4 (local SEO), Task 5 (competitive)

**Interfaces:** Produces JSON-LD schema blocks, FAQPage schema, llms.txt layer, and geo-content templates.

- [ ] **Step 1:** Create the skill directory `.opencode/skills/geo-implementation-engine/`
- [ ] **Step 2:** Write `SKILL.md` with:
  - Frontmatter: `name: geo-implementation-engine`, description covering GEO implementation with schema markup, FAQ schema, llms.txt generation
  - Operational Objective: Implement Generative Engine Optimization including JSON-LD structured data, FAQ schema, and llms.txt RAG layer
  - Enforced Constraints: Must follow geo-schema-template.json structure (WebApplication + FAQPage), must generate FAQ answers under 40 words, must place JSON-LD before `</head>`, must create llms.txt with 4 sections
  - Reference Structures: `references/geo-schema-template.json`, `references/geo-robots.txt`, `references/geo-content-structure.md`, `references/llms.txt`
  - Execution Protocol: 1) Generate WebApplication JSON-LD, 2) Generate FAQPage JSON-LD, 3) Generate Organization schema with sameAs, 4) Create llms.txt with all 4 sections, 5) Create geo-content-structure.md templates, 6) Validate all JSON-LD blocks parse
- [ ] **Step 3:** Create `references/geo-schema-template.json` with the strict semantic layout from the GEO Strategy Guidelines
- [ ] **Step 4:** Create `references/geo-content-structure.md` with the semantic content template from the GEO Strategy Guidelines

### Task 7: Create Content Strategy Engine Skill

**Files:**
- Create: `.opencode/skills/content-strategy-engine/SKILL.md`

**Dependencies:** Task 6 (GEO)

**Interfaces:** Produces content optimization plans with keyword mapping and information density scoring.

- [ ] **Step 1:** Create the skill directory `.opencode/skills/content-strategy-engine/`
- [ ] **Step 2:** Write `SKILL.md` with:
  - Frontmatter: `name: content-strategy-engine`, description covering content planning, keyword mapping, information density optimization
  - Operational Objective: Plan and optimize content for maximum search visibility and AI citation
  - Enforced Constraints: Must enforce keyword front-loading (Title first 50 chars, H1 first phrase, P1 first 25 words), must strip conversational filler, must use comparison matrices, must map 40-60 word micro-query blocks
  - Reference Structures: `references/geo-content-structure.md`, `references/io_spec.json`, `references/llms.txt`
  - Execution Protocol: 1) Map target keywords to pages, 2) Rewrite titles/H1s/P1s with front-loading, 3) Strip filler and increase density, 4) Add comparison matrices for feature comparisons, 5) Create micro-query blocks, 6) Validate against io_spec.json

### Task 8: Update Agent Configuration

**Files:**
- Modify: `.opencode/agent/opencode-seo-architect.md`
- Modify: `references/system_prompt.md`
- Modify: `references/io_spec.json`
- Modify: `references/llms.txt`

**Dependencies:** Tasks 1-7 (all new skills must exist)

**Interfaces:** The agent must reference all 9 skills in Mandatory Skill Invocation. system_prompt.md must include all rules. io_spec.json must have new test cases. llms.txt must have new sections.

- [ ] **Step 1:** Update `.opencode/agent/opencode-seo-architect.md`:
  - Add all 6 new skills to the Mandatory Skill Invocation list (in execution order: technical-seo-audit-engine → sitemap-generation-engine → robots-optimization-engine → local-seo-engine → competitive-analysis-engine → geo-implementation-engine → content-strategy-engine → structural-front-loading-engine → entity-disambiguation-ghost-entity → text-only-semantic-layering-engine)
  - Update Reference Structures section to include all new reference files
  - Update Validation Protocol to cover new skill outputs
- [ ] **Step 2:** Update `references/system_prompt.md`:
  - Add new rules: SITEMAP RULE (sitemap.xml must be present and valid), ROBOTS RULE (robots.txt must allow all AI agents), LOCAL SEO RULE (NAP consistency required), COMPETITIVE RULE (gap analysis required), GEO RULE (schema and llms.txt required)
- [ ] **Step 3:** Update `references/io_spec.json`:
  - Add `test_case_02` for sitemap validation (URL count, priority levels, XML structure)
  - Add `test_case_03` for robots.txt validation (AI agent allowances, sitemap reference, host directive)
  - Add `test_case_04` for GEO schema validation (schema_type, about_entities, FAQPage structure)
- [ ] **Step 4:** Update `references/llms.txt`:
  - Add sections for new capabilities: `## Technical SEO Audit Results`, `## Local SEO Signals`, `## Competitive Landscape`, `## GEO Implementation Status`
  - Update `# Primary Entity:` to reflect the full agency scope
  - Add new micro-query reference answers for local SEO and competitive analysis

### Task 9: Update Verification Script

**Files:**
- Modify: `verify-agent.ps1`

**Dependencies:** Task 8 (agent and references updated)

**Interfaces:** The verification script must validate all new skills, reference files, and agent updates.

- [ ] **Step 1:** Add skill file existence checks for all 6 new skills:
  - technical-seo-audit-engine/SKILL.md
  - sitemap-generation-engine/SKILL.md
  - robots-optimization-engine/SKILL.md
  - local-seo-engine/SKILL.md
  - competitive-analysis-engine/SKILL.md
  - geo-implementation-engine/SKILL.md
  - content-strategy-engine/SKILL.md
- [ ] **Step 2:** Add reference file existence checks:
  - references/sitemap.xml
  - references/robots.txt
  - references/geo-robots.txt
  - references/geo-schema-template.json
  - references/geo-content-structure.md
- [ ] **Step 3:** Add validation for new test cases in io_spec.json (test_case_02, test_case_03, test_case_04)
- [ ] **Step 4:** Add llms.txt section validation for new sections
- [ ] **Step 5:** Add agent frontmatter validation for new skill references
- [ ] **Step 6:** Update final status message to reflect 9 skills and all new reference files

### Task 10: Final Validation and Commit

**Dependencies:** Tasks 1-9

- [ ] **Step 1:** Run `verify-agent.ps1` to confirm all 9 skills are registered and all reference files exist
- [ ] **Step 2:** Verify all SKILL.md frontmatter names match their folder names
- [ ] **Step 3:** Validate all JSON-LD blocks in geo-schema-template.json parse correctly
- [ ] **Step 4:** Validate sitemap.xml XML structure
- [ ] **Step 5:** Validate robots.txt contains all required AI agent allowances
- [ ] **Step 6:** Commit all changes with descriptive message

---

## Self-Review

**Spec coverage:**
- Technical SEO audit → Task 1 ✓
- Sitemap generation → Task 2 ✓
- Robots.txt optimization → Task 3 ✓
- Local SEO → Task 4 ✓
- Competitive analysis → Task 5 ✓
- GEO implementation → Task 6 ✓
- Content strategy → Task 7 ✓
- Agent configuration update → Task 8 ✓
- Verification script update → Task 9 ✓
- Final validation → Task 10 ✓

**Placeholder scan:** No TBDs, TODOs, or vague references. Every task has concrete files, steps, and content.

**Type consistency:** All SKILL.md files follow the same frontmatter structure. All reference files follow established naming conventions. The agent references all skills by their exact folder names.

**GEO compliance:** All GEO Strategy Guidelines are integrated via geo-schema-template.json, geo-robots.txt, and geo-content-structure.md reference files.
