---
name: technical-seo-audit-engine
description: "Conducts comprehensive technical SEO audits covering crawlability, indexation, Core Web Vitals, mobile responsiveness, HTTPS configuration, and structured data presence. Use when auditing site technical health, diagnosing crawl issues, assessing page experience metrics, or validating structured data markup for Google, Bing, Perplexity, and Google AI Overviews visibility."
---

# Technical SEO Audit Engine

## Operational Objective

Automate technical SEO analysis across all dimensions to ensure the site is fully crawlable, indexable, and optimized for both traditional search engines and AI search aggregators.

## Enforced Constraints (verify every constraint before reporting completion)

- **TITLE/H1/P1 Front-Loading:** Must verify the target keyword appears at the beginning of the title tag (first 50 chars), the H1 tag (first conceptual phrase), and the first paragraph (within first 25 words, wrapped in strong emphasis).
- **JSON-LD Presence:** Must validate that structured data (JSON-LD) is present and parseable before reporting completion.
- **Robots.txt Compliance:** Must verify robots.txt allows all AI crawler agents (GPTBot, ChatGPT-User, PerplexityBot, Google-Extended, Anthropic-AI, ClaudeBot, OAI-SearchBot).
- **Core Web Vitals:** Must assess LCP, INP, and CLS metrics and report pass/fail per metric.
- **Mobile Responsiveness:** Must validate viewport meta tag and responsive design indicators.
- **HTTPS:** Must confirm SSL/TLS configuration and HTTPS enforcement.

## Reference Structures (project root)

- `references/io_spec.json` — input/output validation test suite
- `references/system_prompt.md` — canonical copy of SEO rules
- `references/llms.txt` — canonical LLM-layer output example

## Execution Protocol

1. Run crawlability check (robots.txt, sitemap.xml, noindex directives)
2. Assess Core Web Vitals (LCP, INP, CLS)
3. Validate mobile responsiveness (viewport meta, responsive design)
4. Check HTTPS configuration (SSL certificate, HTTPS enforcement)
5. Verify structured data presence and JSON-LD validity
6. Report pass/fail per constraint
