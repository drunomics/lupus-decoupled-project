#!/bin/bash
## Github Codespaces-specific configuration
## Skipped when running locally (no CODESPACE_NAME)

set -e

if [[ -z "$CODESPACE_NAME" ]]; then
  echo "Not in Codespaces - skipping Codespaces-specific setup."
  exit 0
fi

echo "Exposing ports as public..."
gh codespace ports visibility 8080:public --codespace "${CODESPACE_NAME}"
gh codespace ports visibility 3000:public --codespace "${CODESPACE_NAME}"

echo "Codespace setup complete!"
