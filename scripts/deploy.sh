#!/bin/bash
set -e

# Demo deployment script for CI/CD observability demo
ENV=$1
DEPLOY_STRATEGY=${2:-"all-at-once"}
VERSION=${3:-"1.0.0"}

echo "Deploying to environment: $ENV using $DEPLOY_STRATEGY strategy (version: $VERSION)"

# Simulate deployment steps
echo "Preparing deployment package..."
sleep 3

echo "Connecting to $ENV environment..."
sleep 2

case $DEPLOY_STRATEGY in
  "blue-green")
    echo "Executing blue-green deployment strategy..."
    echo "1. Deploying to passive environment..."
    sleep 4
    echo "2. Running smoke tests..."
    sleep 2
    echo "3. Switching traffic to new version..."
    sleep 3
    echo "4. Verifying health..."
    sleep 2
    ;;
  "canary")
    echo "Executing canary deployment strategy..."
    echo "1. Deploying to 10% of instances..."
    sleep 2
    echo "2. Monitoring metrics..."
    sleep 3
    echo "3. Expanding to 50% of instances..."
    sleep 3
    echo "4. Final metrics check..."
    sleep 2
    echo "5. Completing rollout to 100%..."
    sleep 3
    ;;
  "all-at-once")
    echo "Executing all-at-once deployment strategy..."
    echo "1. Taking environment offline..."
    sleep 1
    echo "2. Deploying new version..."
    sleep 5
    echo "3. Bringing environment back online..."
    sleep 2
    ;;
  *)
    echo "Unknown deployment strategy: $DEPLOY_STRATEGY"
    exit 1
    ;;
esac

echo "Running post-deployment verification..."
sleep 3

# Small chance of deployment failure (5%)
if [ $(( RANDOM % 20 )) -eq 0 ]; then
  echo "❌ Deployment failed! Check logs for details."
  exit 1
fi

echo "✅ Successfully deployed version $VERSION to $ENV environment using $DEPLOY_STRATEGY strategy!"

# Create deployment record
mkdir -p deployment-records
TIMESTAMP=$(date +"%Y%m%d-%H%M%S")
echo "Deployment Record" > deployment-records/deploy-$ENV-$TIMESTAMP.txt
echo "Environment: $ENV" >> deployment-records/deploy-$ENV-$TIMESTAMP.txt
echo "Strategy: $DEPLOY_STRATEGY" >> deployment-records/deploy-$ENV-$TIMESTAMP.txt
echo "Version: $VERSION" >> deployment-records/deploy-$ENV-$TIMESTAMP.txt
echo "Timestamp: $(date)" >> deployment-records/deploy-$ENV-$TIMESTAMP.txt

echo "Deployment record created at deployment-records/deploy-$ENV-$TIMESTAMP.txt"
exit 0