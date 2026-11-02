"""Validates each lens's frontmatter against schema/lens.schema.json."""

import json
import pathlib
import sys

import jsonschema
import yaml

root = pathlib.Path(__file__).resolve().parent.parent
validator = jsonschema.Draft7Validator(json.loads((root / "schema" / "lens.schema.json").read_text()))

errors = 0
for md in sorted((root / "lenses").glob("*.md")):
    text = md.read_text()
    name = md.relative_to(root)
    if not text.startswith("---\n") or "\n---" not in text[4:]:
        print(f"ERROR: {name} has no frontmatter block")
        errors += 1
        continue
    # BaseLoader keeps scalars as strings, so an unquoted date or version is checked as written.
    frontmatter = yaml.load(text[4:text.index("\n---", 4)], Loader=yaml.BaseLoader)
    for error in validator.iter_errors(frontmatter):
        field = ".".join(str(p) for p in error.absolute_path) or "(frontmatter)"
        print(f"ERROR: {name} {field}: {error.message}")
        errors += 1

sys.exit(1 if errors else 0)
