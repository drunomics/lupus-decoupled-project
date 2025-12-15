#!/bin/bash
# Runs when user attaches to the container
# Starts DDEV, sets port visibility, shows welcome message

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

# Set port visibility in Codespaces (runs when editor attaches)
if [[ -n "$CODESPACE_NAME" ]]; then
  echo "Setting ports to public..."

  # Set both ports (gh waits for them automatically)
  if gh codespace ports visibility 3000:public 8080:public --codespace "$CODESPACE_NAME" >/dev/null 2>&1; then
    echo "✓ Ports set to public"
  else
    echo "✗ Failed to set port visibility"
    echo "Please manually set ports 8080 and 3000 to 'Public' in the Ports tab."
  fi
fi

echo ""
echo "=============================================="
echo "  Lupus Decoupled - Ready!"
echo "=============================================="
echo "  Backend:  ${BACKEND_URL}/user/login"
echo "  Frontend: ${FRONTEND_URL}"
echo "  Login:    admin / lupus123"
echo "=============================================="

# Show one-time login link
LOGIN_URL=$(ddev drush uli --no-browser 2>/dev/null || true)
if [[ -n "$LOGIN_URL" ]]; then
  echo ""
  echo "One-time login link (click to open):"
  echo "  ${LOGIN_URL}"
fi

echo ""
echo "See USAGE.md for common commands."
echo ""
