---
title: "Legal"
slug: "legal"
license: "Apache-2.0"
status: "available"
entities:
  - "PERSON"
languages: ["en"]
summary: "Person-name detection tuned for legal text. Phileas handles case, docket, bar, and Bates numbers via its pattern-based layer; this lens focuses on people's names."
useCase: "Load this lens for person-name detection in legal documents. It is a focused PERSON detector; case, docket, bar, and Bates numbers are handled by Phileas's pattern-based detection, not this model."
author: "Philterd"
creator: "philterd"
provenance: "Philterd"
version: "1.0.0"
updated: "2026-05-22"
pheyeCompatibility: ">=1.0.0"
modelSize: "85 MB"
pairsWith: ["general-purpose"]
---
## What this lens detects

- **PERSON**: people's names as they appear in legal text.

This is a name-only lens. Case, docket, bar, and Bates numbers are detected by Phileas's pattern-based (regex and validation) layer, not by this model. Compose this lens with that layer for full coverage.

## Why this lens

Legal documents are dense with citations, docket and case numbers, party roles, and court names that a general model can confuse with people's names. This lens is tuned for name precision in that context; Phileas detects the legal identifiers.

## When to use this

- Court filings, pleadings, and discovery productions.
- Docketed correspondence and case management records.
- E-discovery pipelines where party and counsel names must be found.

## Known limitations

- **Names only.** This lens detects PERSON. Other PII is handled by Phileas's pattern-based detection; compose accordingly.
- **English only. Names only; legal identifiers are detected by Phileas, not this model.**
