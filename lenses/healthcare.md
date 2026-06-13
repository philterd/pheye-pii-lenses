---
title: "Healthcare"
slug: "healthcare"
license: "Apache-2.0"
status: "available"
entities:
  - "PERSON"
  - "PROVIDER"
  - "HOSPITAL"
  - "MEDICATION"
  - "DOSE_UNIT"
  - "SYMPTOM"
  - "CLINICAL_ABBREVIATION"
  - "MRN"
  - "DATE"
languages: ["en"]
summary: "Clinical-text lens trained for entities that matter in EHR exports, clinical notes, discharge summaries, and medical-chatbot transcripts: higher recall than general NER on the healthcare-specific surface."
useCase: "Load this lens on any clinical text workload. It pairs with the HIPAA Safe Harbor policy and is usually combined with the General Purpose lens for full coverage."
author: "Philterd"
creator: "philterd"
provenance: "Philterd"
version: "1.0.0"
updated: "2026-05-22"
pheyeCompatibility: ">=1.0.0"
modelSize: "210 MB"
pairsWith: ["general-purpose", "hospital-identifiers", "covid-19"]
---

## What this lens detects

Trained on clinical text. Higher recall on the entities a general NER model silently misses in clinical contexts:

- **Provider names**: physicians, nurses, specialists. Distinct from generic `PERSON` because the policy engine may treat providers differently from patients.
- **Hospital and clinic names**: including the long-tail of regional and specialty facilities general NER labels as `LOCATION`.
- **Medication mentions**: branded and generic drug names, including the inflected forms common in dictated notes.
- **Dose units**: `mg`, `mcg`, `mL`, `units`, etc., where the surrounding number is potentially HIPAA-protected.
- **Symptom and condition mentions**: context the policy engine often wants to preserve (clinical meaning) while stripping the identifying surface around it.
- **Clinical abbreviations**: the dictated-shorthand vocabulary (`pt`, `c/o`, `s/p`, `r/o`) general models don't recognize as clinical entities.
- **Medical record numbers (MRNs)**: institution-specific patterns; the lens picks up the contextual cue, the policy layer's custom-identifier regex catches the specific format.
- **Dates**: high-precision date-mention recognition with context awareness (admission, discharge, date of birth, etc.).

## When to use this

- **EHR exports**: clinical notes, discharge summaries, problem lists, allergy lists.
- **Patient-portal messages**: secure-message threads between patient and provider.
- **Medical-chatbot transcripts**: symptom checkers, post-discharge follow-up, medication reminders.
- **Claims data with clinical narrative fields**: the narrative columns most claims systems carry alongside the structured codes.
- **Clinical research corpora**: de-identifying research data sets before sharing with statisticians or academic partners.

Pairs naturally with:

- **Hospital Identifiers**: when room numbers, bed identifiers, and ward designations matter as separate entities from facility names.
- **COVID-19**: for pandemic-era documents with vaccine, variant, and test-result vocabulary.
- **Spanish PII / multilingual lenses**: for bilingual clinical environments.

## Known limitations

- **English-only.** Spanish or other non-English clinical text needs a language-specific lens loaded alongside.
- **Audio-transcript artifacts.** Speech-to-text errors in dictated notes (misrecognized provider names, drug names, dose units) reduce recall; the lens is no better than the upstream STT quality.
- **Highly specialized subdomains** (oncology drug regimens, rare-disease nomenclature, surgical procedure codes) get partial coverage. For those, custom-lens training against your corpus is the path.
