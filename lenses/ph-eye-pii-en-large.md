---
title: "English Names (Large)"
slug: "ph-eye-pii-en-large"
license: "CC-BY-4.0"
status: "available"
entities:
  - "PERSON"
languages: ["en"]
summary: "Highest-capacity English person-name detector, fine-tuned from GLiNER large on NVIDIA Nemotron-PII. The server-side size in the ph-eye-pii-en family; Phileas handles structured identifiers via its pattern-based layer."
useCase: "Load this lens for English person-name detection when accuracy matters most and you can spend the compute. It is the highest-capacity size, best suited to GPU-backed server-side use, and a focused PERSON detector; emails, phone numbers, IDs, and other structured PII are handled by Phileas's pattern-based detection, not this model."
author: "Philterd"
creator: "philterd"
provenance: "Philterd"
hf_name: "philterd/ph-eye-pii-en-large"
hf_url: "https://huggingface.co/philterd/ph-eye-pii-en-large"
version: "1.0.0"
updated: "2026-06-17"
pheyeCompatibility: ">=1.0.0"
modelSize: "1.7 GB"
pairsWith: ["ph-eye-pii-en-small", "ph-eye-pii-en-medium"]
---
## What this lens detects

- **PERSON**: people's names as they appear in English text.

This is a name-only lens. Emails, phone numbers, SSNs, credit cards, IP addresses, and other structured PII follow regular patterns and are detected by Phileas's pattern-based (regex, checksum, and dictionary) layer, not by this model. Compose this lens with that layer for full coverage.

## Why this lens

This is the highest-capacity member of the `ph-eye-pii-en` family, fine-tuned from `urchade/gliner_large-v2.1` (DeBERTa-v3-large) on the synthetic `nvidia/Nemotron-PII` dataset. It is built for server-side use where accuracy is the priority and a GPU is available. Like its siblings it is recall-leaning by design, since in redaction a missed name is a leak while an extra span is only over-redaction. This model calibrates its confidence higher than the smaller sizes, so a threshold around **0.95** is the recommended operating point; lower it to push recall higher.

## When to use this

- Server-side, GPU-backed pipelines where accuracy outweighs latency and footprint.
- Workloads with harder or more varied name forms than the smaller sizes handle well.
- As the English name detector composed with Phileas's pattern-based detection for structured PII.

## Known limitations

- **Names only.** This lens detects PERSON. Other PII is handled by Phileas's pattern-based detection; compose accordingly.
- **English only.** For other languages, load the corresponding language lens when available.
- **Largest size.** Higher memory and latency needs than the small and medium lenses; size it to your serving budget. Run it at its recommended threshold (around 0.95): at lower thresholds its precision drops sharply.
- **Trained on synthetic data.** Reported accuracy is in-distribution on Nemotron-PII and is a ceiling, not a production guarantee; validate precision and recall on your own text. The model is recall-leaning, so expect some over-redaction and tune the threshold to your precision/recall balance.
- The underlying model is licensed CC-BY-4.0; the Nemotron-PII training data requires attribution to NVIDIA.
