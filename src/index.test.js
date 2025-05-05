/**
 * Tests for CI/CD Demo application
 */

const { Application, calculateNextVersion } = require('./index');

describe('Application', () => {
  let app;

  beforeEach(() => {
    app = new Application({
      name: 'Test App',
      version: '1.2.3',
      environment: 'test'
    });
  });

  test('should initialize correctly', () => {
    expect(app.name).toBe('Test App');
    expect(app.version).toBe('1.2.3');
    expect(app.environment).toBe('test');
    expect(app.initialized).toBe(false);
  });

  test('should initialize and run properly', () => {
    expect(app.initialized).toBe(false);
    
    const initResult = app.initialize();
    expect(initResult).toBe(true);
    expect(app.initialized).toBe(true);
    
    const runResult = app.run();
    expect(runResult).toBe(true);
  });

  test('should throw error if run without initialization', () => {
    expect(app.initialized).toBe(false);
    expect(() => {
      app.run();
    }).toThrow('Application must be initialized before running');
  });

  test('should shut down correctly', () => {
    app.initialize();
    expect(app.initialized).toBe(true);
    
    app.shutdown();
    expect(app.initialized).toBe(false);
  });
});

describe('calculateNextVersion', () => {
  test('should calculate next major version', () => {
    expect(calculateNextVersion('1.2.3', 'major')).toBe('2.0.0');
    expect(calculateNextVersion('0.1.0', 'major')).toBe('1.0.0');
  });
  
  test('should calculate next minor version', () => {
    expect(calculateNextVersion('1.2.3', 'minor')).toBe('1.3.0');
    expect(calculateNextVersion('1.0.0', 'minor')).toBe('1.1.0');
  });
  
  test('should calculate next patch version', () => {
    expect(calculateNextVersion('1.2.3', 'patch')).toBe('1.2.4');
    expect(calculateNextVersion('1.0.0', 'patch')).toBe('1.0.1');
  });
  
  test('should return current version for unknown release type', () => {
    expect(calculateNextVersion('1.2.3', 'unknown')).toBe('1.2.3');
  });
});