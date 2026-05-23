#!/usr/bin/env bash
# Validates every lens .md in this repo. Runs in CI on every PR.
# - Each lens .md must have the required frontmatter fields
# - Slug in frontmatter must match the filename
# - Status must be one of the allowed values
# - Entities and languages must be non-empty arrays (lightly checked)
# - Slugs must be globally unique

set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT"

errors=0
checked=0

REQUIRED_FRONTMATTER=(title slug license status entities languages summary useCase author creator version updated pheyeCompatibility)
ALLOWED_STATUS=(available preview coming-soon deprecated)

# Convert allowed-status array to a regex alternation for grep
status_regex="^(${ALLOWED_STATUS[0]}"
for s in "${ALLOWED_STATUS[@]:1}"; do status_regex="${status_regex}|${s}"; done
status_regex="${status_regex})$"

while IFS= read -r md; do
  checked=$((checked + 1))

  # All required frontmatter keys are present
  for key in "${REQUIRED_FRONTMATTER[@]}"; do
    if ! grep -q "^${key}:" "$md"; then
      echo "ERROR: $md missing required frontmatter field '${key}'"
      errors=$((errors + 1))
    fi
  done

  # Slug matches filename
  slug_from_md=$(grep -m1 '^slug:' "$md" | sed -E 's/^slug:[[:space:]]*"?([^"]+)"?[[:space:]]*$/\1/')
  slug_from_file=$(basename "${md%.md}")
  if [ "$slug_from_md" != "$slug_from_file" ]; then
    echo "ERROR: $md slug ('$slug_from_md') does not match filename ('$slug_from_file')"
    errors=$((errors + 1))
  fi

  # Status is one of the allowed values
  status_from_md=$(grep -m1 '^status:' "$md" | sed -E 's/^status:[[:space:]]*"?([^"]+)"?[[:space:]]*$/\1/')
  if ! echo "$status_from_md" | grep -Eq "$status_regex"; then
    echo "ERROR: $md has status '$status_from_md' (must be one of: ${ALLOWED_STATUS[*]})"
    errors=$((errors + 1))
  fi

  # entities and languages are arrays (must have at least the opening bracket or YAML list marker on the next line)
  for arr_field in entities languages; do
    if grep -q "^${arr_field}:[[:space:]]*$" "$md"; then
      # YAML block-list form: ensure the next line begins with a list marker
      next=$(grep -A1 "^${arr_field}:[[:space:]]*$" "$md" | tail -1)
      if ! echo "$next" | grep -Eq '^[[:space:]]*-[[:space:]]'; then
        echo "ERROR: $md '${arr_field}' field appears empty"
        errors=$((errors + 1))
      fi
    elif grep -Eq "^${arr_field}:[[:space:]]*\[" "$md"; then
      # Inline array form: ensure it has at least one item
      if grep -Eq "^${arr_field}:[[:space:]]*\[[[:space:]]*\]" "$md"; then
        echo "ERROR: $md '${arr_field}' is an empty array"
        errors=$((errors + 1))
      fi
    fi
  done

done < <(find lenses -name '*.md' -type f 2>/dev/null | sort)

# Slug uniqueness across the whole catalog
duplicate_slugs=$(find lenses -name '*.md' -type f 2>/dev/null | xargs -n1 basename 2>/dev/null | sort | uniq -d)
if [ -n "$duplicate_slugs" ]; then
  while IFS= read -r dup; do
    echo "ERROR: slug collision: '$dup' appears in multiple lens files. Slugs must be globally unique."
    errors=$((errors + 1))
  done <<< "$duplicate_slugs"
fi

echo
echo "Checked $checked lens file(s)."

if [ $errors -gt 0 ]; then
  echo "Validation failed with $errors error(s)."
  exit 1
fi

echo "All lenses valid."
