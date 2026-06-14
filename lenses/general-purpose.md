---
title: "General Purpose"
slug: "general-purpose"
license: "Apache-2.0"
status: "available"
entities:
  - "PERSON"
languages: ["en"]
summary: "Person-name detection tuned for general English text. Phileas handles dates, phone numbers, emails, URLs, and structured identifiers via its pattern-based layer; this lens focuses on people's names."
useCase: "Load this lens for person-name detection in general English documents. It is a focused PERSON detector; dates, phone numbers, emails, URLs, and structured identifiers are handled by Phileas's pattern-based detection, not this model."
author: "Philterd"
creator: "philterd"
provenance: "Philterd"
hf_name: "philterd/ph-eye-pii-base"
hf_url: "https://huggingface.co/philterd/ph-eye-pii-base"
version: "1.0.0"
updated: "2026-05-22"
pheyeCompatibility: ">=1.0.0"
modelSize: "180 MB"
---
## What this lens detects

- **PERSON**: people's names as they appear in general English text.

This is a name-only lens. Dates, phone numbers, emails, URLs, and structured identifiers are detected by Phileas's pattern-based (regex and validation) layer, not by this model. Compose this lens with that layer for full coverage.

## Why this lens

This is the baseline person-name detector. Load it whenever names need to be found in English text and no more specific domain or language lens applies. It is trained for broad coverage of English name forms.

## When to use this

- General English documents that do not fall into a specific domain.
- As the default name detector, composed with Phileas's pattern-based detection for other PII.
- As a fallback alongside a domain lens for mixed-content corpora.

## Known limitations

- **Names only.** This lens detects PERSON. Other PII is handled by Phileas's pattern-based detection; compose accordingly.
- **English only. For other languages, load the corresponding language lens; for identifier-heavy verticals, load the matching domain lens.**
