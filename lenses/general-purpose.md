---
title: "General Purpose"
slug: "general-purpose"
license: "Apache-2.0"
status: "available"
entities:
  - "PERSON"
  - "LOCATION"
  - "ORG"
  - "DATE"
  - "PHONE"
  - "EMAIL"
  - "URL"
  - "SSN"
languages: ["en"]
summary: "Broad PII baseline for documents that don't fit a specific domain: customer-support tickets, internal correspondence, generic business records. The default lens loaded by PhEye when no other is specified."
useCase: "Load this lens when the document mix is heterogeneous or when you don't yet know which specialized lens fits the workload. It's the floor for PII detection across the toolkit."
author: "Philterd"
creator: "philterd"
provenance: "Philterd"
hf_name: "philterd/ph-eye-pii-base"
hf_url: "https://huggingface.co/philterd/ph-eye-pii-base"
version: "1.0.0"
updated: "2026-05-22"
pheyeCompatibility: ">=1.0.0"
modelSize: "180 MB"
---

## What this lens detects

Eight high-confidence entity classes that cover the vast majority of PII surface in generic business text: people's names, location mentions, organization names, dates, phone numbers, email addresses, URLs, and SSN-shaped numeric sequences.

This is the **default lens**. If PhEye is started without an explicit lens configuration, this is the lens that loads.

## When to use this

- Customer-support tickets, internal correspondence, generic business records.
- As the **baseline** in a multi-lens configuration: load General Purpose plus one or more specialized lenses, and the policy engine merges the detections.
- When you don't yet know which specialized lens fits your data: start here, measure recall against a labeled sample with [Philter Scope](/philter-scope/), then add specialized lenses where General Purpose is weakest.

## Known limitations

- **Domain entities are out of scope.** Hospital names, medication mentions, case numbers, financial-account-specific patterns, foreign-language identifiers. General Purpose either misses these entirely or labels them as the closest generic class (e.g., a hospital name might come back as `LOCATION` instead of `HOSPITAL`).
- **Single-language by design.** Trained on English. Documents in other languages get poor recall. Load a language-specific lens alongside (Spanish PII, French PII, etc.) for non-English text.
- **SSN-shaped, not SSN-validated.** The lens flags 9-digit sequences in SSN format; downstream validation (area-number ranges, group-number checks) belongs in the policy layer.
