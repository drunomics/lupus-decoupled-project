#!/bin/bash
# Starts DDEV and ensures it's fully ready

DDEV_IS_READY=0

# Wait for Docker daemon to be ready
echo "Waiting for Docker..."
while true; do
  docker ps > /dev/null 2>&1 && break
  sleep 1
done
echo "✓ Docker is ready"

# Start DDEV if not already running
if ! ddev status >/dev/null 2>&1; then
  echo "Starting DDEV..."
  ddev start -y
fi

# Always wait for ddev to be fully ready (web container responding on port 8080)
echo "Waiting for DDEV to be ready..."
for i in {1..60}; do
  if curl -s -o /dev/null -w "%{http_code}" http://localhost:8080/ 2>/dev/null | grep -q "200\|301\|302"; then
    echo "✓ DDEV is ready"
    DDEV_IS_READY=1
    break
  fi
  sleep 1
done

if [[ DDEV_IS_READY = 0 ]]; then
  echo "Failed starting ddev. Check creation logs and/or try re-building the codespace."
  exit 1
fi
