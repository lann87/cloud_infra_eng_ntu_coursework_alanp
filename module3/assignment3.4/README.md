![Alt Text](https://github.com/lann87/cloud_infra_eng_ntu_coursework_alanp/blob/main/.misc/ntu_logo.png)  

# Assignment 3.4 - Cloud Native Application Containerization I

## Individual Assignment - Docker and EC2 Deployment using Terraform

**Date**: 09 Oct  
**Author**: Alan Peh  

**Building upon Assignment 3.3, we extended our deployment to AWS cloud infrastructure using Terraform modules (VPC, EC2, ALB) for Infrastructure as Code. This demonstrates cloud-native deployment practices by automating infrastructure provisioning and application deployment to AWS EC2, complete with networking and security configurations.**  

## Summary  

**CLI Curl**
![Alt Text](https://github.com/lann87/cloud_infra_eng_ntu_coursework_alanp/blob/main/module3/assignment3.4/resource/a3.4-ec2-ssh-cli-curl.png)

**Console EC2 Deployment**
![Alt Text](https://github.com/lann87/cloud_infra_eng_ntu_coursework_alanp/blob/main/module3/assignment3.4/resource/a3.4-ec2-summ.png)

## Implementation Steps

### 1. Docker Configuration

**Dockerfile**  

```dockerfile
FROM node:18-alpine

WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .

EXPOSE 8082

CMD ["node", "index.js"]
```

### 2. Local Docker Testing

```bash
# Build image
docker build -t my-node-app .

# Verify image
docker images

# Run container
docker run -dp 8082:8082 my-node-app

# Test application
curl localhost:8082
```

### 3. Deployment Process  

1. **Initialize Terraform**  

   ```bash
   terraform init
   terraform plan
   terraform apply
   ```

2. **Verify Deployment**  

   ```bash
   # Get EC2 public IP
   terraform output public_ip

   # Test application
   curl http://<public-ip>:8082
   ```

### 4. Project Structure  

```sh
project/
├── app/
│   ├── index.js
│   ├── package.json
│   └── Dockerfile
├── terraform/
│   ├── main.tf
│   ├── modules/
│   │   ├── alb/
│   │   │   ├── alb.tf
│   │   │   └── variables.tf
│   │   ├── ec2/
│   │   │   ├── ec2.tf
│   │   │   ├── outputs.tf
│   │   │   └── variables.tf
│   │   └── vpc/
│   │       ├── network.tf
│   │       ├── outputs.tf
│   │       ├── security.tf
│   │       ├── variables.tf
│   │       └── vpc.tf
│   └── .terraform.lock.hcl
├── docker-check.yml
├── terraform-cicd.yml
└── README.md
```

### 5. Simple Code checks  

**docker-check.yaml**  

```yaml
name: Docker CI

on:
  push:
    branches:
    - main

env:
  IMAGE_NAME: alanp-dimage
  IMAGE_TAG: ${{ github.sha }}

jobs:
  build:
    runs-on: ubuntu-latest

    steps:
    - name: Checkout code
      uses: actions/checkout@v4

    - name: Set up Docker Buildx
      uses: docker/setup-buildx-actions@v3

    - name: Dockerhub Login
      uses: docker/login-actions@v3
      with:
        username: ${{ secrets.DOCKER_USERNAME }}
        password: ${{ secrets.DOCKER_PASSWORD }}

    - name: Build Docker Image
      run: |
        docker build . -t ${{ env.IMAGE_NAME }}:${{ env.IMAGE_TAG }}

    - name: Push Docker Image
      run: |


    - name: Docker Container Testing
      run: docker run . -t
```

**terraform-checks.yaml**  

```yaml
name: Terraform Checks

on:
  push:
    branches: [ main ]
    paths: [ '**.tf' ]
  pull_request:
    branches: [ main ]
    paths: [ '**.tf' ]

env:
  TF_LOG: INFO
  AWS_REGION: 'us-east-1'

jobs:
  terraform:
    name: Terraform
    runs-on: ubuntu-latest

    steps:
    - uses: actions/checkout@v4

    - name: Setup Terraform
      uses: hashicorp/setup-terraform@v3
      with:
        terraform_version: "1.6.0"

    - name: Setup TFLint
      uses: terraform-linters/setup-tflint@v4
      with:
        tflint_version: v0.50.0

    - name: Run TFLint
      run: |
        tflint --init
        tflint -f compact

    - name: Configure AWS Credentials
      uses: aws-actions/configure-aws-credentials@v4
      with:
        aws-access-key-id: ${{ secrets.AWS_ACCESS_KEY_ID }}
        aws-secret-access-key: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
        aws-region: ${{ env.AWS_REGION }}

    - name: Terraform Init
      run: terraform init

    - name: Terraform Format Check
      run: terraform fmt -check

    - name: Terraform Plan
      if: github.event_name == 'pull_request'
      run: terraform plan -no-color

    - name: Terraform Apply
      if: github.ref == 'refs/heads/main' && github.event_name == 'push'
      run: terraform apply -auto-approve
```

## Best Practices

1. **Infrastructure**
   - Use private subnets for non-public resources
   - Implement proper security group rules
   - Use proper IAM roles and policies
   - Enable VPC flow logs

2. **Docker**
   - Use specific image versions
   - Implement multi-stage builds
   - Scan images for vulnerabilities
   - Use .dockerignore

3. **Security**
   - Restrict security group access
   - Use SSH key pairs
   - Keep OS and packages updated
   - Store sensitive data in AWS Secrets Manager

## Testing Steps
1. Local testing with Docker
2. Infrastructure deployment with Terraform
3. Application verification on EC2
4. Security group validation
5. Connectivity testing

Remember to clean up resources after testing:
```bash
terraform destroy
```