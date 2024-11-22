![Alt Text](https://github.com/lann87/cloud_infra_eng_ntu_coursework_alanp/blob/main/.misc/ntu_logo.png)  

# DevSecOps - Assignment 3.11 - Continuous Deployment Container

## Individual Assignment - ECS Container Deployment with Terraform

**Date**: 4 Nov  
**Author**: Alan Peh  

## Project Overview  

Implementation of containerized application deployment using AWS ECS with Terraform IaC and GitHub Actions for automation. The setup includes VPC networking, load balancing, and container orchestration.  

## Implementation Details

### 1. Infrastructure Components  

```sh
VPC (ce7-ap-main_vpc)
├── 3 Public Subnets (ce7-ap-pubsubnet-[1,2,3])
├── 3 Private Subnets (ce7-ap-pvtsub-[1,2,3])
├── Internet Gateway (ce7-ap-igw)
└── Route Tables
    └── ce7-ap-routetable
```

![Alt Text](https://github.com/lann87/4nov-ecs-cicd/blob/main/resource/4nov-ecs-cicd-resourcemap.png)

### 2. Resource Creation  

1. ECR Repository  
2. VPC and Subnets  
3. Internet Gateway  
4. Load Balancer  
![Alt Text](https://github.com/lann87/4nov-ecs-cicd/blob/main/resource/4nov-ecs-cicd-alb.png)
5. ECS Service  
![Alt Text](https://github.com/lann87/4nov-ecs-cicd/blob/main/resource/4nov-ecs-cicd-cluster.png)

**Terraform Apply**  

```sh
terraform apply --auto-approve  # Creates the underlying terraform infrastructure and auto approves the processe
```

![Alt Text](https://github.com/lann87/4nov-ecs-cicd/blob/main/resource/4nov-ecs-applysumm.png)

### 3. Key Outputs  

```tf
alb_dns_name = "nov4-ap-alb-116424073.us-east-1.elb.amazonaws.com"
ecr_repository_url = "nov4_ecs_ecr"
vpc_id = "vpc-0c2b590b92f9acde1"
```

### 4. CI/CD Pull Request

**Checkov, CI, CD**  
![Alt Text](https://github.com/lann87/4nov-ecs-cicd/blob/main/resource/4nov-ecs-pullreq-ghworkflows.png)

## Cleanup  

```sh
terraform destroy  # Automatically removes all created resources
```

![Alt Text](https://github.com/lann87/4nov-ecs-cicd/blob/main/resource/4nov-ecs-cicd-destroy.png)

Note: Resource creation takes approximately 4 minutes for full deployment. Monitor ECS service logs for deployment status.

## ECS deployment with Terraform and CICD pipeline  

This project demonstrate the implmentation of a CI/CD pipeline for ECS, using Terraform IaC and GitHub Actions for workflow automation.  

### Structure

```sh
.
├── terraform/
│   ├── ecs.tf       # AWS ECS function configuration
│   ├── ecr.tf          # AWS ECR Repository function configuration
│   ├── vpc.tf     # Sets up AWS provider and TF dependencies
│   ├── network.tf      # S3 backend for TF state storage
│   ├── alb.tf      # S3 backend for TF state storage
│   ├── provider.tf      # S3 backend for TF state storage
│   └── backend.tf     # Lambda function invocation output
├── python/
│   ├── lambda_function.py      # Python code for Lambda function logic
│   └── lambda_function.zip     # Zipped Python code and dependencies for Lambda deployment
├── .github/
│   └── workflows/
│       ├── checkov.yaml        # Security scans with Checkov on TF code
│       ├── ci-ecs-4nov.yaml    # Continuous Integration: Terraform fmt/init/validate/lint on pull requests
│       └── cd-ecs-4nov.yaml    # Continuous Deployment: Terraform plan on PRs, apply on merge to main
├── resource/
│   └── screenshots             # Folder for screenshots, e.g., for documentation
└── README.md                   # Documentation for the project and submission
```
