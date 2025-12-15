#!/bin/bash
set -e

# Source environment (BACKEND_URL, FRONTEND_URL)
source .devcontainer/env.sh

# Configure frontend URL now that we have the correct CODESPACE_NAME
echo "Configuring frontend URL: ${FRONTEND_URL}"
ddev drush config:set lupus_decoupled_ce_api.settings frontend_base_url "${FRONTEND_URL}" -y

# Set preview provider to "nuxt" if using a Nuxt frontend
if [[ "${FRONTEND_REPOSITORY}" == *"nuxt"* ]]; then
  echo "Detected Nuxt frontend, setting preview provider..."
  ddev drush config:set lupus_decoupled_ce_api.settings preview_provider "nuxt" -y
fi

echo ""
echo "=============================================="
echo "  Lupus Decoupled - Ready!"
echo "=============================================="
echo "  Backend:  ${BACKEND_URL}/user/login"
echo "  Frontend: ${FRONTEND_URL}"
echo "  Login:    admin / lupus123"
echo "=============================================="
