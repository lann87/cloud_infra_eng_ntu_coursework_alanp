![Alt Text](https://github.com/lann87/cloud_infra_eng_ntu_coursework_alanp/blob/main/.misc/ntu_logo.png)  

# DevSecOps - Assignment 3.6 - Cloud Native Application Serverless I

## Individual Assignment - Serverless Deployment of Application

**Date**: 16 Oct  
**Author**: Alan Peh  

This project involves deploying a serverless application to AWS using the Serverless Framework. The application includes a simple website interacting with a DynamoDB table, and local testing is done with `serverless-offline`. 

Tools: AWS Lambda, API Gateway, DynamoDB, and Serverless Framework.

## Deployment Files

**index.js**  
Contains the Lambda function that logs "Hello There! Alan" and returns a success message upon execution.  

**serverless.yml**  
Defines the service, AWS provider details, Lambda function configuration, HTTP API integration, and DynamoDB table resource with a single email attribute as the partition key.  

**index.js**

```js
module.exports.handler = async (event) => {
    // write hello world to the logs
    console.log("Hello There! Alan");
    // assign a value to a variable
    let message = "Go Serverless v4.4.6! Your function executed successfully!";

    return {
        statusCode: 200,
        body: JSON.stringify(
            {
                message: message,
                input: event,
            },
            null,
            2
        ),
    };
};
```

**serverless.yml**

```yml
org: alanpntusctp # Organization name for Serverless framework
app: ap-serverless-i # Application name in Serverless framework

stages:
  dev:
    observability: true # Enable observability (e.g., logging, metrics, traces) for the dev stage

service: alanp-aws-node-http-api-project # Service name for the project
frameworkVersion: '4' # Specifies the Serverless framework version to use

provider:
  name: aws # Cloud provider is AWS
  runtime: nodejs18.x # Specifies Node.js 18.x runtime for Lambda functions
  region: us-east-1
#  profile: serverless # AWS CLI profile to use for deployment

functions:
  hello: # Define a Lambda function called 'hello'
    handler: index.handler # The file and method to be invoked for this function
    events:
    - httpApi: # Event trigger is HTTP API
        path: / # Function is triggered when the root path is accessed
        method: get # HTTP GET method to trigger the function

# Insert raw CloudFormation (resources, outputs…) in the deployed template
resources:
  Resources:
    usersTable: # Define a DynamoDB table named 'usersTable'
      Type: AWS::DynamoDB::Table # Specifies the resource type as a DynamoDB table
      Properties:
        TableName: apusersTable # DynamoDB table name
        AttributeDefinitions: # Define attributes of the table
        - AttributeName: email # The email attribute serves as the key
          AttributeType: S # 'S' indicates the attribute type is a string
        KeySchema: # Define the primary key schema
        - AttributeName: email # The primary key is the 'email' attribute
          KeyType: HASH # 'HASH' specifies the partition key
        ProvisionedThroughput: # Set read and write capacity for the table
          ReadCapacityUnits: 1 # 1 unit for read capacity
          WriteCapacityUnits: 1 # 1 unit for write capacity

plugins:
- serverless-offline # Plugin to run the Serverless framework locally for testing
```

## Successful Serverless Deployment

**Application on serverless.com**
![Alt Text](https://github.com/lann87/cloud_infra_eng_ntu_coursework_alanp/blob/main/module3/assignment3.6/resources/16oct-serverless-websiteapp.png)

**Curling the application hosted on CDK**
![Alt Text](https://github.com/lann87/cloud_infra_eng_ntu_coursework_alanp/blob/main/module3/assignment3.6/resources/16oct-serverless-curl2.png)

## Serverless installation & deployment steps

**1. Installation**
![Alt Text](https://github.com/lann87/cloud_infra_eng_ntu_coursework_alanp/blob/main/module3/assignment3.6/resources/16oct-serverless-serverlessinstallation.png)

**2. Plugin Installation**
![Alt Text](https://github.com/lann87/cloud_infra_eng_ntu_coursework_alanp/blob/main/module3/assignment3.6/resources/16oct-serverless-plugininstall.png)

**3. Login into Serverless on CLI**
![Alt Text](https://github.com/lann87/cloud_infra_eng_ntu_coursework_alanp/blob/main/module3/assignment3.6/resources/16oct-serverless-logincli.png)

**4. Deployment of Application**
![Alt Text](https://github.com/lann87/cloud_infra_eng_ntu_coursework_alanp/blob/main/module3/assignment3.6/resources/16oct-serverless-deploy.png)

**5. Removal of Application**
![Alt Text](https://github.com/lann87/cloud_infra_eng_ntu_coursework_alanp/blob/main/module3/assignment3.6/resources/16oct-serverless-remove.png)

## Deployment Highlights

- The Serverless Framework handles the deployment of AWS resources.  
- A DynamoDB table (apusersTable) is provisioned with minimal read/write capacity for efficient data storage.  
- Local testing is done with the serverless-offline plugin, ensuring development without full deployment.  
