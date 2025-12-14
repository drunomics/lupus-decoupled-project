#!/bin/bash
# View frontend development server logs

echo "Connecting to frontend container to view logs..."
echo "Press Ctrl+C to exit"
echo ""

ddev ssh -d frontend -c "pm2 logs"
