---
title: "Hospital Identifiers"
slug: "hospital-identifiers"
license: "Apache-2.0"
status: "available"
entities:
  - "HOSPITAL"
  - "CLINIC"
  - "DEPARTMENT"
  - "ROOM_NUMBER"
  - "BED_IDENTIFIER"
  - "WARD"
languages: ["en"]
summary: "Narrower healthcare-adjacent lens for environments where hospital and room identifiers are the binding constraint — bed-management systems, patient-flow analytics, discharge planning tools."
useCase: "Load this lens when room numbers, bed identifiers, and ward designations need to be recognized as distinct entities — typically alongside the broader Healthcare lens, not in place of it."
author: "Philterd"
creator: "philterd"
version: "1.0.0"
updated: "2026-05-22"
pheyeCompatibility: ">=1.0.0"
modelSize: "95 MB"
pairsWith: ["healthcare", "general-purpose"]
---

## What this lens detects

Six entity classes tightly scoped to the physical / organizational topology of a healthcare facility:

- **Hospital names** — full institutional names plus the common-usage shorthand (`Mercy`, `St. Luke's North`).
- **Clinic names** — outpatient clinics, urgent-care branches, specialty practices affiliated with a hospital.
- **Department names** — `Cardiology`, `ED`, `OR`, `ICU`, etc., as contextual labels.
- **Room numbers** — `Room 412`, `412B`, `4-North-22`, the variations real hospitals use.
- **Bed identifiers** — bed-level identifiers used by bed-management systems.
- **Ward designations** — ward / unit / floor-level designations distinct from individual rooms.

This is a *narrower* lens than Healthcare. It doesn't try to find providers, medications, or symptoms — just the spatial / organizational identifiers. Load it **in addition to** Healthcare when those identifiers are the binding constraint of your workload.

## When to use this

- **Bed-management and patient-flow analytics** — the analytics pipeline needs room and ward identifiers redacted before landing in the warehouse.
- **Discharge-planning and care-coordination tools** — outbound messages to home-health agencies, transportation services, or family members should not carry room and bed identifiers.
- **Hospital security and incident reporting** — incident reports often mention exact location; redaction-by-room avoids re-identifying patients via location.
- **Operations-research data sharing** — sharing operational data with academic partners or vendors for capacity-planning research; room and ward identifiers are quasi-identifiers under the HIPAA Safe Harbor "addresses" clause.

Always combine with **Healthcare** for full clinical-text coverage.

## Known limitations

- **Numeric overlap.** Room number patterns (3-4 digits, sometimes with letter suffixes) overlap with other numeric sequences in clinical text. The lens uses surrounding context to disambiguate; recall against a labeled corpus is still the calibration step.
- **Institution-specific room schemes.** Some hospitals use highly idiosyncratic room-numbering (`4-NW-22b-1`); coverage is good on the common patterns and degrades on the unusual ones. Add a custom-identifier regex in the policy layer for the institution-specific scheme.
- **English-only.** Bilingual hospital signage / chart notation isn't trained.
