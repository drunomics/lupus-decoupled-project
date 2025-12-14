#!/bin/bash
set -e

# Source environment (BACKEND_URL, FRONTEND_URL)
source .devcontainer/env.sh

echo ""
echo "=============================================="
echo "  Lupus Decoupled - Ready!"
echo "=============================================="
echo "  Backend:  ${BACKEND_URL}/user/login"
echo "  Frontend: ${FRONTEND_URL}"
echo "  Login:    admin / lupus123"
echo "=============================================="
