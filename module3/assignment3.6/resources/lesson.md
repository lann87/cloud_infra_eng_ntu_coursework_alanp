## Brief

### Self Study Check In

Q1: What is serverless computing platform provided by Amazon, Azure and GCP?

Q2: What is the usage example of serverless application?

### Preparation

Write about any preparations needed for the lesson, such as tools, installations, prior-knowledge, etcs.

### Lesson Overview

Serverless is a cloud-native development model that allows developers to build and run applications without having to manage servers.


There are still servers in serverless, but they are abstracted away from app development. A cloud provider handles the routine work of provisioning, maintaining, and scaling the server infrastructure. Developers can simply package their code in containers for deployment.


Once deployed, serverless apps respond to demand and automatically scale up and down as needed. Serverless offerings from public cloud providers are usually metered on-demand through an event-driven execution model. As a result, when a serverless function is sitting idle, it doesn’t cost anything.

---

## Part 1 - Serverless Framework Concepts

### Functions

The code of a serverless application is deployed and executed in AWS Lambda functions.

Each function is an independent unit of execution and deployment, like a microservice. A function is merely code, deployed in the cloud, that is most often written to perform a single job such as:

- Saving a user to the database
- Processing a file in a database
- Performing a scheduled task

### Events

Functions are triggered by events. Events come from other AWS resources, for example:

- An HTTP request on an API Gateway URL (e.g. for a REST API)
- A new file uploaded in an S3 bucket (e.g. for an image upload)
- A CloudWatch schedule (e.g. run every 5 minutes)
- A message in an SNS topic
- A CloudWatch alert
- And more...

When you configure an event on a Lambda function, Serverless Framework will automatically create the infrastructure needed for that event (e.g. an API Gateway endpoint) and configure your functions to listen to it.


### Resources

Resources are AWS infrastructure components which your functions use such as:

- A DynamoDB table (e.g. for saving users/posts/comments data)
- An S3 bucket (e.g. for saving images or files)
- An SNS topic (e.g. for sending messages asynchronously)
- Anything that can be defined in CloudFormation is supported by the Serverless Framework
- Serverless Framework can deploy functions and their events, but also AWS resources.


### Services

A service is the Framework's unit of organization. You can think of it as a project file, though you can have multiple services for a single application.

A service is configured via a serverless.yml file where you define your functions, events and AWS resources to deploy. It looks like this:

When deploying with the Framework via `serverless deploy`, everything in the configuration file is deployed at once.


### Activity

Let spend 10 - 20 mins to configure and install all these requirements.

- Create account in serverless.com
- Install serverless locally
- Configure serverless account locally
- Configure AWS CLI (Check if you done it before)

Documentations: 
- https://www.serverless.com/framework/docs/getting-started
- https://www.serverless.com/framework/docs/providers/aws/guide/credentials

---

## Part 2 - Instructor Demo First Serverless Application

```
# Create a new serverless project
serverless

# Move into the newly created directory
cd your-service-name
```

Invoke Serverless Function

```
serverless invoke -f hello

# Invoke and display logs:
serverless invoke -f hello --log
```

Remove serverless function

```
serverless remove
```


Install Serverless Offline

```
npm install serverless-offline --save-dev
```

Add serverless offline on `serverless.yml`

```
plugins:
  - serverless-offline
```
---

## Part 3 - Learners Create First Serverless Application

Learners try to create first serverless application

<img width="454" alt="image" src="https://user-images.githubusercontent.com/106639884/208630619-8c267082-c2a8-4f82-8546-67664cc1a540.png">
