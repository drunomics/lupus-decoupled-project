#!/bin/bash
set -e

echo "=============================================="
echo "  Lupus Decoupled - Starting containers..."
echo "=============================================="

ddev start

echo ""
echo "=============================================="
echo "  Ready!"
echo "=============================================="
echo "  Backend:  https://${CODESPACE_NAME}-80.app.github.dev/user/login"
echo "  Frontend: https://${CODESPACE_NAME}-3000.app.github.dev"
echo "  Login:    admin / lupus123"
echo "=============================================="
echo ""
echo "Entering web container... (type 'exit' to leave)"
echo ""

exec ddev ssh
