---
name: local-seo-engine
description: "Audits and optimizes local SEO signals for Google Business Profile, NAP consistency, local schema markup, and local keyword rankings. Use when auditing local search visibility, validating Google Business Profile completeness, checking NAP (Name, Address, Phone) consistency across directories, verifying LocalBusiness JSON-LD schema, or analyzing local search performance for service-area businesses."
---

# Local SEO Engine

## Operational Objective

Audit and optimize local search visibility signals including Google Business Profile completeness, NAP consistency across all directories, local keyword rankings, review sentiment, and LocalBusiness structured data to ensure maximum local search presence.

## Enforced Constraints (verify every constraint before reporting completion)

- **NAP Consistency:** Must verify that Name, Address, and Phone are identical across all major directories (Google Business Profile, Yelp, Bing Places, Facebook, industry-specific directories).
- **Google Business Profile:** Must validate GBP profile completeness — business name, category, description, hours, photos, attributes, and services sections must all be populated.
- **LocalBusiness Schema:** Must validate that LocalBusiness JSON-LD schema is present with correct @type, name, address (PostalAddress), telephone, openingHours, and areaServed properties.
- **Local Keywords:** Must assess local keyword rankings (city + service terms) and report gaps.
- **Review Signals:** Must evaluate review quantity, average rating, and sentiment across platforms.
- **Citation Consistency:** Must check for duplicate listings and inconsistent NAP variations across the web.

## Reference Structures (project root)

- `references/io_spec.json` — input/output validation test suite
- `references/geo-schema-template.json` — GEO structured data layout standard
- `references/llms.txt` — canonical LLM-layer output example

## Execution Protocol

1. Audit GBP profile completeness (name, category, description, hours, photos)
2. Check NAP consistency across major directories
3. Validate LocalBusiness JSON-LD schema presence and properties
4. Assess local keyword rankings (city + service terms)
5. Evaluate review quantity, rating, and sentiment
6. Report pass/fail per constraint
