---
title: "German PII"
slug: "german-pii"
status: "available"
entities:
  - "PERSON"
  - "LOCATION"
  - "ORG"
  - "STEUER_ID"
  - "PERSONALAUSWEIS"
  - "PHONE"
  - "ADDRESS"
languages: ["de"]
summary: "German-language PII detection for documents from Germany, Austria, and Switzerland — including Steuer-ID and Personalausweis identifiers."
useCase: "Load this lens for German-language text. Healthcare and contact-center workloads in DACH markets typically pair it with General Purpose and the domain-specific lens."
author: "Philterd"
creator: "philterd"
version: "1.0.0"
updated: "2026-05-22"
pheyeCompatibility: ">=1.0.0"
modelSize: "195 MB"
pairsWith: ["general-purpose", "healthcare"]
---

## What this lens detects

PII in German-language text, including:

- **Person names** — German, Austrian, and Swiss-German naming conventions including von-prefixed surnames and umlaut variants.
- **Locations and organizations** — German address format (`Hauptstraße 12, 80331 München`), Austrian and Swiss-German address conventions.
- **Steuer-ID** — German tax identifier, 11 digits.
- **Personalausweis** — German national ID card number, 9 alphanumeric characters with checksum.
- **Phone numbers** — German (`+49`), Austrian (`+43`), Swiss (`+41`) phone formats.
- **Addresses** — German-language address conventions including PLZ (postal code) patterns.

## When to use this

- **Documents from Germany, Austria, Switzerland (German regions), Liechtenstein**.
- **DACH healthcare** — clinical text in German; combine with the Healthcare lens for the broader clinical vocabulary.
- **DSGVO-driven workflows.** Germany's data-protection enforcement is strict; data minimization with self-hosted detection is the standard pattern. The lens supports the GDPR / DSGVO compliance posture.
- **Bilingual environments** — combine with General Purpose for English / German mixed documents (common in multinational enterprise records).

## Known limitations

- **Umlaut handling.** Documents that have been transliterated (`ä` → `ae`, `ö` → `oe`) get reduced recall — the lens recognizes both forms but is calibrated against well-formed text.
- **Swiss-German dialect.** Written text in Swiss-German dialect (uncommon in formal documents but appears in informal correspondence) has lower recall than High German.
- **Austrian-specific identifiers** (such as the Sozialversicherungsnummer) are recognized as generic identifiers; specific Austrian / Swiss-specific structured identifiers may benefit from a custom-identifier regex in the policy layer.
