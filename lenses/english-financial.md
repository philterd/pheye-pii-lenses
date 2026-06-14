---
title: "English Financial (Names)"
slug: "english-financial"
license: "CC-BY-4.0"
status: "coming-soon"
entities:
  - "PERSON"
languages: ["en"]
summary: "Person-name detection tuned for English financial documents such as statements, applications, KYC files, and transaction records. Load alongside Financial Identifiers for account-number coverage."
useCase: "Load this lens on English financial-services workloads where the binding need is catching customer and counterparty names in account statements, loan and account applications, KYC and onboarding files, and transaction records. It is a focused name detector, so pair it with Financial Identifiers (account numbers, PAN, IBAN) and, where helpful, the General Purpose lens."
author: "Philterd"
creator: "philterd"
provenance: "Philterd"
version: "0.1.0"
updated: "2026-06-14"
pheyeCompatibility: ">=1.0.0"
pairsWith: ["general-purpose", "financial-identifiers"]
---

## What this lens detects

A single entity class, scoped tightly to one job done well:

- **PERSON**: people's names (customers, counterparties, signatories, beneficiaries) as they appear in English financial documents.

It is deliberately a name-only lens. Account-level identifiers (card numbers, IBAN, routing and account numbers) are the job of the [Financial Identifiers](/lenses/financial-identifiers/) lens, which loads alongside this one and merges its detections.

## When to use this

- **Account statements and transaction records**: redact account-holder and counterparty names before analytics or non-production use.
- **Loan and account applications, KYC and onboarding files**: scrub applicant and related-party names from documents that move between systems.
- **Financial contact-center and correspondence**: catch names in customer communications, paired with the relevant policy.

Load it with Financial Identifiers for names plus account identifiers, and with the General Purpose lens where documents stray outside the financial domain.

## Training notes

- Trained by Philterd on the financial-domain subset of [NVIDIA Nemotron-PII](https://huggingface.co/datasets/nvidia/Nemotron-PII) (CC-BY-4.0), with first-name and last-name spans merged to a single PERSON label.
- The underlying model and this lens are CC-BY-4.0; attribution to NVIDIA is required.
- Intended backing model: `philterd/ph-eye-pii-en-financial` (published when the lens moves from coming-soon to available).

## Known limitations

- **Names only.** This lens does not detect account numbers, addresses, dates, or other PII; compose it with other lenses for full coverage.
- **English only.** For other languages, load the corresponding language lens.
- **Trained on synthetic financial text.** Real-document performance should be validated on your own data before production use; per-document evaluation numbers are published when the lens reaches available status.
