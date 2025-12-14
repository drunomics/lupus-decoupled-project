#!/bin/bash
# Shows project info when user attaches to container

# Source environment (BACKEND_URL, FRONTEND_URL)
source .devcontainer/env.sh

echo ""
echo "=============================================="
echo "  Lupus Decoupled - Ready!"
echo "=============================================="
echo "  Backend:  ${BACKEND_URL}"
echo "  Frontend: ${FRONTEND_URL}"
echo "  Login:    admin / lupus123"
echo "=============================================="
echo ""
echo "Tip: Use 'ddev drush uli' for a one-time login link"
echo ""
