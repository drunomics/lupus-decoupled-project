#!/bin/bash
set -e

# Start DDEV if not already running
ddev status >/dev/null 2>&1 || ddev start
