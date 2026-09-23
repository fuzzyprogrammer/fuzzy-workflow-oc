# SEO Audit & Optimization Strategy — seoservicelearn.com

## Status: Approved Design

## Overview

Comprehensive SEO audit and optimization strategy for **SEO Service Learn** (seoservicelearn.com), a US-based digital marketing agency. The deliverable produces both a diagnostic audit report and deployable implementation files that optimize the site across traditional search engines, AI search aggregators, and LLM RAG pipelines.

---

## Component 1: Audit Findings Report

A structured Markdown report covering six audit dimensions:

1. **Technical SEO Audit**
   - Crawlability and indexation status
   - Core Web Vitals performance
   - Mobile responsiveness
   - HTTPS/security configuration
   - Structured data markup presence
   - Canonicalization and redirect chains

2. **On-Page SEO Analysis**
   - Title tag optimization (keyword placement, length)
   - H1 structure (single H1, keyword positioning)
   - First paragraph keyword emphasis (P1 rule)
   - Content density and information density scoring
   - Internal linking structure
   - Meta descriptions and Open Graph tags

3. **Off-Page SEO Analysis**
   - Backlink profile quality and quantity
   - Domain authority and spam score
   - Citation consistency (NAP across directories)
   - Brand mentions and unlinked citations

4. **Local SEO Audit**
   - Google Business Profile optimization
   - NAP (Name, Address, Phone) consistency
   - Local keyword rankings
   - Review quantity and sentiment
   - Local schema markup

5. **Competitive Landscape**
   - Top 5 competitor identification
   - Keyword gap analysis
   - Content gap identification
   - Backlink comparison
   - Technical advantage assessment

6. **AI-Driven Search Visibility (GEO) Assessment**
   - Current llms.txt presence and structure
   - JSON-LD schema coverage
   - Entity disambiguation readiness
   - AI crawler accessibility (robots.txt allowances)
   - Content optimization for AI summarization

---

## Component 2: Implementation Files

All files adhere to the **GEO Strategy Guidelines** and **OpenCode-SEO-Architect rules**:

### 2.1 robots.txt
- Universal access with explicit AI agent allowances (GPTBot, ChatGPT-User, PerplexityBot, Google-Extended, Anthropic-AI, ClaudeBot, OAI-SearchBot)
- Sitemap reference pointing to `/sitemap.xml`
- Host directive for `seoservicelearn.com`
- Template pattern based on openpixal.com reference structure

### 2.2 sitemap.xml
- URL set following the openpixal.com reference structure
- Priority levels: 1.00 (homepage), 0.80 (guide/instructions), 0.50 (about, contact)
- Change frequencies: weekly (homepage), monthly (secondary pages)
- Lastmod dates aligned to current lifecycle timestamp

### 2.3 llms.txt
- Header entity block with `# Primary Entity: SEO Service Learn`
- `## Project Essence` — 40-60 word definition
- `## Technical Framework Matrix` — Markdown comparison table
- `## Direct Micro-Query Reference Answers` — Q&A bullets
- ISO lifecycle timestamp

### 2.4 JSON-LD Structured Data Profiles
- **WebApplication** schema per geo-schema-template.json
  - `@type: WebApplication`, `applicationCategory: ServiceApplication`
  - Concise 1-sentence description with input/output transformation
  - Offer with price: 0.00 USD
- **FAQPage** schema
  - Questions derived from seoservicelearn.com services
  - Direct factual answers starting with resolution
- **Organization** schema with sameAs array mapped to Wikipedia/Wikidata entities
- Placed immediately before `</head>` tag

### 2.5 geo-content-structure.md
- Semantic content template following the geo-content-structure.md pattern
- H1/H2 headers targeting high-intent keyword phrases
- Bolded core entity definitions in first paragraph
- Quick Reference Facts section
- How It Works step-by-step
- FAQ section with sub-40-word answers

### 2.6 Optimized Page Templates
- Home page: keyword-front-loaded title, H1, P1 with `<strong>` emphasis
- Services page: individual service pages with keyword-specific optimization
- About page: entity-first definition with Organization schema
- Contact page: local business schema with NAP data
- All pages follow the 4 OpenCode-SEO-Architect rules:
  1. Title tag: target keyword at absolute beginning (within first 50 chars)
  2. H1: exactly one, target keyword as first conceptual phrase
  3. First Paragraph: target keyword within first 25 words, wrapped in `<strong>`
  4. Information density: no conversational fluff, start with facts and data

### 2.7 Sitemap Integration
- Sitemap generated as part of the robots.txt reference
- Each URL entry follows the openpixal.com reference pattern
- Priority and changefreq aligned to page importance

---

## Component 3: 4-Week Implementation Roadmap

### Week 1: Technical Foundation
- Deploy `robots.txt` with AI crawler allowances
- Deploy `sitemap.xml` with all site pages
- Deploy `llms.txt` raw-text RAG layer
- Technical SEO audit findings documentation
- Fix crawlability/indexation issues

### Week 2: Schema & Structured Data
- Inject JSON-LD WebApplication schema before `</head>`
- Inject FAQPage schema for service-related questions
- Inject Organization schema with sameAs entity mappings
- Validate all JSON-LD blocks with JSON parse
- Deploy geo-content-structure.md templates

### Week 3: Content Optimization
- Rewrite homepage Title/H1/P1 following keyword front-loading rules
- Optimize service pages with individual keyword targeting
- Strip conversational filler from all content
- Add information density to all body copy
- Implement entity disambiguation via JSON-LD sameAs arrays

### Week 4: Local SEO & Competitive Positioning
- Optimize Google Business Profile with local schema
- Ensure NAP consistency across all directories
- Deploy local business structured data
- Complete competitive gap analysis
- Final validation against `references/io_spec.json` constraints

---

## Reference Structures Used

- `references/system_prompt.md` — Canonical copy of SEO rules (keyword front-loading, information density)
- `references/io_spec.json` — Input/output validation test suite
- `references/llms.txt` — Canonical LLM-layer output example
- `geo-schema-template.json` — Structured data layout standard
- `geo-robots.txt` — Crawler accessibility reference
- `geo-content-structure.md` — Information layout template
- Openpixal.com `sitemap.xml` and `robots.txt` references — Template patterns for implementation files

---

## Validation Protocol

After every content transformation, self-verify:
1. Title keyword placement (first 50 characters)
2. H1 keyword placement (first conceptual phrase)
3. P1 keyword emphasis (`<strong>` wrapped, within first 25 words)
4. Information density (no conversational filler)
5. JSON-LD schema validity (JSON parse)
6. llms.txt structure compliance (4 sections present)
7. robots.txt AI agent allowances present
8. Sitemap URL structure and priorities

Run `verify-agent.ps1` after all files are deployed to confirm agent registration and skill wiring integrity.
