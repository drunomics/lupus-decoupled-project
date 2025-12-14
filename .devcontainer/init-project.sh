#!/bin/bash
set -e

# Source environment (BACKEND_URL, FRONTEND_URL)
source .devcontainer/env.sh

# Generate one-time login URL
LOGIN_URL=$(ddev drush uli --no-browser)

echo ""
echo "=============================================="
echo "  Lupus Decoupled - Ready!"
echo "=============================================="
echo "  Backend:  ${BACKEND_URL}/user/login"
echo "  Frontend: ${FRONTEND_URL}"
echo "  Login:    admin / lupus123"
echo "=============================================="

# Set port visibility in Codespaces
if [[ -n "$CODESPACE_NAME" ]]; then
  echo ""
  echo "Setting ports to public..."
  gh codespace ports visibility 8080:public 3000:public --codespace "$CODESPACE_NAME" || {
    echo "Warning: Failed to automatically set port visibility."
    echo "Please manually set ports 8080 and 3000 to 'Public' in the Ports tab."
  }
fi

# Open the one-time login URL in browser
echo ""
echo "Opening login URL in browser..."
echo "$LOGIN_URL"
code --open-url "$LOGIN_URL" 2>/dev/null || true
