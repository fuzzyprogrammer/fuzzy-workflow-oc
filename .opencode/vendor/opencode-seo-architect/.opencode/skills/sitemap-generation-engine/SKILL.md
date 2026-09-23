---
name: sitemap-generation-engine
description: "Generates and maintains XML sitemaps optimized for search engine crawlers. Use when creating sitemap.xml files, updating URL priorities and changefreq, validating XML structure, or ensuring all site pages are discoverable by Google, Bing, Perplexity, and AI crawlers including GPTBot, PerplexityBot, and Google-Extended."
---

# Sitemap Generation Engine

## Operational Objective

Generate and maintain valid XML sitemaps per the [sitemaps.org protocol](https://www.sitemaps.org/protocol.html) with optimized priority levels and change frequencies to ensure all site pages are fully discoverable by traditional search engines and AI crawlers.

## Enforced Constraints (verify every constraint before reporting completion)

### XML Structure (mandatory)
- Must begin with `<urlset>` and end with `</urlset>`.
- Must specify namespace: `xmlns="http://www.sitemaps.org/schemas/sitemap/0.9"`.
- Each `<url>` parent tag must contain a `<loc>` child entry.
- All other tags (`<lastmod>`, `<changefreq>`, `<priority>`) are optional.
- File must be UTF-8 encoded.

### URL Rules (mandatory)
- **Single host:** All URLs in a Sitemap must be from a single host (e.g., www.example.com or store.example.com). Mixed-host URLs are dropped.
- **URL length:** Each `<loc>` value must be less than 2,048 characters.
- **Protocol prefix:** Every URL must begin with the protocol (`http://` or `https://`).
- **Entity escaping:** All data values including URLs must be entity-escaped: `&` → `&amp;`, `'` → `&apos;`, `"` → `&quot;`, `>` → `&gt;`, `<` → `&lt;`.
- **URL escaping:** URLs must be RFC-3986/RFC-3987 compliant and URL-escaped.

### URL Count and File Size (mandatory)
- **Max 50,000 URLs** per sitemap file.
- **Max 50MB** (52,428,800 bytes) uncompressed per file.
- If exceeded, split into multiple sitemap files and create a Sitemap index file.

### Priority (guideline — not a command)
- Valid range: **0.0 to 1.0** (default is 0.5).
- Priority is **relative** to other URLs on the same site only — it does not affect comparison across sites.
- Assigning high priority to all URLs is not beneficial.
- Homepage: typically 1.0. Important guide/instruction pages: 0.8. Standard pages: 0.5. Archive/about/contact: 0.3-0.5.
- These are **hints** to search engines, not commands.

### Change Frequency (hint — not a command)
- Valid values: `always`, `hourly`, `daily`, `weekly`, `monthly`, `yearly`, `never`.
- Provides **general information** to crawlers; may not correlate exactly to crawl frequency.
- Crawlers may crawl "hourly" pages less often and "yearly" pages more often than the hint.
- Crawlers may periodically crawl "never" pages to handle unexpected changes.

### Lastmod (mandatory when included)
- Must be the **date the linked page was last modified**, NOT when the sitemap is generated.
- Must be in W3C Datetime format: `YYYY-MM-DD` or `YYYY-MM-DDTHH:MM:SS+00:00`.
- Time portion may be omitted if desired.

### Sitemap Index Files
- Use when exceeding 50,000 URLs across the site.
- `<sitemapindex>` contains `<sitemap>` entries, each with a `<loc>` pointing to a sitemap file.
- Max 50,000 sitemaps per index; max 50MB.
- All sitemaps in the index must be on the same site.

### Sitemap Location Rules
- Sitemap file location determines which URLs are valid. A sitemap at `http://example.com/catalog/sitemap.xml` can only include URLs starting with `http://example.com/catalog/`.
- Strongly recommended to place sitemap at the root directory (e.g., `http://example.com/sitemap.xml`).
- All URLs in the sitemap must use the same protocol (http or https) and host.

### Informing Search Engines (post-generation)
1. **robots.txt:** Add `Sitemap: http://www.example.com/sitemap.xml` directive (independent of user-agent lines). Multiple sitemaps can be listed.
2. **HTTP Ping:** `GET <searchengine_URL>/ping?sitemap=<url-encoded-sitemap-url>` — returns HTTP 200 on success.
3. **Direct submission:** Via each search engine's submission interface.

### Validation
- Validate against the XML Schema: `http://www.sitemaps.org/schemas/sitemap/0.9/sitemap.xsd`
- Add `xsi:schemaLocation` and `xmlns:xsi` headers for schema validation.
- Use XML parsers and tools to verify structure before reporting completion.

## Reference Structures (@seo-architect)

- `references/sitemap.xml` — canonical sitemap template
- `references/llms.txt` — canonical LLM-layer output example
- `references/io_spec.json` — input/output validation test suite

## Execution Protocol

1. Identify all site URLs and their importance level
2. Verify all URLs are from the same host
3. Assign priority (0.0-1.0, relative within site) and changefreq (valid hint value) to each URL
4. Set `<lastmod>` to each page's actual last modification date (not generation date) in W3C Datetime format
5. Generate valid XML with urlset namespace, entity-escaped values, and all required elements
6. If URL count exceeds 50,000, split into multiple sitemaps and create a sitemap index file
7. Validate XML structure against the sitemaps.org XSD schema
8. Add `Sitemap:` directive to `robots.txt`
9. Report sitemap URL count, priority distribution, changefreq distribution, and validation status
