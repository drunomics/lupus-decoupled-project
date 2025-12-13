#!/bin/bash
set -e

# Source environment (BACKEND_URL, FRONTEND_URL)
source .devcontainer/env.sh

echo "=============================================="
echo "  Lupus Decoupled - User Setup"
echo "=============================================="

echo "[1/2] Configuring Codespaces (if applicable)..."
.devcontainer/setup-codespaces.sh

echo "[2/2] Opening Drupal login..."
LOGIN_URL=$(ddev drush uli --no-browser)

echo ""
echo "=============================================="
echo "  Setup Complete!"
echo "=============================================="
echo "  Backend:  ${BACKEND_URL}/user/login"
echo "  Frontend: ${FRONTEND_URL}"
echo "  Login:    admin / lupus123"
echo "=============================================="

# Open the one-time login URL in browser
echo ""
echo "Opening login URL in browser..."
echo "$LOGIN_URL"
code --open-url "$LOGIN_URL" 2>/dev/null || true
