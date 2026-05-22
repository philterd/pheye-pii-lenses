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
│   ├── general-purpose.md
│   ├── healthcare.md
│   ├── hospital-identifiers.md
│   ├── covid-19.md
│   ├── spanish-pii.md
│   ├── french-pii.md
│   ├── german-pii.md
│   ├── portuguese-pii.md
│   ├── legal-identifiers.md
│   └── financial-identifiers.md
├── schema/
│   └── lens.schema.json             # JSON schema for the .md frontmatter
├── tests/
│   └── validate.sh                  # CI validator (frontmatter + schema)
├── LICENSE                          # Apache 2.0
└── README.md                        # this file
```

Each lens has a single sidecar `.md` file. The frontmatter is the structured metadata (slug, entities, status, version, pairs-with hints); the markdown body is the long-form description, training notes, and use-case guidance.

## Adding a lens

See [CONTRIBUTING.md](CONTRIBUTING.md) for the full process. The short version:

1. Author `lenses/<your-slug>.md` with the required frontmatter (see the schema).
2. Run `bash tests/validate.sh` locally.
3. Open a PR.

## License

Apache 2.0. See [LICENSE](LICENSE).
