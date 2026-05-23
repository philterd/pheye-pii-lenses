---
title: "French PII"
slug: "french-pii"
license: "Apache-2.0"
status: "available"
entities:
  - "PERSON"
  - "LOCATION"
  - "ORG"
  - "INSEE"
  - "SIREN"
  - "SIRET"
  - "PHONE"
  - "ADDRESS"
languages: ["fr"]
summary: "French-language PII detection for documents from France, Belgium, Quebec, and other Francophone jurisdictions — including INSEE, SIREN, and SIRET identifiers."
useCase: "Load this lens for French-language text. Common combinations: General Purpose for bilingual documents, Healthcare for clinical-French notes."
author: "Philterd"
creator: "philterd"
version: "1.0.0"
updated: "2026-05-22"
pheyeCompatibility: ">=1.0.0"
modelSize: "190 MB"
pairsWith: ["general-purpose", "healthcare"]
---

## What this lens detects

PII in French-language text, including:

- **Person names** — French naming conventions (single given name common, particle-prefixed surnames such as `de la Tour`).
- **Locations and organizations** — French postal address format (`14 rue de la Paix, 75002 Paris`), Belgian and Quebec address conventions.
- **INSEE numbers** — French national identifier (`numéro de Sécurité sociale`), 13-digit format with checksum.
- **SIREN** — 9-digit business identifier.
- **SIRET** — 14-digit establishment identifier (SIREN + 5-digit NIC).
- **Phone numbers** — French (`+33`), Belgian (`+32`), Swiss (`+41`), Canadian (`+1`) formats.
- **Addresses** — French-language address conventions.

## When to use this

- **Documents from France, Belgium, Switzerland (French regions), Quebec, Luxembourg**, and other Francophone jurisdictions.
- **Bilingual environments** — combine with General Purpose for English / French mixed documents (common in Canadian government, EU institutional, multinational HR records).
- **GDPR-driven workflows.** French data-protection enforcement (CNIL) is among the most active in the EU; data residency and minimization are first-order constraints. Self-hosted detection with this lens addresses both.

## Known limitations

- **Quebec French vs Iberian French** — coverage is broad on shared vocabulary; specific Quebec institutional vocabulary (e.g., RAMQ for the public health-insurance ID) has partial coverage. RAMQ specifically is recognized but the lens labels it as a generic `IDENTIFIER` rather than a typed entity.
- **African Francophone variants** — trained primarily on European and Quebec corpora; coverage on Maghreb / West African French text is functional but less calibrated.
- **Diacritics.** Accent marks matter for many French entities; documents that have been stripped of diacritics get reduced recall.
