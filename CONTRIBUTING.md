# Contributing a lens

Pull requests welcome. The process is designed to be lightweight while keeping the catalog trustworthy.

## What makes a good lens

- **Specific.** Targets a defined domain (one industry, one language, one identifier family). Catch-all lenses are less useful than focused ones — they duplicate what the General Purpose lens already covers.
- **Documented.** The sidecar `.md` explains what entities it detects, what corpus it was trained on, what it's known to miss, and which other lenses it composes well with.
- **Tested.** Reviewers (and users picking the lens) need to be able to evaluate the lens against their data. Provide an example input and example detection output where possible.
- **Licensed.** Each lens declares its own license via the `license` field in the frontmatter (e.g., `license: "Apache-2"`). There is no repo-wide LICENSE file — the per-lens declaration is authoritative. Core-team lenses use Apache-2; community contributions may use other terms as long as they're explicit.

## File layout

One markdown file per lens, under `lenses/`:

```
lenses/<your-lens-slug>.md
```

Slugs are kebab-case, globally unique within this repo, and match the URL the lens will get on philterd.ai (`/lenses/<your-lens-slug>/`).

## Sidecar `.md` schema

Every lens `.md` must have this frontmatter:

```yaml
---
title: "Human-readable lens name"        # required
slug: "your-lens-slug"                   # required, must match filename
license: "Apache-2"                      # required, e.g. Apache-2, MIT, Proprietary
status: "available"                      # required: available | preview | coming-soon | deprecated
entities:                                # required, one or more entity types the lens detects
  - "PERSON"
  - "ORG"
  - "HOSPITAL"
languages: ["en"]                        # required, ISO 639-1 codes
summary: "One- or two-sentence summary"  # required, 80-200 chars
useCase: "When to load this lens"        # required, one-paragraph guidance
author: "Your name or org"               # required (display name)
creator: "your-name-or-org"              # required ("philterd" for core team)
version: "1.0.0"                         # required, semver
updated: "2026-05-22"                    # required, YYYY-MM-DD
pheyeCompatibility: ">=1.0.0"            # required, semver range for PhEye
modelSize: "120 MB"                      # optional, human-readable disk size
pairsWith: ["healthcare", "spanish-pii"] # optional, slugs of lenses commonly loaded together
---

## What this lens detects

Markdown body — extended description, training corpus notes, known limitations,
recommended combinations.

## When to use this

Concrete guidance: workload shapes where this lens beats the General Purpose lens.

## Known limitations

Honest list of what the lens misses or gets wrong.
```

## Validating locally

Before opening a PR, run the local validator:

```bash
bash tests/validate.sh
```

This checks:

- Every lens `.md` parses as valid markdown with frontmatter.
- Every lens has the required frontmatter fields.
- The `slug` field matches the filename.
- The `status` value is one of the allowed values.
- The `entities` and `languages` fields are non-empty arrays.
- Slugs are globally unique across the catalog.

CI runs the same checks on every PR.

## Naming conventions

- **Slugs**: kebab-case, descriptive. `hospital-identifiers` not `hospital_ids` or `hospitalIdentifiers`.
- **Title**: human-readable, capitalized normally. "Healthcare" not "healthcare". "Spanish PII" not "spanish-pii".
- **Entity type names**: UPPER_SNAKE_CASE, consistent with PhEye's entity vocabulary (`PERSON`, `LOCATION`, `ORG`, `HOSPITAL`, `MEDICATION`, etc.).

## What the website does with this

The Philterd website ([philterd.ai/lenses/](https://www.philterd.ai/lenses/)) syncs this repo at build time. Each lens `.md` becomes a page at `/lenses/<slug>/`, and the catalog index at `/lenses/` lists them all with summary cards.

A lens marked `status: "coming-soon"` still renders on the catalog (with a different status pill) but is signaled as not-yet-shipped. Use that status when you're publishing the metadata before the trained model is ready.
