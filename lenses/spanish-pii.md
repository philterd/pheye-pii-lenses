---
title: "Spanish PII"
slug: "spanish-pii"
license: "Apache-2.0"
status: "available"
entities:
  - "PERSON"
  - "LOCATION"
  - "ORG"
  - "DNI"
  - "NIE"
  - "CIF"
  - "PHONE"
  - "ADDRESS"
languages: ["es"]
summary: "Spanish-language PII detection for documents written in Spanish: Spain and Latin American name patterns, address formats, and national-ID identifiers (DNI, NIE, CIF)."
useCase: "Load this lens for Spanish-language text. Combine with the General Purpose lens when documents are bilingual (English headers, Spanish narrative, common in US healthcare and immigration contexts)."
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

PII in Spanish-language text, including:

- **Person names**: Spanish naming conventions (often two given names, two surnames). Pattern-matching that's tuned for general English NER misses many Spanish names entirely.
- **Locations and organizations**: Spanish address formats (`Calle Mayor, 14, 3º A, 28013 Madrid`), Latin American conventions (street numbers after street names), municipality and province names.
- **DNI**: Spanish national identity document, format `12345678A`.
- **NIE**: Foreign-resident identifier in Spain, format `X1234567A`.
- **CIF**: Spanish business tax ID, format `A12345678`.
- **Phone numbers**: Spanish (`+34`), Mexican (`+52`), and other Spanish-speaking-country phone formats.
- **Addresses**: Spanish-language address conventions.

## When to use this

- **Healthcare encounters with Spanish-speaking patients** in the U.S.: many EHR systems carry chart notes in Spanish even when the rest of the record is in English. Load alongside Healthcare.
- **Spanish-language contact-center transcripts**: Spanish-speaking customer-service traffic in Latin American markets.
- **Documents from Spain, Mexico, Argentina, Colombia, Chile, Peru, Venezuela, and other Spanish-speaking jurisdictions.**
- **Bilingual document workflows**: combine with General Purpose so the lens stack handles both languages on the same documents.

## Known limitations

- **Spelling variants in Latin American Spanish** vs Iberian Spanish: coverage is broad but specific regional vocabulary in things like address tags may have lower recall.
- **Mixed-language sentences**: code-switching (English / Spanish in the same sentence, common in U.S. bilingual contexts) is detected acceptably but specialized prompts to the NLP model give better recall.
- **Diacritics matter.** Documents that have been stripped of accent marks (some legacy EHRs do this) reduce recall on named entities; the lens recognizes both forms but it's calibrated against well-formed text.
