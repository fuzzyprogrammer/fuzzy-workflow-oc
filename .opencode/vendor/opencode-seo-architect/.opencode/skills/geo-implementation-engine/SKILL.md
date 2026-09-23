---
name: geo-implementation-engine
description: "Implements Generative Engine Optimization including JSON-LD structured data, FAQPage schema, and llms.txt RAG layer generation. Use when deploying schema markup, generating FAQ sections, creating llms.txt for AI crawlers, building JSON-LD WebApplication and Organization schemas, or optimizing content for Perplexity and Google AI Overview citations."
---

# GEO Implementation Engine

## Operational Objective

Implement Generative Engine Optimization to ensure the site is prioritized, cited, and summarized by LLM crawlers and Retrieval-Augmented Generation (RAG) engines through structured data, FAQ schema, and raw-text llms.txt layers.

## Enforced Constraints (verify every constraint before reporting completion)

- **JSON-LD WebApplication Schema:** Must generate a JSON-LD block with `@type: WebApplication`, `applicationCategory: ServiceApplication`, concise 1-sentence description with input/output transformation, `browserRequirements: Requires HTML5`, `permissions: anonymous`, and `offers` with `price: 0.00` and `priceCurrency: USD`.
- **FAQPage Schema:** Must generate a JSON-LD FAQPage block with `@type: FAQPage`, containing `mainEntity` array of `Question` and `Answer` objects. Each answer must start directly with the resolution and contain no introductory fluff. Must be under 40 words for LLM citation synthesis.
- **Organization Schema:** Must generate JSON-LD with `@type: Organization`, `name`, `url`, and `sameAs` array mapped to real Wikipedia/Wikidata URLs.
- **Schema Placement:** All JSON-LD must be placed immediately before the closing `</head>` tag.
- **llms.txt Layer:** Must generate `/llms.txt` with 4 sections: header entity block (`# llms.txt`, `# Primary Entity:`, `# Last Verified Lifecycle Timestamp:`), `## Project Essence`, `## Technical Framework Matrix`, `## Direct Micro-Query Reference Answers`.
- **Content Structure:** Must follow the geo-content-structure.md template: H1/H2 headers targeting high-intent keyword phrases, bolded core entity definitions in first paragraph, Quick Reference Facts section, How It Works step-by-step, FAQ section with sub-40-word answers.

## Reference Structures (project root)

- `references/geo-schema-template.json` — strict semantic layout standard for structured data
- `references/geo-content-structure.md` — semantic format template for content writing
- `references/geo-robots.txt` — crawler accessibility reference
- `references/llms.txt` — canonical LLM-layer output example
- `references/io_spec.json` — input/output validation test suite

## Execution Protocol

1. Generate WebApplication JSON-LD schema
2. Generate FAQPage JSON-LD schema with service-related questions
3. Generate Organization schema with sameAs entity mappings
4. Create llms.txt with all 4 required sections
5. Create geo-content-structure.md template with H1/H2 headers, bolded definitions, facts, and FAQs
6. Validate all JSON-LD blocks parse as valid JSON
7. Report schema type, entity count, and llms.txt section compliance
