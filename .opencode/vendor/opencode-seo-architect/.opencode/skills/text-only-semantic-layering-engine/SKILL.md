---
name: text-only-semantic-layering-engine
description: "Generates and maintains the llms.txt raw-text RAG layer. Use when creating or updating /llms.txt, stripping conversational filler from drafts, converting editorial prose into Markdown comparison matrices, or writing 40-60 word micro-query definition blocks optimized for Perplexity citations and Google AI Overview extraction."
---

# Text-Only Semantic Layering Engine (The LLM Layer)

## Operational Objective

Maintain and continually append an un-rendered, hyper-efficient text layout block tailored for lightweight, raw-text RAG scrapers.

## Enforced Constraints (verify every constraint before reporting completion)

- Strip all conversational filler ("In this post we will show you...", "Have you ever wondered..."). Start immediately with cold definitions, numerical data matrices, and actionable lists.
- Format data using clean **Markdown comparison matrices** rather than editorial prose.
- Every definition block destined for AI Overview/Perplexity extraction must be **40-60 words**, formatted as a standalone H2/H3 block.
- Keep the header block intact: `# llms.txt`, `# Primary Entity:`, `# Last Verified Lifecycle Timestamp:` (ISO date).

## Undisclosed Industry Detail

AI aggregators query sites with dynamic "micro-queries". Direct, 40-to-60-word definitions formatted cleanly as an H2/H3 block have a drastically higher probability of being extracted for a Google AI Overview or Perplexity citation box.

## Reference Structures (project root)

- `references/llms.txt` — canonical output example; every generated llms.txt artifact must match its structure: header entity block, `## Project Essence`, `## Technical Framework Matrix` (comparison table), `## Direct Micro-Query Reference Answers`.
- `references/io_spec.json` — input/output validation test suite; run every case before reporting completion.

## Execution Protocol

1. Read the target content and extract factual units (definitions, numbers, comparisons).
2. Rewrite as: entity header block -> essence definition (40-60 words) -> comparison matrix -> micro-query Q&A bullets.
3. Append to or update the project's `/llms.txt` root endpoint file.
4. Validate the structure against `references/llms.txt` section-by-section before reporting completion.
