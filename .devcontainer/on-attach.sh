#!/bin/bash
# Runs when user attaches to the container
# Starts DDEV, sets port visibility, shows welcome message

# Source environment (BACKEND_URL, FRONTEND_URL)
source .devcontainer/env.sh

.devcontainer/start-ddev.sh

# Set port visibility in Codespaces (runs when editor attaches)
# For that to work, we need to wait until ports are available in the editor.
if [[ -n "$CODESPACE_NAME" ]]; then
  echo "Configuring port visibility..."

  # Wait for ports to be forwarded (up to 30 seconds)
  for i in {1..30}; do
    if gh codespace ports --codespace "$CODESPACE_NAME" 2>/dev/null | grep -q "8080"; then
      break
    fi
    sleep 1
  done

  # Try setting ports to public (retry up to 3 times)
  for attempt in {1..3}; do
    gh codespace ports visibility 3000:public 8080:public --codespace "$CODESPACE_NAME" >/dev/null 2>&1
    sleep 2

    # Check if both ports are actually public
    PORTS_STATUS=$(gh codespace ports --codespace "$CODESPACE_NAME" 2>/dev/null | grep -E "(3000|8080)")
    if ! echo "$PORTS_STATUS" | grep -q "private"; then
      echo "✓ Ports set to public"
      break
    elif [[ $attempt -eq 3 ]]; then
      echo "⚠ Ports are still private after 3 attempts"
      echo "Please manually set ports 8080 and 3000 to 'Public' in the Ports tab"
    fi
  done
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
