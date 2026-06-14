---
title: "German PII"
slug: "german-pii"
license: "Apache-2.0"
status: "available"
entities:
  - "PERSON"
languages: ["de"]
summary: "Person-name detection tuned for German-language text. Phileas handles German identifiers (Steuer-ID, Personalausweis), phone numbers, and addresses via its pattern-based layer; this lens focuses on people's names."
useCase: "Load this lens for person-name detection in German-language documents. It is a focused PERSON detector; German identifiers (Steuer-ID, Personalausweis), phone numbers, and addresses are handled by Phileas's pattern-based detection, not this model."
author: "Philterd"
creator: "philterd"
provenance: "Philterd"
version: "1.0.0"
updated: "2026-05-22"
pheyeCompatibility: ">=1.0.0"
modelSize: "195 MB"
pairsWith: ["general-purpose", "healthcare"]
---
## What this lens detects

- **PERSON**: people's names as they appear in German-language text.

This is a name-only lens. German identifiers (Steuer-ID, Personalausweis), phone numbers, and addresses are detected by Phileas's pattern-based (regex and validation) layer, not by this model. Compose this lens with that layer for full coverage.

## Why this lens

German names and the capitalization of common nouns create distractors a general English model handles poorly. This lens is trained on German text to detect German name forms accurately while rejecting capitalized non-names.

## When to use this

- German-language documents of any domain.
- Mixed corpora, loaded when German content is present.
- Any workflow where German person names must be found reliably.

## Known limitations

- **Names only.** This lens detects PERSON. Other PII is handled by Phileas's pattern-based detection; compose accordingly.
- **German-language text. Names only; German identifiers, phones, and addresses are detected by Phileas.**
