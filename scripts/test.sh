#!/bin/bash
set -e

# Demo test script for CI/CD observability demo
ENV=$1
TEST_TYPE=$2
VERBOSE=${3:-false}

echo "Running tests for environment: $ENV, test type: $TEST_TYPE"

if [ "$VERBOSE" = "true" ]; then
  echo "Verbose mode enabled - showing detailed test logs"
fi

# Simulate test steps
echo "Preparing test environment..."
sleep 2

echo "Setting up test fixtures..."
sleep 1

# Simulate different test scenarios
case $TEST_TYPE in
  "unit")
    echo "Running unit tests..."
    sleep 3
    echo "Unit tests completed with 42 tests passing"
    ;;
  "integration")
    echo "Running integration tests..."
    sleep 5
    echo "Integration tests completed with 18 tests passing"
    ;;
  "e2e")
    echo "Running end-to-end tests..."
    sleep 8
    echo "E2E tests completed with 7 scenarios passing"
    ;;
  *)
    echo "Unknown test type: $TEST_TYPE"
    exit 1
    ;;
esac

# Random chance of test failure (10%) - for demo purposes
if [ $(( RANDOM % 10 )) -eq 0 ]; then
  echo "❌ Some tests have failed! Check test reports for details."
  exit 1
fi

echo "✅ All tests passed successfully!"
exit 0