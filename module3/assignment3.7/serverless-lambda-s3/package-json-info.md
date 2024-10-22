{
 // Basic project information
 "name": "serverless-lambda-s3",
 "version": "1.0.0",
 "description": "This project demonstrates how the Serverless Framework can be used to deploy a NodeJS Lambda function that responds to events in an S3 bucket.",
 "main": "handler.js",

 // NPM scripts
 "scripts": {
   "format": "prettier --write '**/**.{js,json,css,md}'",  // Format all files using prettier
   "test": "echo \"Error: no test specified\" && exit 1"    // Placeholder for tests
 },

 // Project keywords for NPM
 "keywords": [
   "serverless",
   "framework",
   "aws",
   "lambda",
   "node",
   "s3",
   "csv",
   "fixed",
   "flat"
 ],

 // Author and license information
 "author": "",
 "license": "ISC",

 // Production dependencies
 "dependencies": {
   "fixy": "^1.2.0",      // Library for fixed-width file handling
   "papaparse": "^4.6.3"  // Library for CSV parsing
 },

 // Development dependencies
 "devDependencies": {
   "aws-sdk": "^2.424.0",     // AWS SDK for local development
   "dotenv": "^7.0.0",        // Environment variable management
   "husky": "^1.3.1",         // Git hooks management
   "lint-staged": "^8.1.5",   // Run scripts on staged files
   "prettier": "^1.16.4"      // Code formatting tool
 },

 // Husky configuration for git hooks
 "husky": {
   "hooks": {
     "pre-commit": "lint-staged"  // Run lint-staged before commits
   }
 },

 // Lint-staged configuration
 "lint-staged": {
   "**/**.{js,json,css,md}": [   // Files to process
     "prettier --write",          // Format files
     "git add"                    // Add formatted files back to staging
   ]
 }
}