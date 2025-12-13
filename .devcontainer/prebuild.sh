#!/bin/bash
set -ex

echo "=============================================="
echo "  Lupus Decoupled - Prebuild Setup"
echo "=============================================="

# Wait for docker to be ready.
wait_for_docker() {
  echo "[1/3] Waiting for Docker to be ready..."
  while true; do
    docker ps > /dev/null 2>&1 && break
    sleep 1
  done
  echo "Docker is ready."
}

wait_for_docker

echo "[2/3] Starting DDEV containers..."
# Environment variables (FRONTEND_REPOSITORY, etc.) are passed through
# via containerEnv in devcontainer.json and .ddev/config.yaml
ddev start -y

echo "[3/3] Installing Drupal site..."
ddev site-install

echo ""
echo "=============================================="
echo "  Prebuild Complete!"
echo "=============================================="
