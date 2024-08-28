![Alt Text](https://github.com/lann87/cloud_infra_eng_ntu_coursework_alanp/blob/main/.misc/ntu_logo.png)  
# Assignment 2.3 - Developers Tool  
## Individual assignment - Create your own AWS S3 Bucket
Alan Peh

### S3 Bucket deployed on AWS Console
![Alt Text](https://github.com/lann87/cloud_infra_eng_ntu_coursework_alanp/blob/main/module2/assignment2.3/alanp_s3_creation_awsconsole.png)   

### S3 Bucket deployed using Terraform
![Alt Text](https://github.com/lann87/cloud_infra_eng_ntu_coursework_alanp/blob/main/module2/assignment2.3/alanp_s3_terraform.png)

### S3 Terraform Code
```tf
resource "aws_s3_bucket" "alanp_s3_tf_deployment" {
  bucket = "alanp-s3-a3-donotdelete"
}

# ACL Config
#resource "aws_s3_bucket_acl" "alanp_s3_tf_acl" {
#  bucket = aws_s3_bucket.alanp_s3_tf_deployment.bucket
#  acl = "private"
#}

# Server side encryption config
resource "aws_s3_bucket_server_side_encryption_configuration" "alanp_s3_tf_encryption" {
  bucket = aws_s3_bucket.alanp_s3_tf_deployment.bucket

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

# Versioning config
resource "aws_s3_bucket_versioning" "alanp_s3_tf_versioning" {
  bucket = aws_s3_bucket.alanp_s3_tf_deployment.id

    # Enabled versioning to track version of object in same bucket
  versioning_configuration {
    status = "Enabled"
  }
}
```   

### Provision Terraform Code
```tf
terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}
```

