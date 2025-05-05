#!/bin/bash
set -e

# Demo quality check script for CI/CD observability demo
CHECK_TYPE=$1
THRESHOLD=${2:-80}

echo "Running $CHECK_TYPE quality check with threshold: $THRESHOLD%"

# Simulate quality check steps
echo "Analyzing codebase..."
sleep 3

# Generate random score between 60 and 100
SCORE=$(( RANDOM % 41 + 60 ))

echo "Quality check completed with score: $SCORE%"

if [ $SCORE -lt $THRESHOLD ]; then
  echo "❌ Quality check failed! Score $SCORE% is below threshold $THRESHOLD%"
  exit 1
fi

echo "✅ Quality check passed! Score $SCORE% meets or exceeds threshold $THRESHOLD%"

# Create quality report
mkdir -p reports
echo "Quality Report for $CHECK_TYPE - Score: $SCORE% - Date: $(date)" > reports/quality_report.txt
echo "Details:" >> reports/quality_report.txt
echo "- Files analyzed: 248" >> reports/quality_report.txt
echo "- Issues found: $(( (100 - SCORE) * 3 ))" >> reports/quality_report.txt
echo "- Critical issues: $(( (100 - SCORE) / 10 ))" >> reports/quality_report.txt

echo "Report generated at reports/quality_report.txt"
exit 0