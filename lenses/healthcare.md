---
title: "Healthcare"
slug: "healthcare"
license: "Apache-2.0"
status: "available"
entities:
  - "PERSON"
languages: ["en"]
summary: "Person-name detection tuned for clinical and medical text. Phileas handles MRNs, dates, medications, and other structured PHI via its pattern-based layer; this lens focuses on people's names."
useCase: "Load this lens for person-name detection in clinical and medical documents. It is a focused PERSON detector; MRNs, dates, medications, and other structured PHI are handled by Phileas's pattern-based detection, not this model."
author: "Philterd"
creator: "philterd"
provenance: "Philterd"
version: "1.0.0"
updated: "2026-05-22"
pheyeCompatibility: ">=1.0.0"
modelSize: "210 MB"
pairsWith: ["general-purpose", "hospital", "covid-19"]
---
## What this lens detects

- **PERSON**: people's names as they appear in clinical and medical text.

This is a name-only lens. MRNs, dates, medications, and other structured PHI are detected by Phileas's pattern-based (regex and validation) layer, not by this model. Compose this lens with that layer for full coverage.

## Why this lens

Clinical text is dense with medical vocabulary (drug names, conditions, abbreviations) that a general model can confuse with people's names. This lens is tuned to find patient, clinician, and family names accurately in that context, raising precision on clinical documents.

## When to use this

- Clinical notes, referrals, and discharge summaries.
- Healthcare correspondence and patient communications.
- Any clinical workflow where accurate name redaction is the goal.

## Known limitations

- **Names only.** This lens detects PERSON. Other PII is handled by Phileas's pattern-based detection; compose accordingly.
- **English only. Names only; other PHI is handled by Phileas and other lenses.**
