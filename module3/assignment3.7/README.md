![Alt Text](https://github.com/lann87/cloud_infra_eng_ntu_coursework_alanp/blob/main/.misc/ntu_logo.png)  

# DevSecOps - Assignment 3.7 - Cloud Native Application Serverless II

## Individual Assignment - Serverless, Lambda function, and Cloudwatch logs

**Date**: 21 Oct  
**Author**: Alan Peh  

This project involves deploying a serverless application to AWS using the Serverless Framework. The application includes a simple website interacting with a DynamoDB table, and local testing is done with `serverless-offline`.  

Tools: AWS Lambda, API Gateway, DynamoDB, and Serverless Framework.

## Deployment Files

**index.js**  
Contains the Lambda function that logs "Hello There! Alan" and returns a success message upon execution.  

**serverless.yml**  
Defines the service, AWS provider details, Lambda function configuration, HTTP API integration, and DynamoDB table resource with a single email attribute as the partition key.  

**handler.js**

```js
'use strict'

// Import required dependencies
const util = require('util')
const AWS = require('aws-sdk')
const Fixy = require('fixy')              // Library for fixed-width file handling
const Papa = require('papaparse')         // Library for CSV parsing
const fixySchema = require('./schema.js') // Import fixed-width format schema
const s3 = new AWS.S3()                   // Initialize S3 client

// Main Lambda function to process CSV files
module.exports.processCSV = async (event, context) => {
   // Extract bucket and file information from the S3 event
   const csvBucket = event.Records[0].s3.bucket.name
   const csvKey = event.Records[0].s3.object.key
   const fixedWidthBucket = process.env.FIXED_WIDTH_BUCKET
   const fixedWidthKey = csvKey.replace('.csv', '.txt')  // Change file extension for output

   try {
       // Load the CSV file from S3
       const response = await s3
           .getObject({ Bucket: csvBucket, Key: csvKey })
           .promise()

       /* Data Transformation Process:
        * 1. Read CSV from S3
        * 2. Parse CSV to array
        * 3. Convert to fixed-width format
        * 4. Save to output bucket
        */
       
       // Convert S3 object to string and parse CSV
       const csvString = response.Body.toString()
       const parsedData = Papa.parse(csvString).data
       const headers = parsedData.shift()  // Remove and store header row

       // Helper function to convert array rows to objects with header keys
       // Example Input: ['Josh', 'Stevens', 'josh@gmail.com', '123-456-7890']
       // Example Output: { First: 'Josh', Last: 'Stevens', Email: 'josh@gmail.com', Phone: '123-456-7890' }
       const mappingFunc = row => {
           let dataObj = {}
           for (let i = 0; i < headers.length; i++) {
               dataObj[headers[i]] = row[i]
           }
           return dataObj
       }

       // Transform all rows and convert to fixed-width format
       const fixyData = parsedData.map(mappingFunc)
       const fixedWidthString = Fixy.unparse(fixySchema, fixyData)

       // Save the transformed fixed-width file to output S3 bucket
       await s3
           .putObject({
               Bucket: fixedWidthBucket,
               Key: fixedWidthKey,
               Body: fixedWidthString
           })
           .promise()

   } catch (error) {
       console.error(error)  // Log any errors that occur during processing
   }
}
```

**schema.js**

```js
// Default configuration for all fields - sets padding settings
const defaultConfig = {
   padding_position: 'end',     // Add padding at the end of each field
   padding_symbol: ' '          // Use space as padding character
}

// Export array defining the fixed-width file structure
module.exports = [
   {
       name: 'First',           // First name field
       width: 20,               // Allocate 20 characters
       ...defaultConfig         // Use default padding config
   },
   {
       name: 'Last',            // Last name field
       width: 20,               // Allocate 20 characters  
       ...defaultConfig         // Use default padding config
   },
   {
       name: 'Email',           // Email address field
       width: 50,               // Allocate 50 characters
       ...defaultConfig         // Use default padding config
   },
   {
       name: 'Phone',           // Phone number field
       width: 18,               // Allocate 18 characters
       ...defaultConfig         // Use default padding config
   }
]

/* 
This configuration defines a fixed-width format where:
- Each field is padded with spaces at the end
- First and Last name get 20 characters each
- Email gets 50 characters
- Phone gets 18 characters
Total width of each record: 108 characters
*/
```

**serverless.yml**

```yml
# Main service name
service: alan-serverless-lambda-s3

# AWS provider configuration
provider:
  name: aws
  runtime: nodejs18.x    # Using Node.js 18 runtime
  region: us-east-1     # Deploy to US East 1 region
  stage: production     # Deployment stage

  # IAM role configuration for Lambda
  iam:
    role:
      statements:
        # Grant full S3 permissions to Lambda
        - Effect: Allow
          Action:
            - s3:*
          Resource: "*"   # Allows access to all S3 resources

# Lambda function definitions
functions:
  processCSV:
    name: alanprocessCSV
    handler: handler.processCSV    # Points to processCSV function in handler.js
    events:
      # Trigger Lambda when new files are created in S3
      - s3:
          bucket: alan-serverless-bucket-input
          event: s3:ObjectCreated:*
          rules:
            - suffix: .csv    # Only trigger for CSV files

    # Environment variables available to Lambda
    environment:
      # Reference to output bucket name defined below
      FIXED_WIDTH_BUCKET: ${self:resources.Resources.fixedwidth.Properties.BucketName}
      NODE_ENV: production

# AWS Resources to be created
resources:
  Resources:
    # Output S3 bucket definition
    fixedwidth:
      Type: AWS::S3::Bucket
      Properties:
        BucketName: alan-serverless-bucket-output
```

## Cloudwatch and Lambda function on S3 bucket

**Cloudwatch Logs**
![Alt Text](https://github.com/lann87/Cloud-native-application-II-lambda/blob/main/resource/as3-7-serverless-cloudwatch-logs.png)

**S3 bucket input/output**
![Alt Text](https://github.com/lann87/Cloud-native-application-II-lambda/blob/main/resource/as3-7-serverless-bucket-input.png)  
![Alt Text](https://github.com/lann87/Cloud-native-application-II-lambda/blob/main/resource/as3-7-serverless-bucket-output.png)

## Installation & deployment steps

**1. Installation**
![Alt Text](https://github.com/lann87/Cloud-native-application-II-lambda/blob/main/resource/as3-7-serverless-cli-start.png)

**2. Deployment**
![Alt Text](https://github.com/lann87/Cloud-native-application-II-lambda/blob/main/resource/as3-7-serverless-cli-ci.png)

**3. Removal of Application**
![Alt Text](https://github.com/lann87/Cloud-native-application-II-lambda/blob/main/resource/as3-7-serverless-cli-remove.png)


## Deployment Highlights

- The Serverless Framework handles the deployment of AWS resources.  
- A DynamoDB table (apusersTable) is provisioned with minimal read/write capacity for efficient data storage.  
- Local testing is done with the serverless-offline plugin, ensuring development without full deployment.  
