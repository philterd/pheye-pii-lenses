---
title: "English Names (Extra Small)"
slug: "ph-eye-pii-en-xsmall"
license: "CC-BY-4.0"
status: "available"
entities:
  - "PERSON"
languages: ["en"]
summary: "Ultra-light English person-name detector, fine-tuned from DeBERTa-v3-xsmall on NVIDIA Nemotron-PII. The smallest size in the ph-eye-pii-en family, for the most constrained on-device use; Phileas handles structured identifiers via its pattern-based layer."
useCase: "Load this lens for English person-name detection where footprint and latency matter most — edge, in-browser, or CPU at high throughput — and the small lens is still too heavy. It ships a quantized int8 ONNX graph and runs in-process. It is the lowest-capacity size, so real-text recall is lower than the larger sizes; prefer small/medium/large when your budget allows."
author: "Philterd"
creator: "philterd"
provenance: "Philterd"
hf_name: "philterd/ph-eye-pii-en-xsmall"
hf_url: "https://huggingface.co/philterd/ph-eye-pii-en-xsmall"
version: "1.0.0"
updated: "2026-06-18"
pheyeCompatibility: ">=1.0.0"
modelSize: "90 MB (int8 ONNX) / 294 MB (PyTorch)"
pairsWith: ["ph-eye-pii-en-small", "ph-eye-pii-en-medium", "ph-eye-pii-en-large"]
---
## What this lens detects

- **PERSON**: people's names as they appear in English text.

This is a name-only lens. Emails, phone numbers, SSNs, credit cards, IP addresses, and other structured PII follow regular patterns and are detected by Phileas's pattern-based (regex, checksum, and dictionary) layer, not by this model. Compose this lens with that layer for full coverage.

## Why this lens

This is the ultra-light member of the `ph-eye-pii-en` family, fine-tuned from `microsoft/deberta-v3-xsmall` (DeBERTa-v3-xsmall) on the synthetic `nvidia/Nemotron-PII` dataset. It is the smallest size — roughly half the parameters and latency of the small lens — and ships a quantized **int8 ONNX** graph (about 90 MB) for in-process, CPU-friendly inference. Like its siblings it is recall-leaning by design, since in redaction a missed name is a leak while an extra span is only over-redaction. A confidence threshold around **0.50** is a sensible starting operating point; lower it to push recall higher.

## When to use this

- The most constrained deployments — edge, in-browser (WASM), or memory-tight CPU — where the small lens is too large.
- High-throughput, cost-sensitive pipelines where per-document latency dominates.
- As the English name detector composed with Phileas's pattern-based detection for structured PII.

When a missed name is costly and footprint allows, prefer `ph-eye-pii-en-small`, `-medium`, or `-large`, which have higher real-text recall.

## Known limitations

- **Names only.** This lens detects PERSON. Other PII is handled by Phileas's pattern-based detection; compose accordingly.
- **English only.** For other languages, load the corresponding language lens when available.
- **Lowest capacity.** As the smallest size, its real-text recall is lower than the larger `ph-eye-pii-en` sizes — it misses more names on real-world documents. Choose it when footprint and latency dominate; otherwise prefer a larger size.
- **Trained on synthetic data.** Reported accuracy is in-distribution on Nemotron-PII and is a ceiling, not a production guarantee; validate precision and recall on your own text. The model is recall-leaning, so expect some over-redaction and tune the threshold to your precision/recall balance.
- The underlying model is licensed CC-BY-4.0; the Nemotron-PII training data requires attribution to NVIDIA.
