/**
 * Demo application for CI/CD Observability with GitHub Actions
 */

/**
 * Main application class
 */
class Application {
  constructor(options = {}) {
    this.name = options.name || 'CI/CD Demo App';
    this.version = options.version || '1.0.0';
    this.environment = options.environment || 'development';
    this.initialized = false;
    
    console.log(`Initializing ${this.name} v${this.version} in ${this.environment} environment`);
  }

  /**
   * Initialize the application
   */
  initialize() {
    console.log('Application initializing...');
    // Simulating initialization steps
    this.initialized = true;
    console.log('Application initialized successfully!');
    return this.initialized;
  }

  /**
   * Run the application
   */
  run() {
    if (!this.initialized) {
      throw new Error('Application must be initialized before running');
    }
    
    console.log('Application running...');
    return true;
  }

  /**
   * Shutdown the application
   */
  shutdown() {
    console.log('Application shutting down...');
    this.initialized = false;
    console.log('Application has been shut down');
  }
}

/**
 * Calculate the next version based on current version and release type
 * @param {string} currentVersion - Current semantic version (e.g., "1.0.0")
 * @param {string} releaseType - Release type: "major", "minor", or "patch"
 * @returns {string} Next version
 */
function calculateNextVersion(currentVersion, releaseType) {
  const [major, minor, patch] = currentVersion.split('.').map(Number);
  
  switch (releaseType) {
    case 'major':
      return `${major + 1}.0.0`;
    case 'minor':
      return `${major}.${minor + 1}.0`;
    case 'patch':
      return `${major}.${minor}.${patch + 1}`;
    default:
      return currentVersion;
  }
}

// Export the application
module.exports = {
  Application,
  calculateNextVersion
};