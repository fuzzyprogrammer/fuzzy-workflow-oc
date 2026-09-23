---
name: content-strategy-engine
description: "Plans and optimizes content for maximum search visibility and AI citation. Use when mapping keywords to pages, rewriting titles and headings with keyword front-loading, stripping conversational filler, adding comparison matrices, creating 40-60 word micro-query blocks, and validating content against SEO rules for Google, Bing, Perplexity, and Google AI Overviews."
---

# Content Strategy Engine

## Operational Objective

Plan and optimize content for maximum search visibility and AI citation by enforcing keyword front-loading rules, stripping conversational filler, and structuring content for RAG retrieval systems.

## Enforced Constraints (verify every constraint before reporting completion)

- **Title Front-Loading:** Target keyword must be at the absolute beginning of the title tag or Markdown frontmatter title, within the first 50 characters.
- **H1 Front-Loading:** Exactly one H1 per page. Target keyword must be the first conceptual phrase in that H1.
- **P1 Front-Loading:** Target keyword must appear within the first 25 words of the opening sentence, wrapped in strong emphasis tags (`<strong>` or `**...**`).
- **Information Density:** Must strip all conversational fluff ("In this article we will look at...", "Have you ever wondered..."). Content must start immediately with facts, data matrices, and entity-first definitions.
- **Comparison Matrices:** Data must be formatted using clean Markdown comparison matrices rather than editorial prose.
- **Micro-Query Blocks:** Every definition block for AI extraction must be 40-60 words, formatted as a standalone H2/H3 block.

## Reference Structures (project root)

- `references/geo-content-structure.md` — semantic format template for content writing
- `references/io_spec.json` — input/output validation test suite
- `references/llms.txt` — canonical LLM-layer output example

## Execution Protocol

1. Map target keywords to specific pages
2. Rewrite titles/H1s/P1s with keyword front-loading
3. Strip conversational filler and increase information density
4. Add comparison matrices for feature comparisons
5. Create micro-query blocks (40-60 words each)
6. Validate against io_spec.json constraints
7. Report keyword placement compliance and density score
