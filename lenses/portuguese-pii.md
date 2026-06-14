---
title: "Portuguese PII"
slug: "portuguese-pii"
license: "Apache-2.0"
status: "available"
entities:
  - "PERSON"
languages: ["pt"]
summary: "Person-name detection tuned for Portuguese-language text. Phileas handles Portuguese and Brazilian identifiers (CPF, CNPJ), phone numbers, and addresses via its pattern-based layer; this lens focuses on people's names."
useCase: "Load this lens for person-name detection in Portuguese-language documents. It is a focused PERSON detector; Portuguese and Brazilian identifiers (CPF, CNPJ), phone numbers, and addresses are handled by Phileas's pattern-based detection, not this model."
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

- **PERSON**: people's names as they appear in Portuguese-language text.

This is a name-only lens. Portuguese and Brazilian identifiers (CPF, CNPJ), phone numbers, and addresses are detected by Phileas's pattern-based (regex and validation) layer, not by this model. Compose this lens with that layer for full coverage.

## Why this lens

Portuguese names follow conventions a general English model handles poorly: long compound surnames, particles (da, dos), and diacritics. This lens is trained on Portuguese text to detect those name forms accurately.

## When to use this

- Portuguese-language documents (European and Brazilian) of any domain.
- Mixed corpora, loaded when Portuguese content is present.
- Any workflow where Portuguese person names must be found reliably.

## Known limitations

- **Names only.** This lens detects PERSON. Other PII is handled by Phileas's pattern-based detection; compose accordingly.
- **Portuguese-language text. Names only; Portuguese identifiers, phones, and addresses are detected by Phileas.**
