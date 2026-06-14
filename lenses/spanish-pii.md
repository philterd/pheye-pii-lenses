---
title: "Spanish PII"
slug: "spanish-pii"
license: "Apache-2.0"
status: "available"
entities:
  - "PERSON"
languages: ["es"]
summary: "Person-name detection tuned for Spanish-language text. Phileas handles Spanish identifiers (DNI, NIE, CIF), phone numbers, and addresses via its pattern-based layer; this lens focuses on people's names."
useCase: "Load this lens for person-name detection in Spanish-language documents. It is a focused PERSON detector; Spanish identifiers (DNI, NIE, CIF), phone numbers, and addresses are handled by Phileas's pattern-based detection, not this model."
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

- **PERSON**: people's names as they appear in Spanish-language text.

This is a name-only lens. Spanish identifiers (DNI, NIE, CIF), phone numbers, and addresses are detected by Phileas's pattern-based (regex and validation) layer, not by this model. Compose this lens with that layer for full coverage.

## Why this lens

Spanish names follow conventions a general English model handles poorly: compound surnames, particles (de, del, la), and diacritics. This lens is trained on Spanish text to detect those name forms accurately.

## When to use this

- Spanish-language documents of any domain.
- Mixed corpora, loaded when Spanish content is present.
- Any workflow where Spanish person names must be found reliably.

## Known limitations

- **Names only.** This lens detects PERSON. Other PII is handled by Phileas's pattern-based detection; compose accordingly.
- **Spanish-language text. Names only; Spanish identifiers, phones, and addresses are detected by Phileas.**
