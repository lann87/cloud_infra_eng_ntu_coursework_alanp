![Alt Text](https://github.com/lann87/cloud_infra_eng_ntu_coursework_alanp/blob/main/.misc/ntu_logo.png)  

# Assignment 3.13 - AWS Secret Management

## Individual Assignment - Github Actions Workflows Secrets retrieval

**Date**: 11 Nov  
**Author**: Alan Peh  

## Assignment Overview  

Set up AWS Secrets Manager to securely store and manage sensitive information like API keys and credentials.  
Configured IAM policies to control access and integrated the secret retrieval process within a GitHub Actions workflow for use in CI/CD pipelines.  
Verified the configuration to ensure smooth and secure handling of secrets during automated deployments.

### Configured AWS Secrets Manager & Parameter Store  

- Created a secret named alan_favorite_secrets in AWS Secrets Manager to securely store sensitive data.  
- Assigned an encryption key (aws/secretsmanager) and verified the Secret ARN for retrieval.  
- Configured AWS Systems Manager Parameter Store for storing and managing configuration parameters.  

**Configuring Secret on Secret Management**
![Alt Text](https://github.com/lann87/11nov-aws-secrets-manager-example/blob/main/resource/11nov-secretconsole.png)

**Value of Secret stored**
![Alt Text](https://github.com/lann87/11nov-aws-secrets-manager-example/blob/main/resource/11nov-secretvalue.png)

### Secrets Retrieval Using GitHub Actions Workflow

- Set up a GitHub Actions workflow to automate the retrieval of secrets from Secrets Manager.  
- Used the AWS CLI within the workflow to fetch secret values using the get-secret-value command.  
- Parsed the retrieved JSON-formatted secret values for specific keys using tools like jq.  
- Ensured proper IAM permissions (secretsmanager:GetSecretValue) for accessing the secrets securely during the workflow execution.  

**GitHub Actions Workflows Secret Retrieval**
![Alt Text](https://github.com/lann87/11nov-aws-secrets-manager-example/blob/main/resource/11nov-retrievesecret.png)

**GitHub Actions Workflows Params Retrieval**
![Alt Text](https://github.com/lann87/11nov-aws-secrets-manager-example/blob/main/resource/11nov-retrieveparam.png)