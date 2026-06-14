---
title: "French PII"
slug: "french-pii"
license: "Apache-2.0"
status: "available"
entities:
  - "PERSON"
languages: ["fr"]
summary: "Person-name detection tuned for French-language text. Phileas handles French identifiers (INSEE, SIREN, SIRET), phone numbers, and addresses via its pattern-based layer; this lens focuses on people's names."
useCase: "Load this lens for person-name detection in French-language documents. It is a focused PERSON detector; French identifiers (INSEE, SIREN, SIRET), phone numbers, and addresses are handled by Phileas's pattern-based detection, not this model."
author: "Philterd"
creator: "philterd"
provenance: "Philterd"
version: "1.0.0"
updated: "2026-05-22"
pheyeCompatibility: ">=1.0.0"
modelSize: "190 MB"
pairsWith: ["general-purpose", "healthcare"]
---
## What this lens detects

- **PERSON**: people's names as they appear in French-language text.

This is a name-only lens. French identifiers (INSEE, SIREN, SIRET), phone numbers, and addresses are detected by Phileas's pattern-based (regex and validation) layer, not by this model. Compose this lens with that layer for full coverage.

## Why this lens

French names follow conventions a general English model handles poorly: particles (de, le), hyphenated given names, and diacritics. This lens is trained on French text to detect those name forms accurately.

## When to use this

- French-language documents of any domain.
- Mixed corpora, loaded when French content is present.
- Any workflow where French person names must be found reliably.

## Known limitations

- **Names only.** This lens detects PERSON. Other PII is handled by Phileas's pattern-based detection; compose accordingly.
- **French-language text. Names only; French identifiers, phones, and addresses are detected by Phileas.**
