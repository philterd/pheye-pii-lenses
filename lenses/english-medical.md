---
title: "English Medical (Names)"
slug: "english-medical"
license: "CC-BY-4.0"
status: "coming-soon"
entities:
  - "PERSON"
languages: ["en"]
summary: "Person-name detection tuned for English medical and clinical text such as notes, referrals, and patient correspondence. Load alongside the Healthcare and Hospital Identifiers lenses for full PHI coverage."
useCase: "Load this lens on English clinical and healthcare workloads where the binding need is catching patient, clinician, and family-member names in clinical notes, referrals, discharge summaries, and patient correspondence. It is a focused name detector, so compose it with the Healthcare and Hospital Identifiers lenses, which cover the other PHI classes."
author: "Philterd"
creator: "philterd"
provenance: "Philterd"
version: "0.1.0"
updated: "2026-06-14"
pheyeCompatibility: ">=1.0.0"
pairsWith: ["general-purpose", "healthcare", "hospital-identifiers"]
---

## What this lens detects

A single entity class, scoped tightly to one job done well:

- **PERSON**: people's names (patients, clinicians, family members, signatories) as they appear in English medical and clinical text.

It is deliberately a name-only lens. Other PHI classes (medical record numbers, hospital identifiers, dates, contact details) are the job of the [Healthcare](/lenses/healthcare/) and [Hospital Identifiers](/lenses/hospital-identifiers/) lenses, which load alongside this one and merge their detections.

## When to use this

- **Clinical notes and discharge summaries**: redact patient and clinician names before secondary use, analytics, or model training.
- **Referrals and correspondence**: scrub names from documents that move between providers or systems.
- **Healthcare contact-center and patient communications**: catch names in inbound and outbound messages.

Load it with Healthcare and Hospital Identifiers for names plus the rest of the PHI set, and with the General Purpose lens where documents stray outside the clinical domain.

## Training notes

- Trained by Philterd on the medical-domain subset of [NVIDIA Nemotron-PII](https://huggingface.co/datasets/nvidia/Nemotron-PII) (CC-BY-4.0), with first-name and last-name spans merged to a single PERSON label.
- The underlying model and this lens are CC-BY-4.0; attribution to NVIDIA is required.
- Intended backing model: `philterd/ph-eye-pii-en-medical` (published when the lens moves from coming-soon to available).

## Known limitations

- **Trained on synthetic clinical text.** Real clinical notes are idiosyncratic (abbreviations, dictation artifacts, names in headers and family-history sections), so the synthetic-trained lens is a starting point. A production-grade clinical lens needs real de-identification data (for example n2c2 2014 via Harvard DBMI under a data-use agreement), which carries its own redistribution constraints. Per-document evaluation numbers are published when the lens reaches available status.
- **Names only.** This lens does not detect medical record numbers, dates, addresses, or other PHI; compose it with other lenses for full coverage.
- **English only.** For other languages, load the corresponding language lens.
