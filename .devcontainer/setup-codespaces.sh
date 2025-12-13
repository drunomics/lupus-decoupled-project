#!/bin/bash

## Codespaces-specific configuration
## URL environment variables are handled by .ddev/config.codespaces.yaml

set -e

echo "Configuring Drupal frontend base URL..."
ddev drush config:set lupus_decoupled_ce_api.settings frontend_base_url https://${CODESPACE_NAME}-3000.app.github.dev -y

echo "Exposing ports as public..."
gh codespace ports visibility 80:public --codespace "${CODESPACE_NAME}"
gh codespace ports visibility 3000:public --codespace "${CODESPACE_NAME}"

echo "Codespace setup complete!"
