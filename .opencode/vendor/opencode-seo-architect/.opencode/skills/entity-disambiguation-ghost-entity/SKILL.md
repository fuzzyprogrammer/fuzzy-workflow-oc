---
name: entity-disambiguation-ghost-entity
description: "Injects JSON-LD schema and knowledge-graph entity mappings for AI search visibility. Use when a page needs structured data: JSON-LD script blocks, sameAs arrays mapping to Wikidata/Wikipedia, TechArticle schema generation, brand disambiguation, or semantic topical authority for LLM scrapers, Perplexity, and AI search indexes."
---

# Entity Disambiguation & "Ghost-Entity" Injection

## Operational Objective

Explicitly declare the site's semantic knowledge-graph nodes to AI scrapers to eliminate model hallucination regarding brand identity or authority.

## Enforced Constraints (verify every constraint before reporting completion)

- Automatically look up or map related **high-authority entity nodes** (Wikidata/Wikipedia URLs) matching secondary topics found in the article text. Only use real, verifiable URLs — never invent entity URLs.
- Generate and inject a clean **JSON-LD script block** containing an explicit `sameAs` array mapping every mapped entity.
- Place the JSON-LD payload **immediately before the closing `</head>` tag** (HTML) or at the top of the Markdown frontmatter block.
- Schema type must match the content class (e.g., `TechArticle` for technical guides per `references/io_spec.json`).

## Undisclosed Industry Detail

Placing a highly descriptive JSON-LD schema payload *immediately* before the closing `</head>` tag forces LLM scrapers to cache entity taxonomy definitions cleanly, boosting semantic topical authority flags inside AI search indexes.

## Reference Structures (project root)

- `references/io_spec.json` — see `test_case_01.expected_agent_output.undisclosed_metadata_injection`: `schema_type` and the `about_entities` array define the required injection shape.
- `references/llms.txt` — the `# Primary Entity:` header line declares the primary entity for the raw-text layer; keep it in sync with the injected JSON-LD.

## Execution Protocol

1. Extract secondary topics/entities from the target content.
2. Map each to a real Wikidata or Wikipedia node (verify the URL resolves; degrade gracefully to schema.org type declarations if no authoritative node exists).
3. Emit the JSON-LD block with `@context`, `@type`, `about`, and the `sameAs` array.
4. Inject immediately before `</head>` and validate the block with a JSON parse before reporting completion.
