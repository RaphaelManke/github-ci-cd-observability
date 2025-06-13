# GitHub CI/CD Observability Demo

This repository demonstrates a complex CI/CD workflow using GitHub Actions with observability features.

## Features

- Multi-step, complex CI/CD workflow for project releases
- Multiple jobs with dependencies
- Different runner types (Ubuntu, Windows, macOS)
- Matrix builds for multi-environment testing
- Configurable workflow behavior through manual triggers
- Shell script execution in various steps

## Workflow Structure

The main workflow (`release-workflow.yml`) includes:

1. **Build Job**: Builds the project for multiple platforms
2. **Test Job**: Runs tests in a matrix configuration for different scenarios
3. **Quality Job**: Performs code quality checks and security scanning
4. **Publish Job**: Publishes artifacts to different destinations
5. **Deploy Job**: Deploys to staging and production environments

## Manual Workflow Configuration

When triggering the workflow manually, you can configure:
- Release type (major, minor, patch)
- Target environments (staging, production)
- Debug mode (enables verbose logging)
- Skip tests flag (for expedited builds)
- Deployment strategy (blue-green, canary, all-at-once)

## How to Use

1. Clone this repository
2. Go to the Actions tab in GitHub
3. Select the "Release Workflow"
4. Click "Run workflow"
5. Configure options as needed
6. Submit to run the workflow

This demo is designed to showcase GitHub Actions observability features for complex CI/CD pipelines.

Update
