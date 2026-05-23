---
title: "Portuguese PII"
slug: "portuguese-pii"
license: "Apache-2.0"
status: "available"
entities:
  - "PERSON"
  - "LOCATION"
  - "ORG"
  - "CPF"
  - "CNPJ"
  - "PHONE"
  - "ADDRESS"
languages: ["pt"]
summary: "Portuguese-language PII detection covering Brazilian and Portuguese conventions, including CPF and CNPJ tax identifiers."
useCase: "Load this lens for Portuguese-language text. Brazilian fintech, healthcare, and contact-center workloads commonly pair it with General Purpose."
author: "Philterd"
creator: "philterd"
version: "1.0.0"
updated: "2026-05-22"
pheyeCompatibility: ">=1.0.0"
modelSize: "190 MB"
pairsWith: ["general-purpose", "healthcare"]
---

## What this lens detects

PII in Portuguese-language text, including:

- **Person names** — Brazilian and Portuguese naming conventions (often multiple surnames including a mother's family name).
- **Locations and organizations** — Brazilian and Portuguese address formats and city / state / district names.
- **CPF** — Brazilian individual taxpayer identifier, format `123.456.789-09` (11 digits with checksum).
- **CNPJ** — Brazilian business identifier, format `12.345.678/0001-99` (14 digits with checksum).
- **Phone numbers** — Brazilian (`+55`), Portuguese (`+351`), and other Lusophone phone formats.
- **Addresses** — Portuguese-language address conventions including CEP (Brazilian postal code) patterns.

## When to use this

- **Documents from Brazil, Portugal, Angola, Mozambique**, and other Lusophone jurisdictions.
- **Brazilian fintech** — CPF / CNPJ are the binding identifiers in most financial workflows; recognizing them with checksum validation reduces both false positives and missed detections.
- **LGPD-driven workflows.** Brazil's data-protection law mirrors many GDPR principles; the lens supports the self-hosted detection posture that compliance requires.
- **Bilingual / multilingual environments** — combine with General Purpose for English / Portuguese mixed documents.

## Known limitations

- **Brazilian Portuguese vs European Portuguese.** The two variants share most vocabulary but diverge on some entity-typical phrasing. The lens is trained primarily on Brazilian Portuguese; European Portuguese gets functional but slightly reduced recall.
- **African Portuguese variants** — coverage is functional but not specifically calibrated for African Portuguese institutional vocabulary.
- **CPF / CNPJ checksum validation** is performed by the lens at recognition time; well-formed-but-fake numbers (e.g., test fixtures all zeros) are correctly recognized as PII even when they fail checksum, but the policy layer is the right place to filter test-data patterns if that matters.
