const { jestConfig } = require('@salesforce/sfdx-lwc-jest/config');

module.exports = {
    ...jestConfig,
    // LWC Jest covers LWC/Aura only. The React UI Bundle has its own runners:
    // Vitest for unit tests and Playwright for e2e.
    modulePathIgnorePatterns: [
        '<rootDir>/.localdevserver',
        '<rootDir>/force-app/main/default/uiBundles'
    ],
    testPathIgnorePatterns: [
        '/node_modules/',
        '<rootDir>/force-app/main/default/uiBundles'
    ]
};
