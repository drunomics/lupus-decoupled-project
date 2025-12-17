#!/bin/bash
set -e

echo "=============================================="
echo "  Lupus Decoupled - Prebuild Setup"
echo "=============================================="

echo "[1/2] Setting up environment..."
# Add env.sh to bashrc so BACKEND_URL/FRONTEND_URL are available everywhere
echo 'source /workspaces/lupus-decoupled-project/.devcontainer/env.sh' >> ~/.bashrc
source /workspaces/lupus-decoupled-project/.devcontainer/env.sh

echo "[2/2] Configuring DDEV for devcontainer..."
# Use HTTP on port 8080 in devcontainer environments (both Codespaces and local)
cp .devcontainer/ddev-config.yaml .ddev/config.devcontainer.yaml

echo ""
echo "=============================================="
echo "  Prebuild Complete!"
echo "=============================================="
