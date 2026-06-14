---
title: "Hospital Identifiers"
slug: "hospital-identifiers"
license: "Apache-2.0"
status: "available"
entities:
  - "PERSON"
languages: ["en"]
summary: "Person-name detection tuned for hospital and clinical-operations text. Phileas handles MRNs, room, bed, and ward identifiers, and facility codes via its pattern-based layer; this lens focuses on people's names."
useCase: "Load this lens for person-name detection in hospital and clinical-operations documents. It is a focused PERSON detector; MRNs, room, bed, and ward identifiers, and facility codes are handled by Phileas's pattern-based detection, not this model."
author: "Philterd"
creator: "philterd"
provenance: "Philterd"
version: "1.0.0"
updated: "2026-05-22"
pheyeCompatibility: ">=1.0.0"
modelSize: "95 MB"
pairsWith: ["healthcare", "general-purpose"]
---
## What this lens detects

- **PERSON**: people's names as they appear in hospital and clinical-operations text.

This is a name-only lens. MRNs, room, bed, and ward identifiers, and facility codes are detected by Phileas's pattern-based (regex and validation) layer, not by this model. Compose this lens with that layer for full coverage.

## Why this lens

Clinical-operations documents are full of facility codes, room and ward identifiers, and department names that look name-like to a general model. This lens is tuned to keep staff and patient names precise amid those distractors; Phileas detects the identifiers.

## When to use this

- Admissions, transfer, and bed-management records.
- Facility and department operational documents.
- Clinical logistics text where names appear beside facility codes.

## Known limitations

- **Names only.** This lens detects PERSON. Other PII is handled by Phileas's pattern-based detection; compose accordingly.
- **English only. Names only; hospital identifiers are detected by Phileas, not this model.**
