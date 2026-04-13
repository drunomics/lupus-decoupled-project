#!/bin/bash
# Lupus Decoupled environment URLs
# Sourced by .bashrc - available in all shells and ddev hooks

if [[ -n "$CODESPACE_NAME" ]]; then
  # GitHub Codespaces - uses GitHub's HTTPS proxy on port 8080
  export BACKEND_URL="https://${CODESPACE_NAME}-8080.app.github.dev"
  export FRONTEND_URL="https://${CODESPACE_NAME}-3000.app.github.dev"
elif [[ -n "$REMOTE_CONTAINERS" ]]; then
  # Local VS Code devcontainer - use HTTP on high port (no root needed)
  export BACKEND_URL="http://localhost:8080"
  export FRONTEND_URL="http://localhost:3000"
else
  # Regular ddev on host - use HTTP with ddev.site
  export BACKEND_URL="${BACKEND_URL:-http://lupus-decoupled.ddev.site}"
  export FRONTEND_URL="${FRONTEND_URL:-http://lupus-nuxt.ddev.site}"
fi
