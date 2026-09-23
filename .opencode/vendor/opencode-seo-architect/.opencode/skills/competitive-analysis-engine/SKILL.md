---
name: competitive-analysis-engine
description: "Identifies top competitors and performs comprehensive SEO gap analysis. Use when analyzing competitive landscape, mapping keyword gaps, comparing backlink profiles, identifying content gaps, and assessing technical advantages versus competitors targeting Google, Bing, Perplexity, and Google AI Overviews."
---

# Competitive Analysis Engine

## Operational Objective

Identify the top 5 competitors and perform comprehensive gap analysis across keyword rankings, content coverage, backlink profiles, and technical SEO to uncover missed opportunities and competitive advantages.

## Enforced Constraints (verify every constraint before reporting completion)

- **Competitor Identification:** Must identify at least 5 competitors ranking for the same target keywords.
- **Domain Authority Comparison:** Must compare domain authority and spam scores for each competitor.
- **Keyword Gap Mapping:** Must map keywords where competitors rank but the target site does not.
- **Content Gap Identification:** Must identify topics and subtopics covered by competitors but missing from the target site's content.
- **Backlink Profile Comparison:** Must compare backlink count, quality, and referring domains for each competitor.
- **Technical Assessment:** Must assess technical SEO advantages including page speed, structured data usage, and mobile optimization.

## Reference Structures (project root)

- `references/io_spec.json` — input/output validation test suite
- `references/llms.txt` — canonical LLM-layer output example

## Execution Protocol

1. Identify top 5 competitors by keyword overlap
2. Compare domain authority and spam scores
3. Map keyword gaps (competitors ranking for, target not ranking)
4. Identify content gaps (topics competitors cover but target does not)
5. Compare backlink profiles (count, quality, referring domains)
6. Assess technical SEO advantages (speed, structured data, mobile)
7. Report comprehensive gap analysis
