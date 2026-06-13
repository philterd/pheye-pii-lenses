---
title: "Financial Identifiers"
slug: "financial-identifiers"
license: "Apache-2.0"
status: "available"
entities:
  - "PAN"
  - "ROUTING_NUMBER"
  - "ACCOUNT_NUMBER"
  - "SWIFT"
  - "IBAN"
  - "BROKERAGE_ACCOUNT"
languages: ["en"]
summary: "Financial-account-aware detection that validates structure before redacting: Luhn for cards, country-coded checksum for IBAN. Used in conjunction with the General Purpose or contact-center workloads."
useCase: "Load this lens on workloads where financial-account identifiers are the binding constraint: payment-system pipelines, contact-center transcripts, broker-dealer communications. The structural validation reduces false positives on order IDs and tracking numbers."
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

Six entity classes tightly scoped to financial-account identifiers, all of which carry a structural validation step before being labeled as PII:

- **PAN (Primary Account Number)**: credit / debit card numbers, 13-19 digits, validated against the Luhn checksum. Cards that don't pass Luhn are not flagged as PAN, reducing false positives on order IDs, tracking numbers, and reference codes that happen to be the same length.
- **Routing numbers**: ABA routing transit numbers, 9 digits, validated against the standard ABA checksum.
- **Account numbers**: generic checking / savings / credit-card account numbers in common formats; the lens picks up contextual cues (`account #`, `acct:`, etc.) rather than relying on pattern alone.
- **SWIFT codes**: Bank Identifier Codes, 8 or 11 alphanumeric characters in the ISO 9362 format.
- **IBAN**: International Bank Account Numbers, country-coded format with MOD-97 checksum validation.
- **Brokerage account numbers**: broker-dealer account formats (Fidelity, Schwab, Vanguard, IBKR conventions).

The structural validation is the differentiator. A regex that flags "any 16-digit sequence" generates too many false positives in practice; a Luhn-validated PAN detection is precise enough for production use.

## When to use this

- **Payment-system pipelines**: pre-process logs, message bodies, and audit records before they land in non-PCI systems.
- **Contact-center transcripts**: spoken card numbers in customer-service calls are the canonical PCI-scope-reduction use case. Pair with the call-recording transcript policy.
- **Broker-dealer communications**: FINRA-regulated correspondence with brokerage-account references.
- **Compliance-driven analytics warehouses**: redact financial-account fields before warehouse load to keep the warehouse out of PCI / GLBA scope.

## Known limitations

- **PAN validation is structural, not biographical.** A Luhn-valid PAN may be a real card or a test card; the lens treats both as PAN. Test-data patterns can be filtered out in the policy layer.
- **Account-number contextual cues are English-language.** For Spanish, French, German, or Portuguese contexts (e.g., `cuenta n°`, `numéro de compte`), load the corresponding language lens alongside.
- **Country-specific routing schemes** outside the U.S. (e.g., U.K. sort codes, Canadian transit numbers, India IFSC) are recognized as generic identifiers but not typed specifically; a custom-identifier regex in the policy layer is the path for those.
