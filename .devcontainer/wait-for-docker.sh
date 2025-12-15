#!/bin/bash
# Wait for Docker daemon to be ready

echo "Waiting for Docker to be ready..."
while true; do
  docker ps > /dev/null 2>&1 && break
  sleep 1
done
echo "✓ Docker is ready"
