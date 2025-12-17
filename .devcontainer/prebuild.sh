#!/bin/bash
set -e

echo "=============================================="
echo "  Lupus Decoupled - Prebuild Setup"
echo "=============================================="

echo "[1/3] Setting up environment..."
# Add env.sh to bashrc so BACKEND_URL/FRONTEND_URL are available everywhere
echo 'source /workspaces/lupus-decoupled-project/.devcontainer/env.sh' >> ~/.bashrc
source /workspaces/lupus-decoupled-project/.devcontainer/env.sh

echo "[2/3] Configuring DDEV for devcontainer..."
# Use HTTP on port 8080 in devcontainer environments (both Codespaces and local)
cp .devcontainer/ddev-config.yaml .ddev/config.devcontainer.yaml

echo "[3/3] Starting DDEV and installing Drupal..."
# Environment variables (FRONTEND_REPOSITORY, etc.) are passed through
# via containerEnv in devcontainer.json and .ddev/config.yaml
.devcontainer/start-ddev.sh

ddev site-install
# Stop here for better consistency of pre-build builds.
ddev stop

echo ""
echo "=============================================="
echo "  Prebuild Complete!"
echo "=============================================="
