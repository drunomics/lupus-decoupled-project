#!/bin/bash
set -e

# Source environment (BACKEND_URL, FRONTEND_URL)
source .devcontainer/env.sh

# Start DDEV (waits for Docker daemon automatically)
.devcontainer/start-ddev.sh

# Configure frontend URL now that we have the correct CODESPACE_NAME
echo "Configuring frontend URL: ${FRONTEND_URL}"
ddev drush config:set lupus_decoupled_ce_api.settings frontend_base_url "${FRONTEND_URL}" -y

# Update preview provider to "nuxt" if using a Nuxt frontend.
# This is done in ddev site-install but the variable might have changed
# on codespaces after pre-build.
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
