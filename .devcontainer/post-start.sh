#!/bin/bash
set -e

# Start DDEV if not already running
ddev status >/dev/null 2>&1 || ddev start

# Set port visibility in Codespaces (every time container starts)
if [[ -n "$CODESPACE_NAME" ]]; then
  echo "Setting ports to public..."
  gh codespace ports visibility 8080:public 3000:public --codespace "$CODESPACE_NAME" 2>&1 || {
    echo "Warning: Failed to automatically set port visibility."
    echo "Please manually set ports 8080 and 3000 to 'Public' in the Ports tab."
  }
fi

# Open one-time login URL in browser
LOGIN_URL=$(ddev drush uli --no-browser 2>/dev/null || true)
if [[ -n "$LOGIN_URL" ]]; then
  code --open-url "$LOGIN_URL" 2>/dev/null || true
fi
