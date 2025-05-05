#!/bin/bash
set -e

# Demo publish script for CI/CD observability demo
PLATFORM=$1
REGISTRY=$2
VERSION=${3:-"1.0.0"}

echo "Publishing artifacts for platform: $PLATFORM to registry: $REGISTRY (version: $VERSION)"

# Simulate publishing steps
echo "Preparing artifacts for publishing..."
sleep 2

echo "Validating artifacts..."
sleep 1

echo "Authenticating with registry $REGISTRY..."
sleep 2

echo "Uploading artifacts for $PLATFORM..."
sleep 4

echo "Finalizing publication..."
sleep 1

echo "✅ Successfully published artifacts for $PLATFORM to $REGISTRY (version: $VERSION)"

# Create publication record
mkdir -p publication-history
TIMESTAMP=$(date +"%Y%m%d-%H%M%S")
echo "Publication Record" > publication-history/publish-$TIMESTAMP.txt
echo "Platform: $PLATFORM" >> publication-history/publish-$TIMESTAMP.txt
echo "Registry: $REGISTRY" >> publication-history/publish-$TIMESTAMP.txt
echo "Version: $VERSION" >> publication-history/publish-$TIMESTAMP.txt
echo "Timestamp: $(date)" >> publication-history/publish-$TIMESTAMP.txt

echo "Publication record created at publication-history/publish-$TIMESTAMP.txt"
exit 0