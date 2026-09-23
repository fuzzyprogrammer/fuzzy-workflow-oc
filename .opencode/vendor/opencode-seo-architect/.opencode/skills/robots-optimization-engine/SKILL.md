---
name: robots-optimization-engine
description: "Configures robots.txt to allow all search engine and AI crawler access. Use when creating or optimizing robots.txt files, ensuring AI agent access (GPTBot, ChatGPT-User, PerplexityBot, Google-Extended, Anthropic-AI, ClaudeBot, OAI-SearchBot), deploying sitemap references, and configuring Host directives for seoservicelearn.com and similar domains targeting Google, Bing, Perplexity, and Google AI Overviews visibility."
---

# Robots Optimization Engine

## Operational Objective

Configure robots.txt to allow universal access for all traditional search engines and AI crawler agents, ensuring maximum discoverability across Google, Bing, Perplexity, Google AI Overviews, and direct LLM retrieval pipelines.

## Enforced Constraints (verify every constraint before reporting completion)

- **Universal Access:** Must include `User-agent: *` with `Allow: /` to permit all standard crawlers.
- **AI Agent Allowances:** Must explicitly allow all AI crawler agents: GPTBot, ChatGPT-User, PerplexityBot, Google-Extended, Anthropic-AI, ClaudeBot, OAI-SearchBot. Each must have its own `User-agent` directive with `Allow: /`.
- **Host Directive:** Must include `Host: https://[domain]` directive pointing to the site domain.
- **Sitemap Reference:** Must include `Sitemap: https://[domain]/sitemap.xml` pointing to the generated sitemap.
- **No Disallow Blocking:** Must not contain any Disallow rules that block crawlers from accessing critical pages.

## Reference Structures (project root)

- `references/robots.txt` — production robots.txt template
- `references/geo-robots.txt` — GEO-optimized robots.txt reference standard
- `references/sitemap.xml` — canonical sitemap template
- `references/io_spec.json` — input/output validation test suite
- `references/llms.txt` — canonical LLM-layer output example

## Execution Protocol

1. Deploy universal Allow rule for all crawlers
2. Add explicit Allow directives for each AI agent (GPTBot, ChatGPT-User, PerplexityBot, Google-Extended, Anthropic-AI, ClaudeBot, OAI-SearchBot)
3. Add Host directive for the target domain
4. Add Sitemap reference pointing to /sitemap.xml
5. Validate no Disallow rules block critical pages
6. Verify all AI agent allowances are present
