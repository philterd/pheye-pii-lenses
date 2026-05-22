---
title: "Legal Identifiers"
slug: "legal-identifiers"
status: "available"
entities:
  - "CASE_NUMBER"
  - "DOCKET_NUMBER"
  - "BAR_NUMBER"
  - "BATES_NUMBER"
  - "PARTY_ROLE"
  - "COURT"
languages: ["en"]
summary: "Specialized for legal-document workflows where case-management identifiers and Bates-style productions need to be recognized alongside the standard PII set."
useCase: "Load this lens on legal-document workloads — court filings, e-discovery productions, attorney-correspondence redaction. Combine with the General Purpose lens for the broader PII surface."
author: "Philterd"
creator: "philterd"
version: "1.0.0"
updated: "2026-05-22"
pheyeCompatibility: ">=1.0.0"
modelSize: "85 MB"
pairsWith: ["general-purpose"]
---

## What this lens detects

Six entity classes tightly scoped to legal-document workflows:

- **Case numbers** — court case identifiers in the many formats U.S. and other-jurisdiction courts use (`23-cv-04217`, `2024-CR-0119`, `1:23-cv-00045-RBW`, etc.).
- **Docket numbers** — docket entries with their reference numbers.
- **Bar numbers** — attorney bar registration numbers, often state-specific in format.
- **Bates numbers** — production identifiers in e-discovery (`PROD-000001`, `JONES-0042-0007`).
- **Party roles** — `Plaintiff`, `Defendant`, `Petitioner`, `Respondent`, `Movant` as contextual labels, used by the policy engine to decide what to redact.
- **Court names** — court-of-origin identification (`U.S. District Court for the Southern District of New York`, `Cook County Circuit Court`).

This is a **supplemental lens**. It doesn't try to detect generic PII — load it alongside the General Purpose lens, which handles the broader entity set.

## When to use this

- **E-discovery productions** — pre-process documents through Philter before the reviewer queue; Bates numbers and case numbers must be preserved correctly while everything else gets the redaction policy.
- **Court-filing preparation** — combine with the [FRBP 9037](https://www.philterd.ai/policies/legal/rule-9037-bankruptcy/) or [FRCP 5.2](https://www.philterd.ai/policies/legal/rule-5-2-federal-civil/) policies to get rule-of-court compliance with case-management identifier preservation.
- **Attorney-client correspondence** — when bar numbers and case numbers need to be recognized as identifiers (for redaction or for routing) but should not be flagged as PII to remove.
- **In-house legal workflow** — corporate legal departments preparing documents for filing or subpoena response.

## Known limitations

- **Jurisdiction variance.** The U.S. federal courts and state courts use different case-number formats; the lens covers the common patterns but a specific state's idiosyncratic format may need a custom-identifier regex in the policy layer.
- **Civil-law jurisdictions.** Trained primarily on U.S. and U.K. common-law document conventions. Civil-law jurisdictions (most of Europe and Latin America) have different document conventions; the lens is functional on those but specialized vocabulary may be missed.
- **PACER artifacts.** Some PACER-exported documents have running-header artifacts that confuse the lens; preprocessing to strip running headers improves precision.
