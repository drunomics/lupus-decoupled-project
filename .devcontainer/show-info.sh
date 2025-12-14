#!/bin/bash
# Shows project info when user attaches to container

# Source environment (BACKEND_URL, FRONTEND_URL)
source .devcontainer/env.sh

# Set port visibility in Codespaces (runs when editor attaches)
if [[ -n "$CODESPACE_NAME" ]]; then
  echo "Setting ports to public..."

  # Set both ports (gh waits for them automatically)
  if gh codespace ports visibility 3000:public 8080:public --codespace "$CODESPACE_NAME" 2>&1; then
    echo "✓ Ports set to public"
  else
    echo "✗ Failed to set port visibility"
    echo "Please manually set ports 8080 and 3000 to 'Public' in the Ports tab."
  fi

  # Verify actual port visibility
  sleep 1
  echo ""
  echo "Port status:"
  gh codespace ports --codespace "$CODESPACE_NAME" | grep -E "(8080|3000)" || true
fi

echo ""
echo "=============================================="
echo "  Lupus Decoupled - Ready!"
echo "=============================================="
echo "  Backend:  ${BACKEND_URL}"
echo "  Frontend: ${FRONTEND_URL}"
echo "  Login:    admin / lupus123"
echo "=============================================="
echo ""
echo "Tips:"
echo "  - Use 'ddev drush uli' for a one-time login link"
echo "  - Use 'ddev ssh' to access the web container shell"
echo "  - Frontend logs are streaming in a separate terminal"
echo ""

# Open one-time login URL in browser
LOGIN_URL=$(ddev drush uli --no-browser 2>/dev/null || true)
if [[ -n "$LOGIN_URL" ]]; then
  code --open-url "$LOGIN_URL" 2>/dev/null || true
fi
