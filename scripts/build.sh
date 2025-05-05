#!/bin/bash
set -e

# Demo build script for CI/CD observability demo
echo "Starting build process for platform: $1"

# Simulate build steps
echo "Setting up environment..."
sleep 2

echo "Installing dependencies..."
sleep 3

echo "Compiling code..."
sleep 5

echo "Creating artifacts for platform $1..."
sleep 3

# Create a dummy artifact
mkdir -p artifacts/$1
echo "This is a simulated artifact for platform $1 - Build date: $(date)" > artifacts/$1/build-info.txt

echo "Build completed successfully for $1!"
exit 0