#!/bin/bash
set -ex

echo "=============================================="
echo "  Lupus Decoupled - User Setup"
echo "=============================================="

echo "[1/3] Configuring Codespace URLs..."
.devcontainer/setup-codespaces.sh

echo "[2/3] Starting DDEV to apply config..."
ddev start

echo "[3/3] Opening Drupal login..."
# Get one-time login URL and transform to Codespace URL
LOGIN_PATH=$(ddev drush uli --no-browser | sed 's|^.*/user/reset|/user/reset|')
LOGIN_URL="https://${CODESPACE_NAME}-80.app.github.dev${LOGIN_PATH}"

echo ""
echo "=============================================="
echo "  Setup Complete!"
echo "=============================================="
echo "  Backend:  https://${CODESPACE_NAME}-80.app.github.dev"
echo "  Frontend: https://${CODESPACE_NAME}-3000.app.github.dev"
echo "  Login:    admin / lupus123"
echo "=============================================="

# Open the one-time login URL in browser
echo ""
echo "Opening login URL in browser..."
echo "$LOGIN_URL"
# Use VS Code's URL opener in Codespaces
code --open-url "$LOGIN_URL" 2>/dev/null || true
