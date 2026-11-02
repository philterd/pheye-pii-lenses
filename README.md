# PhEye PII Lenses

A catalog of **PII lenses** — specialized AI / NLP models for PII and PHI entity detection, designed to plug into [PhEye](https://github.com/philterd/ph-eye) and through it into [Phileas](https://github.com/philterd/phileas) and [Philter](https://github.com/philterd/philter).

A **lens** is a swappable, focused model trained on a specific domain (clinical text, hospital identifiers, a particular language, a vertical-specific identifier set, etc.). Lenses are loaded at PhEye configuration time; multiple lenses can be loaded simultaneously and their detections merged.

This repository holds the **metadata, documentation, and example fixtures** for each lens. The actual trained model weights ship with PhEye releases.

## Why this repo exists

Lens descriptions, entity coverage, and use-case guidance are versioned alongside the rest of the Philterd toolkit documentation, but kept in their own repository because:

- The catalog grows independently of any single product (Philter, Phileas, PhEye release cycles).
- Community contributions (custom-trained lenses, language-specific lenses, vertical lenses) are easier to accept as PRs to a focused repo.
- The Philterd website ([philterd.ai/lenses/](https://www.philterd.ai/lenses/)) syncs from this repo at build time — adding a lens is a PR here.

## Repository layout

```
pheye-pii-lenses/
├── lenses/                          # one .md per lens, frontmatter-driven
│   ├── ph-eye-pii-en-small.md
│   ├── ph-eye-pii-en-medium.md
│   └── ph-eye-pii-en-large.md
├── schema/
│   └── lens.schema.json             # JSON schema for the .md frontmatter
├── tests/
│   ├── validate.sh                  # validator, run in CI (frontmatter + schema)
│   ├── validate_schema.py           # checks frontmatter against the JSON schema
│   └── requirements.txt             # Python packages the schema check needs
├── LICENSE                          # Apache 2.0, for the catalog files
└── README.md                        # this file
```

Each lens has a single sidecar `.md` file. The frontmatter is the structured metadata (slug, license, entities, status, version, pairs-with hints); the markdown body is the long-form description, training notes, and use-case guidance.

## Adding a lens

See [CONTRIBUTING.md](CONTRIBUTING.md) for the full process. The short version:

1. Author `lenses/<your-slug>.md` with the required frontmatter (see the schema).
2. Run `bash tests/validate.sh` locally.
3. Open a PR.

## License

The catalog files in this repository (lens `.md` files, schema, and scripts) are licensed under [Apache 2.0](LICENSE).

Each lens's model has its own license, given by the `license` field in its frontmatter. It must be an open license that permits commercial use and redistribution (`Apache-2.0`, `MIT`, `BSD-2-Clause`, `BSD-3-Clause`, `CC0-1.0`, `CC-BY-4.0`, or `CC-BY-SA-4.0`); see [CONTRIBUTING.md](CONTRIBUTING.md). The `ph-eye-pii-en` lenses are CC-BY-4.0, inherited from the NVIDIA Nemotron-PII training data, which requires attribution to NVIDIA.
