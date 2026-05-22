---
title: "COVID-19"
slug: "covid-19"
status: "available"
entities:
  - "TEST_RESULT"
  - "VACCINE_BATCH"
  - "VARIANT"
  - "PANDEMIC_CLINICAL_TERM"
languages: ["en"]
summary: "Pandemic-era documents have a vocabulary that pre-2020 healthcare models don't fully cover. Use this lens alongside Healthcare for clinical text from 2020-onward."
useCase: "Add this lens when the corpus contains COVID-era clinical text — test results, vaccination records, variant mentions, pandemic-specific clinical references."
author: "Philterd"
creator: "philterd"
version: "1.0.0"
updated: "2026-05-22"
pheyeCompatibility: ">=1.0.0"
modelSize: "75 MB"
pairsWith: ["healthcare", "hospital-identifiers"]
---

## What this lens detects

Four entity classes specific to pandemic-era clinical text:

- **Test result terminology** — `SARS-CoV-2 positive`, `antigen-negative`, `PCR confirmed`, `rapid test negative`, etc. The vocabulary was barely-existent in pre-2020 clinical corpora and a Healthcare-lens-trained-on-2018-data misses most of it.
- **Vaccine batch identifiers** — lot numbers, batch codes, manufacturer-specific identifiers from the Pfizer / Moderna / J&amp;J / AstraZeneca campaigns.
- **Variant names** — Alpha, Beta, Gamma, Delta, Omicron, BA.5, JN.1, etc., as named entities. (Useful where variant identification is part of the clinical context.)
- **Pandemic-specific clinical terms** — `monoclonal antibody`, `convalescent plasma`, `Paxlovid`, terms that entered routine clinical vocabulary during the pandemic.

This is a **supplemental lens**. It doesn't try to detect generic clinical entities — load it alongside the Healthcare lens, which handles the broader clinical vocabulary.

## When to use this

- **Clinical text from 2020-onward** that touches respiratory illness, vaccination, or infectious-disease workflow.
- **Vaccination-record processing** for compliance, employer attestation, or research.
- **Post-COVID research corpora** where the variant and treatment vocabulary needs to be preserved structurally (and redacted, if appropriate).

## Known limitations

- **Vocabulary drift.** The COVID clinical vocabulary continues to evolve (new variants, new treatments, new test types). The lens is versioned; future versions will track the evolution.
- **Distinguishes COVID-era PHI but not COVID-era diagnoses.** This is a *PII lens*, not a clinical-coding tool. It finds entities to redact; it doesn't categorize them as protected vs unprotected — that's the policy engine's job.
