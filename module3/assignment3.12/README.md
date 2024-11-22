![Alt Text](https://github.com/lann87/cloud_infra_eng_ntu_coursework_alanp/blob/main/.misc/ntu_logo.png)  

# DevSecOps - Assignment 3.12 - Continuous Deployment Serverless

## Individual Assignment - Implement CI with Terraform

**Date**: 6 Nov  
**Author**: Alan Peh  

## Lambda deployment with Terraform and CICD pipeline

This project demonstrates the implementation of a CI/CD pipeline for a serverless AWS Lambda function, utilizing Terraform for infrastructure as code and GitHub Actions for automation.  

### 1. Structure  

Directories for Terraform, Python, and workflows, automating infrastructure management and Lambda functions.  

```sh
.
├── terraform/
│   ├── lambda.tf       # Defines AWS Lambda function configuration
│   ├── iam.tf          # IAM roles and policies required for Lambda
│   ├── provider.tf     # Sets up AWS provider and TF dependencies
│   ├── backend.tf      # S3 backend for TF state storage
│   └── output.json     # Lambda function invocation output
├── python/
│   ├── lambda_function.py      # Python code for Lambda function logic
│   └── lambda_function.zip     # Zipped Python code and dependencies for Lambda deployment
├── .github/
│   └── workflows/
│       ├── checkov.yaml        # Security scans with Checkov on TF code
│       ├── ci-lambda.yaml      # Continuous Integration: Terraform fmt/init/validate/lint on pull requests
│       └── cd-lambda.yaml      # Continuous Deployment: Terraform plan on PRs, apply on merge to main
├── resource/
│   └── screenshots             # Folder for screenshots, e.g., for documentation
└── README.md                   # Documentation for the project and submission
```

### 2. GitHub Actions Workflows  

GitHub Actions Workflows: Three workflows - Checkov (security scans), CI-Lambda (Terraform fmt/init/validate/lint), and CD-Lambda (Terraform plan on PRs, apply on merge to main). 

**Workflows Summmary**  

![Alt Text](https://github.com/lann87/6nov_lambda_cicd/blob/main/resource/6nov-workflows-sum.png)

**Lambda invoke and output**  

![Alt Text](https://github.com/lann87/6nov_lambda_cicd/blob/main/resource/6nov-lambda-invoke-output.png)

**checkov.yaml**  

```yaml
name: Checkov-lambda

on:
    pull_request:
        branches: ["main"]  # Trigger the workflow for pull requests targeting the 'main' branch
        paths:
            - 'terraform/*'  # Only trigger the workflow when files within the 'terraform' directory are modified

jobs:
    Checkov:
        runs-on: ubuntu-latest
        defaults:
            run:
                working-directory: terraform  # Set the working directory to 'terraform' for the steps below

        steps:
        -   name: Checkov  # Step to check out the code from the repository
            uses: actions/checkout@v3  # Uses GitHub's official checkout action to pull the code

        -   name: Checkov  # Step to run Checkov to perform static analysis on Terraform code
            uses: bridgecrewio/checkov-action@master  # Uses the official Checkov GitHub action
            with:
                framework: terraform  # Specifies that Checkov should analyze Terraform code
```

**ci-lambda.yaml**  

```yaml
name: Terraform CI

# Trigger this workflow on pull requests to the main branch, only when files in the terraform directory change
on:
  pull_request:
    branches: [ "main" ]
    paths:
      - 'terraform/*'

jobs:
  Terraform-Checks:
    runs-on: ubuntu-latest

    # Set the working directory for all run commands to the terraform directory
    defaults:
      run:
        working-directory: terraform

    steps:
      # Check out the repository's code
      - name: Checkout
        uses: actions/checkout@v3

      # Set up Terraform for use in the workflow
      - name: Setup Terraform
        uses: hashicorp/setup-terraform@v2

      # Check Terraform code formatting
      - name: Terraform fmt check
        id: fmt
        run: terraform fmt -check

      # Initialize Terraform without configuring the backend
      - name: Terraform init
        run: terraform init -backend=false

      # Validate the Terraform configuration
      - name: Terraform Validate
        id: validate
        run: terraform validate -no-color

      # Set up TFLint for Terraform linting
      - uses: terraform-linters/setup-tflint@v3
        with:
          tflint_version: latest

      # Show the installed TFLint version
      - name: Show version
        run: tflint --version

      # Initialize TFLint to download rules and configure it
      - name: Init TFLint
        run: tflint --init

      # Run TFLint to check for issues in Terraform code
      - name: Run TFLint
        run: tflint -f compact
```

**cd-lambda.yaml**  

```yaml
name: Terraform CD

# Trigger this workflow on pull requests to the main branch, only when files in the terraform directory change
on:
  pull_request:
    branches: [ "main" ]
    paths:
      - 'terraform/*'

jobs:
  Terraform-Plan:
    runs-on: ubuntu-latest

    # Set the working directory for all run commands to the terraform directory
    defaults:
      run:
        working-directory: terraform

    steps:
      # Check out the repository's code
      - name: Checkout
        uses: actions/checkout@v4

      # Set up Terraform for use in the workflow
      - name: Setup Terraform
        uses: hashicorp/setup-terraform@v3

      # Configure AWS credentials using secrets for authentication
      - name: Configure AWS credentials
        uses: aws-actions/configure-aws-credentials@v2
        with:
          aws-access-key-id: ${{ secrets.AWS_ACCESS_KEY_ID }}
          aws-secret-access-key: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
          aws-region: us-east-1

      # Initialize Terraform, setting up the environment and loading configurations
      - name: Terraform Init
        run: terraform init

      # Generate and display the Terraform execution plan
      - name: Terraform Plan
        run: terraform plan
```

### 3. Terraform & Python files  

Terraform configurations for an AWS Lambda function, IAM roles/policies, provider and backend setup, and an SNS dead-letter queue. A Python script defines the Lambda logic.  

**lambda.tf**  

```tf
resource "aws_lambda_function" "ap-lambda-fn" {
  #checkov:skip=CKV_AWS_117:Ensure that AWS Lambda function is configured inside a VPC
  function_name = "ap-lambda-function-6nov"
  runtime       = "python3.10"
  role          = aws_iam_role.lambda_exec_role.arn
  handler       = "lambda_function.lambda_handler"

  # Configure code signing for additional security
  code_signing_config_arn = aws_lambda_code_signing_config.ap-lambda-codesigning.arn

  # Set max number of concurrent executions
  reserved_concurrent_executions = 50

  # Configure dead letter queue for failed invocations
  dead_letter_config {
    target_arn = aws_sns_topic.lambda_dead_letter_topic.arn
  }

  # Enable active tracing for better obervability
  tracing_config {
    mode = "Active"
  }

  # Specify location of the lambda function code
  filename         = "${path.module}/../python/lambda_function.zip"
  source_code_hash = filebase64sha256("${path.module}/../python/lambda_function.zip")
}

# Creating code signing configuration for the lambda function
resource "aws_lambda_code_signing_config" "ap-lambda-codesigning" {
  allowed_publishers {
    signing_profile_version_arns = [aws_signer_signing_profile.ap-lambda-signerprof.arn]
  }
}

# Creating a signing profile for the lambda function
resource "aws_signer_signing_profile" "ap-lambda-signerprof" {
  name_prefix = "apsigner"
  platform_id = "AWSLambda-SHA384-ECDSA"
}

# Creating SNS topic for the lambda function's dead letter queue
resource "aws_sns_topic" "lambda_dead_letter_topic" {
  name              = "lambda-dead-letter-topic"
  kms_master_key_id = "alias/aws/sns"
}
```

**iam.tf**  

```
resource "aws_iam_role" "lambda_exec_role" {
  name = "lambda_exec_role"

  # Define the trust policy to allow Lambda to assume the role
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect    = "Allow"
      Principal = { Service = "lambda.amazonaws.com" }
      Action    = "sts:AssumeRole"
    }]
  })
}

# Define inline policy to allow Lambda function to publish to SNS topic
# This is a mandatory res for dead letter queue functionality
resource "aws_iam_role_policy" "sns_publish_policy" {
  name = "SNSPublishPolicy"
  role = aws_iam_role.lambda_exec_role.name

  # Specify the policy document to grant necessary permissions
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow",
        Action   = "sns:Publish",
        Resource = aws_sns_topic.lambda_dead_letter_topic.arn
      }
    ]
  })
}



# Attached AWS managed policy for basic Lambda execution permission
resource "aws_iam_role_policy_attachment" "name" {
  role       = aws_iam_role.lambda_exec_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}
```

**provider.tf**  

```tf
terraform {
  required_version = ">= 1.6"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}
provider "aws" {
  region = "us-east-1"
}
```

**backend.tf**  

```tf
terraform {
  backend "s3" {
    bucket = "sctp-ce7-tfstate"
    key    = "terraform-simple-cicd-action-ap-30oct.tfstate"
    region = "us-east-1"
  }
}
```

**output.json**  

```json
{"statusCode": 200, "body": "\"Good day, Alan!! I cannot wait to go to Tokyo for my holidays in December!!\""}
```

**lambda_function.py**  

```py
import json
import boto3

def lambda_handler(event, context):
    notification = 'Good day, {}!! I cannot wait to go to {} for my holidays in {}!!'.format(event['name'], event['city'], event['month'])
    print(notification)
    return {
        'statusCode': 200,
        'body': json.dumps(notification)
    }
```

### Terraform Apply and Destroy  

Screenshots demonstrate successful apply and destroy actions.  

**Terraform Apply**  

![Alt Text](https://github.com/lann87/6nov_lambda_cicd/blob/main/resource/6nov-tf-apply.png)

**Terraform Destroy**  

![Alt Text](https://github.com/lann87/6nov_lambda_cicd/blob/main/resource/6nov-tf-destroy.png)
