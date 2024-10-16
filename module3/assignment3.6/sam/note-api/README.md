# Create a serverless Note-Taking API using SAM

Objective: The goal of this activity is to create a serverless API using the Serverless Framework, which allows users to perform CRUD (Create, Read, Update, and Delete) operations on notes.

## Requirements:

Set up the SAM cli and configure AWS credentials.


Implement the following RESTful API endpoints using AWS Lambda and API Gateway:

```

POST /notes: Create a new note.
GET /notes: Retrieve all notes.
GET /notes/{id}: Retrieve a specific note by its ID.
PUT /notes/{id}: Update a specific note by its ID.
DELETE /notes/{id}: Delete a specific note by its ID.

Use DynamoDB as the datastore for the notes.
```
Deploy the serverless application on AWS.

Test the API endpoints using any REST client like Postman or CURL.

Provide a detailed report documenting the implemented solution, architecture, and any challenges faced.



#### References:
SAM CLI documentation: https://docs.aws.amazon.com/serverless-application-model/latest/developerguide/serverless-sam-cli-command-reference.html

AWS SAM resource and property reference: https://docs.aws.amazon.com/serverless-application-model/latest/developerguide/sam-specification-resources-and-properties.html