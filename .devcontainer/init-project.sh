#!/bin/bash
set -e

# Source environment (BACKEND_URL, FRONTEND_URL)
source .devcontainer/env.sh

# Start DDEV if not already running and wait for it to be ready
if ! ddev status >/dev/null 2>&1; then
  echo "Starting DDEV..."
  ddev start

  # Wait for ddev to be fully ready (web container responding)
  echo "Waiting for DDEV to be ready..."
  for i in {1..60}; do
    if curl -s -o /dev/null -w "%{http_code}" http://localhost:8080/ 2>/dev/null | grep -q "200\|301\|302"; then
      echo "✓ DDEV is ready"
      break
    fi
    sleep 1
  done
fi

# Configure frontend URL now that we have the correct CODESPACE_NAME
echo "Configuring frontend URL: ${FRONTEND_URL}"
ddev drush config:set lupus_decoupled_ce_api.settings frontend_base_url "${FRONTEND_URL}" -y

# Set preview provider to "nuxt" if using a Nuxt frontend
if [[ "${FRONTEND_REPOSITORY}" == *"nuxt"* ]]; then
  echo "Detected Nuxt frontend, setting preview provider..."
  ddev drush config:set lupus_decoupled_ce_api.settings preview_provider "nuxt" -y
fi

# Be sure updated URL is applied.
ddev drush cr

echo ""
echo "=============================================="
echo "  Lupus Decoupled - Ready!"
echo "=============================================="
echo "  Backend:  ${BACKEND_URL}/user/login"
echo "  Frontend: ${FRONTEND_URL}"
echo "  Login:    admin / lupus123"
echo "=============================================="
