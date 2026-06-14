---
title: "Financial"
slug: "financial"
license: "Apache-2.0"
status: "available"
entities:
  - "PERSON"
languages: ["en"]
summary: "Person-name detection tuned for financial text. Phileas handles card numbers (PAN), IBANs, SWIFT codes, and routing and account numbers via its pattern-based layer; this lens focuses on people's names."
useCase: "Load this lens for person-name detection in financial documents. It is a focused PERSON detector; card numbers (PAN), IBANs, SWIFT codes, and routing and account numbers are handled by Phileas's pattern-based detection, not this model."
author: "Philterd"
creator: "philterd"
provenance: "Philterd"
version: "1.0.0"
updated: "2026-05-22"
pheyeCompatibility: ">=1.0.0"
modelSize: "100 MB"
pairsWith: ["general-purpose"]
---
## What this lens detects

- **PERSON**: people's names as they appear in financial text.

This is a name-only lens. Card numbers (PAN), IBANs, SWIFT codes, and routing and account numbers are detected by Phileas's pattern-based (regex and validation) layer, not by this model. Compose this lens with that layer for full coverage.

## Why this lens

Financial documents are dense with long alphanumeric identifiers and institution names that a general model can mistake for people's names. This lens is tuned for name precision amid those distractors; Phileas detects and validates the identifiers themselves.

## When to use this

- Account statements, applications, and transaction records.
- Payment-system pipelines and broker-dealer communications.
- KYC and onboarding files.

## Known limitations

- **Names only.** This lens detects PERSON. Other PII is handled by Phileas's pattern-based detection; compose accordingly.
- **English only. Names only; financial identifiers are detected by Phileas, not this model.**
