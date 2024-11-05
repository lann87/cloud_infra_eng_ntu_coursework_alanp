![Alt Text](https://github.com/lann87/cloud_infra_eng_ntu_coursework_alanp/blob/main/.misc/ntu_logo.png)  

# DevSecOps - Assignment 3.9 - Introduction to DevOps

## Individual Assignment - Create a simple DevOps pipeline

**Date**: 28 Oct  
**Author**: Alan Peh  

## Simple DevOps Pipeline Setup Guide

This project demonstrates setting up a DevOps pipeline that automates AWS S3 bucket creation using Terraform, integrated with CI/CD workflows managed by GitHub Actions.

### 1. Terraform Structure  

Organized files for AWS S3 bucket setup and provider configurations, with directories for CI/CD workflows.  

```sh
.
├── terraform/
│   ├── S3.tf            # S3 bucket configuration
│   ├── providers.tf     # AWS provider configuration
├── .github/
│   └── workflows/
│       ├── ci.yaml      # CI pipeline
│       └── cd.yaml      # CD pipeline
└── README.md
```

**s3.tf**  

```tf
resource "aws_s3_bucket" "s3-bucket" {
  bucket = "ap-simple-devops-bucket"

  tags = {
    Name        = "28oct-ap-simple-devops-bucket"
    Environment = "dev"
  }
}
```

**provider.tf**  

```tf
terraform {
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

### 2. GitHub Actions Workflows  

CI pipeline checks code format and initializes Terraform; CD pipeline deploys infrastructure.  

**Workflows**
![Alt Text](https://github.com/lann87/28oct-ap-simple-devops-pipeline/blob/main/resources/as3.9-ghawf-cicd.png)

**CI**
![Alt Text](https://github.com/lann87/28oct-ap-simple-devops-pipeline/blob/main/resources/as3.9-ci.png)

**CD**
![Alt Text](https://github.com/lann87/28oct-ap-simple-devops-pipeline/blob/main/resources/as3.9-cd.png)
**ci.yaml**  

```yaml
name: Terraform CI

on: 
  push:             # Trigger this workflow on any push event to any branch

jobs:
  terraform-ci:
    runs-on: ubuntu-latest
    outputs:
        status: ${{ job.status }}
    defaults:
        run:
            working-directory: terraform

    steps:
      ## Step 1: Checkout the code from the repository
      - name: Checkout repository
        uses: actions/checkout@v4

      ## Step 2: Configure AWS credentials for Terraform to access AWS resources
      - name: Configure AWS credentials
        uses: aws-actions/configure-aws-credentials@v2
        with:
          aws-access-key-id: ${{ secrets.AWS_ACCESS_KEY_ID }}         # AWS access key stored as secret
          aws-secret-access-key: ${{ secrets.AWS_SECRET_ACCESS_KEY }} # AWS secret key stored as secret
          aws-region: us-east-1                                       # Set AWS region (replace if needed)

      ## Step 3: Set up Terraform in the environment
      - name: Set up Terraform
        uses: hashicorp/setup-terraform@v3

      ## Step 4: Initialize Terraform
      # This will download and configure any required providers and modules
      - name: Terraform init
        run: terraform init

      ## Step 5: Run Terraform fmt
      # Check Terraform code formatting
      - name: Terraform Format
        run: terraform fmt -check

```

**cd.yaml**  

```yaml
name: Terraform CD

on:
  push:
    branches:
      - main      # Trigger CD on push to the main branch

jobs:
  terraform-cd:
    runs-on: ubuntu-latest
    outputs:
        status: ${{ job.status }}
    defaults:
        run:
            working-directory: terraform # Telling GH Actions where to look for the TF files

    steps:
      ## Step 1: Checkout the code from the repository
      - name: Checkout repository
        uses: actions/checkout@v4

      ## Step 2: Configure AWS credentials for deployment
      - name: Configure AWS credentials
        uses: aws-actions/configure-aws-credentials@v2
        with:
          aws-access-key-id: ${{ secrets.AWS_ACCESS_KEY_ID }}         # AWS access key stored as secret
          aws-secret-access-key: ${{ secrets.AWS_SECRET_ACCESS_KEY }} # AWS secret key stored as secret
          aws-region: us-east-1                                       # Set AWS region (replace if needed)

      ## Step 3: Set up Terraform
      - name: Set up Terraform
        uses: hashicorp/setup-terraform@v3

      ## Step 4: Initialize Terraform
      - name: Terraform init
        run: terraform init

      ## Step 5: Apply the changes
      - name: Terraform Apply
        run: terraform apply --auto-approve   # Apply changes with auto-approval

```

### 3. AWS S3 Deployed via CI/CD Pipeline

A streamlined DevOps pipeline combining Terraform for infrastructure as code and GitHub Actions for automated deployments.  

**S3**
![Alt Text](https://github.com/lann87/28oct-ap-simple-devops-pipeline/blob/main/resources/as3.9-s3.png)
