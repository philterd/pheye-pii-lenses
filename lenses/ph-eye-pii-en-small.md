---
title: "English Names (Small)"
slug: "ph-eye-pii-en-small"
license: "CC-BY-4.0"
status: "available"
entities:
  - "PERSON"
languages: ["en"]
summary: "Low-latency English person-name detector, fine-tuned from GLiNER small on NVIDIA Nemotron-PII. The on-device size in the ph-eye-pii-en family; Phileas handles structured identifiers via its pattern-based layer."
useCase: "Load this lens for fast, low-footprint person-name detection in English text, on a CPU or at the edge. It is a focused PERSON detector; emails, phone numbers, IDs, and other structured PII are handled by Phileas's pattern-based detection, not this model."
author: "Philterd"
creator: "philterd"
provenance: "Philterd"
hf_name: "philterd/ph-eye-pii-en-small"
hf_url: "https://huggingface.co/philterd/ph-eye-pii-en-small"
version: "1.0.0"
updated: "2026-06-17"
pheyeCompatibility: ">=1.0.0"
modelSize: "580 MB"
pairsWith: ["ph-eye-pii-en-medium", "ph-eye-pii-en-large"]
---
## What this lens detects

- **PERSON**: people's names as they appear in English text.

This is a name-only lens. Emails, phone numbers, SSNs, credit cards, IP addresses, and other structured PII follow regular patterns and are detected by Phileas's pattern-based (regex, checksum, and dictionary) layer, not by this model. Compose this lens with that layer for full coverage.

## Why this lens

This is the small, low-latency member of the `ph-eye-pii-en` family, fine-tuned from `urchade/gliner_small-v2.1` (DeBERTa-v3-small) on the synthetic `nvidia/Nemotron-PII` dataset. It is built for tight latency and footprint budgets: CPU-friendly inference and the smallest on-disk size of the three sizes. Like its siblings it is recall-leaning by design, since in redaction a missed name is a leak while an extra span is only over-redaction. A confidence threshold around **0.90** is a sensible starting operating point; lower it to push recall higher.

## When to use this

- On-device or edge deployments where latency and memory are constrained.
- High-throughput pipelines that run on CPU without a GPU.
- As the English name detector composed with Phileas's pattern-based detection for structured PII.

## Known limitations

- **Names only.** This lens detects PERSON. Other PII is handled by Phileas's pattern-based detection; compose accordingly.
- **English only.** For other languages, load the corresponding language lens when available.
- **Trained on synthetic data.** Reported accuracy is in-distribution on Nemotron-PII and is a ceiling, not a production guarantee; validate precision and recall on your own text. The model is recall-leaning, so expect some over-redaction and tune the threshold to your precision/recall balance.
- The underlying model is licensed CC-BY-4.0; the Nemotron-PII training data requires attribution to NVIDIA.
