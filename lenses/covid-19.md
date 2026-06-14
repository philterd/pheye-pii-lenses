---
title: "COVID-19"
slug: "covid-19"
license: "Apache-2.0"
status: "available"
entities:
  - "PERSON"
languages: ["en"]
summary: "Person-name detection tuned for documents primarily about COVID-19, where pandemic vocabulary (variants, vaccine manufacturers, treatments) creates name-like distractors that general models mistag. Improves name F1 on COVID-era text."
useCase: "Load this lens for person-name detection in documents primarily about COVID-19: patient records, vaccination records, contact-tracing notes, and pandemic-era clinical text. It is tuned to keep precision high where COVID vocabulary (variant names, vaccine manufacturers, treatments, place names) would otherwise be mistaken for people's names."
author: "Philterd"
creator: "philterd"
provenance: "Philterd"
version: "1.0.0"
updated: "2026-06-14"
pheyeCompatibility: ">=1.0.0"
modelSize: "75 MB"
pairsWith: ["healthcare", "hospital"]
---

## What this lens detects

A single entity class:

- **PERSON**: people's names (patients, clinicians, family members) as they appear in documents that are primarily about COVID-19.

This is a name detector. It does not detect test results, variants, vaccine identifiers, or other PHI; load it alongside the [Healthcare](/lenses/healthcare/) and [Hospital](/lenses/hospital/) lenses for the rest of the PHI set.

## Why a COVID-specific name lens

Names are written the same everywhere, but COVID-19 documents are unusually dense with **name-like non-names**: variant designations (Alpha, Delta, Omicron), vaccine manufacturers (Pfizer, Moderna), treatments (Paxlovid), and place names (Wuhan). A general-purpose name model tends to false-positive on these, mistagging pandemic vocabulary as people's names. This lens is tuned on COVID-primary text so it keeps those distractors out of its PERSON predictions, raising precision and overall name F1 on pandemic-era documents without losing recall on the real names.

## When to use this

- **COVID-era patient records and clinical notes** where accurate name redaction is the goal.
- **Vaccination records and contact-tracing notes** that pair personal names with heavy pandemic vocabulary.
- **Post-COVID research corpora** containing personal data alongside variant and treatment terminology.

For documents that are only incidentally about COVID-19, the General Purpose or English Medical name detectors are usually sufficient; reach for this lens when COVID vocabulary is pervasive enough to confuse a general model.

## Known limitations

- **Names only.** This lens does not detect dates, identifiers, addresses, or other PHI; compose it with other lenses for full coverage.
- **English only.** For other languages, load the corresponding language lens.
- **Tuned for COVID-primary text.** Its advantage is specific to documents where pandemic vocabulary is pervasive; on general text it offers no benefit over the General Purpose name detector.
