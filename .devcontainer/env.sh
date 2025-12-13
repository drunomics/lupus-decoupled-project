#!/bin/bash
# Lupus Decoupled environment URLs
# Sourced by .bashrc - available in all shells and ddev hooks

if [[ -n "$CODESPACE_NAME" ]]; then
  export BACKEND_URL="https://${CODESPACE_NAME}-80.app.github.dev"
  export FRONTEND_URL="https://${CODESPACE_NAME}-3000.app.github.dev"
else
  export BACKEND_URL="${BACKEND_URL:-https://lupus-decoupled.ddev.site}"
  export FRONTEND_URL="${FRONTEND_URL:-https://lupus-nuxt.ddev.site}"
fi
