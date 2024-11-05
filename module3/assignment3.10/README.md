![Alt Text](https://github.com/lann87/cloud_infra_eng_ntu_coursework_alanp/blob/main/.misc/ntu_logo.png)  

# DevSecOps - Assignment 3.10 - Continuous Integration

## Individual Assignment - Implement CI with Terraform

**Date**: 30 Oct  
**Author**: Alan Peh  

## Simple DevOps Pipeline Setup Guide  

This project sets up a simple DevOps pipeline to automate infrastructure management and application deployment using GitHub Actions.  
Key components include Terraform configurations for AWS resources, a Docker containerized application, and CI/CD workflows for code quality checks, Docker image building, and security scanning.  
By leveraging automated checks and resource provisioning, the pipeline ensures efficient and secure development and deployment practices.

### 1. Structure  

Directories for Terraform, Docker, and workflows, automating infrastructure management and containerized application deployment.  

```sh
.
├── terraform/
│   ├── main.tf      # S3 bucket configuration
│   └── backend.tf   # AWS provider configuration
├── docker/
│   ├── Dockerfile          # Defines container setup for app
│   ├── index.js            # Main entry point for app
│   ├── index.test.js       # Test for app logic
│   ├── package-lock.json   # Locks exact versions of dependencies
│   └── package.json        # List app metadata and dependencies
├── .github/
│   └── workflows/
│       ├── checkov.yaml            # CI pipeline
│       ├── docker-checks.yaml      # CD pipeline
│       ├── terraform-checks.yaml   # Performs fmt/init/validate/lint on pull request
│       └── terraform-plan.yaml     # TF plan on PRs to main, init and configuring AWS.
├── resource/
│   └── screenshots
└── README.md
```

### 2. Terraform files  

Configures a simple AWS S3 bucket and backend state storage.  

**main.tf**  

```sh
terraform {
  required_version = ">= 1.6"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

resource "aws_s3_bucket" "my_bucket" {
  #checkov:skip=CKV_AWS_18:Ensure the S3 bucket has access logging enabled
  #checkov:skip=CKV2_AWS_61:Ensure that an S3 bucket has a lifecycle configuration
  #checkov:skip=CKV2_AWS_62:Ensure S3 buckets should have event notifications enabled
  #checkov:skip=CKV_AWS_145:Ensure that S3 buckets are encrypted with KMS by default
  #checkov:skip=CKV2_AWS_6:Ensure that S3 bucket has a Public Access block
  #checkov:skip=CKV_AWS_144:Ensure that S3 bucket has cross-region replication enabled
  #checkov:skip=CKV_AWS_21:Ensure all data stored in the S3 bucket have versioning enabled
  bucket        = "ap-simple-cicd-bucket-30oct"
  force_destroy = true
}
```

**backend.tf**  

```sh
terraform {
  backend "s3" {
    bucket = "sctp-ce7-tfstate"
    key    = "terraform-simple-cicd-action-ap-30oct.tfstate"
    region = "us-east-1"
  }
}
```

### 3. GitHub Actions Workflows  

**Workflows Summmary**  

![Alt Text](https://github.com/lann87/30oct-ap-cicd-pipeline/blob/main/resource/30oct-github-workflows-sum.png)

**Pull Request**  

![Alt Text](https://github.com/lann87/30oct-ap-cicd-pipeline/blob/main/resource/30oct-pullrequest.png)

**checkov.yaml**  

```yaml
name: Terraform CI  # Workflow name

on: 
  push:             # Trigger this workflow on any push event to any branch

jobs:
  terraform-ci:     # Job name
    runs-on: ubuntu-latest    # Use the latest Ubuntu runner for the job
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
        uses: aws-actions/configure-aws-credentials@v4
        with:
          aws-access-key-id: ${{ secrets.AWS_ACCESS_KEY_ID }}         # AWS access key stored as secret
          aws-secret-access-key: ${{ secrets.AWS_SECRET_ACCESS_KEY }} # AWS secret key stored as secret
          aws-region: us-east-1                                       # Set AWS region (replace if needed)

      ## Step 3: Set up Terraform in the environment
      - name: Set up Terraform
        uses: hashicorp/setup-terraform@v2

      ## Step 4: Initialize Terraform
      # This will download and configure any required providers and modules
      - name: Terraform init
        run: terraform init

      ## Step 5: Run Terraform fmt
      # Performs a code formatting check on the terraform files
      - name: Terraform Format
        run: terraform fmt -check
```

**docker-checks.yaml**  

```yaml
# Workflow name that appears in GitHub Actions UI
name: Docker Build and Test

# Define when this workflow should run
on:
  pull_request:
    branches:
      - main    # Only trigger on PRs targeting main branch
    paths:
      - 'docker/*'    # Only trigger when files in docker directory change

jobs:
  # First job: Run unit tests for the code
  code-unit-testing:
    runs-on: ubuntu-latest    # Use latest Ubuntu runner
    outputs:
      status: ${{ job.status }}    # Export job status for build summary
    defaults:
      run:
        working-directory: docker    # Set default working directory for all steps
    steps:
      - name: Check out repository code
        uses: actions/checkout@v4.1.5    # Clone the repository

      - name: Run installation of dependencies commands
        run: npm install    # Install Node.js dependencies

      - name: Run unit testing command
        run: npm test    # Execute unit tests

  # Second job: Build Docker image and scan for vulnerabilities
  build-and-scan-image:
    runs-on: ubuntu-latest
    needs: [code-unit-testing]    # Wait for unit tests to pass
    outputs:
      status: ${{ job.status }}    # Export job status for build summary
    defaults:
      run:
        working-directory: docker
    steps:
      - name: Check out repository code
        uses: actions/checkout@v4.1.5

      # Configure AWS credentials for potential ECR usage
      - name: Configure AWS credentials
        uses: aws-actions/configure-aws-credentials@v4
        with:
          aws-access-key-id: ${{ secrets.AWS_ACCESS_KEY_ID }}
          aws-secret-access-key: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
          aws-region: us-east-1

      # Build and tag the Docker image
      - name: Docker build and tag
        run: docker build -t simple-docker-image:latest .

      # Authenticate with GitHub Container Registry
      - name: Authenticate with GH Packages
        env:
          GHCR_PAT: ${{ secrets.GITHUB_TOKEN }}    # Use GitHub's automatic token
        run: echo "${GHCR_PAT}" | docker login ghcr.io -u ${{ github.actor }} --password-stdin

      # Scan the Docker image for vulnerabilities using Trivy
      - name: Run image scan
        uses: aquasecurity/trivy-action@master
        with:
          image-ref: 'simple-docker-image:latest'    # Image to scan
          format: 'table'    # Output format
          ignore-unfixed: true    # Skip vulnerabilities without fixes
          vuln-type: 'os,library'    # Types of vulnerabilities to scan
          severity: 'MEDIUM,HIGH,CRITICAL'    # Severity levels to include
          output: 'docker-image-scan.json'    # Save results to file

      # Upload scan results as an artifact
      - name: Upload Docker Trivy Report
        uses: actions/upload-artifact@v4.3.0
        with:
          name: docker-image-scan
          path: docker-image-scan.json

  # Final job: Create a summary of all jobs
  build_summary:
    needs: [code-unit-testing, build-and-scan-image]    # Wait for both previous jobs
    runs-on: ubuntu-latest
    steps:
      # Create a markdown summary of job statuses
      - name: Adding markdown
        run: |
          # Get status of previous jobs
          CODE_UNIT_STATUS="${{ needs.code-unit-testing.outputs.status }}"
          DOCKER_SCAN_STATUS="${{ needs.build-and-scan-image.outputs.status }}"
          
          # Create markdown table for job status summary
          echo '## 🚀 Preparing Build Summary 🚀' >> $GITHUB_STEP_SUMMARY
          echo '' >> $GITHUB_STEP_SUMMARY
          echo "| Job Name | Status |" >> $GITHUB_STEP_SUMMARY
          echo "|-----------------|--------|" >> $GITHUB_STEP_SUMMARY
          echo "| code-unit-testing | $CODE_UNIT_STATUS |" >> $GITHUB_STEP_SUMMARY
          echo "| docker-scan | $DOCKER_SCAN_STATUS |" >> $GITHUB_STEP_SUMMARY
```

**terraform-checks.yaml**  

```yaml
name: Terraform Checks

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

**terraform-plan.yaml**  

```yaml
name: Terraform Plan

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

### Additions - Github Credential Personal Access Token for Trivy  

![Alt Text](https://github.com/lann87/30oct-ap-cicd-pipeline/blob/main/resource/30oct-pat-trivy-cicd.png)

![Alt Text](https://github.com/lann87/30oct-ap-cicd-pipeline/blob/main/resource/30oct-pat-for-trivy.png)
