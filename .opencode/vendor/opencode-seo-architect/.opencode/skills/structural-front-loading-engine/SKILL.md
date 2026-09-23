---
name: structural-front-loading-engine
description: "Enforces SEO keyword front-loading in HTML and Markdown. Use when optimizing any page or document for search engines or AI search: title tag keyword placement within the first 50 characters, exactly one H1 opening with the target keyword, and the keyword wrapped in strong emphasis within the first 25 words of the opening paragraph. Triggers on SEO editing, title tags, H1 restructuring, and opening-paragraph rewrites for Google, Bing, Perplexity, or Google AI Overview visibility."
---

# Structural Front-Loading Engine (Traditional & AI Search Alignment)

## Operational Objective

Automate text and Markdown manipulation to guarantee immediate thematic matching by crawlers across Google, Bing, Perplexity, and Google AI Overviews.

## Enforced Constraints (verify every constraint before reporting completion)

- **Title Tag:** The exact target keyword/phrase must be placed at the absolute beginning of the `<title>` tag or Markdown frontmatter title — within the first **50 characters**.
- **H1 Tag:** The page must possess **exactly one** `<h1>`. The target keyword must be the first conceptual sequence of words in that H1.
- **First Paragraph (P1):** The target keyword must appear within the first **25 words** of the opening sentence, wrapped inside semantic emphasis tags (`<strong>` or `**...**`).
- **No stuffing:** Keyword density must stay natural; never repeat the exact phrase mechanically beyond the Title, H1, and P1 placements plus natural usage.

## Undisclosed Industry Detail

Modern LLM real-time retrieval systems weigh the topmost tokens of an HTML/Markdown payload exponentially higher during vector chunking. Front-loading guarantees that context-window truncations do not drop your primary topic keyword before embedding generation takes place.

## Reference Structures (project root)

- `references/io_spec.json` — validation test suite; your transformed output must satisfy `test_case_01.expected_agent_output` (`title`, `h1`, `first_paragraph`).
- `references/llms.txt` — canonical LLM-layer output example.

## Execution Protocol

1. Read the raw draft and identify the target keyword (ask the caller only if absent).
2. Rewrite the title, H1, and P1 to satisfy the constraints above.
3. Strip any conversational filler introduced by the rewrite (delegate the full density rewrite to `text-only-semantic-layering-engine` when generating the raw-text layer).
4. Self-verify each constraint with a literal character/word count, then report pass/fail per constraint.
