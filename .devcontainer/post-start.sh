#!/bin/bash
set -e

# Start DDEV if not already running
ddev status >/dev/null 2>&1 || ddev start

# Set port visibility in Codespaces (every time container starts)
if [[ -n "$CODESPACE_NAME" ]]; then
  echo "Setting ports to public..."

  # Set each port individually and capture output
  if gh codespace ports visibility 8080:public --codespace "$CODESPACE_NAME" 2>&1; then
    echo "✓ Port 8080 set to public"
  else
    echo "✗ Port 8080 failed (exit code: $?)"
  fi

  if gh codespace ports visibility 3000:public --codespace "$CODESPACE_NAME" 2>&1; then
    echo "✓ Port 3000 set to public"
  else
    echo "✗ Port 3000 failed (exit code: $?)"
  fi
fi

# Open one-time login URL in browser
LOGIN_URL=$(ddev drush uli --no-browser 2>/dev/null || true)
if [[ -n "$LOGIN_URL" ]]; then
  code --open-url "$LOGIN_URL" 2>/dev/null || true
fi
