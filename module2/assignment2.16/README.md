![Alt Text](https://github.com/lann87/cloud_infra_eng_ntu_coursework_alanp/blob/main/.misc/ntu_logo.png)   
# Assignment 2.16 - Deployment of SNS Topic using Terraform.  

## Terraform deployment of SNS Topic as shown on CLI.  
![Alt Text](https://github.com/lann87/cloud_infra_eng_ntu_coursework_alanp/blob/main/module2/assignment2.16/TF_sns_topic_deployment.png)  

## Terraform .tf files for deployment.  

### provider.tf   
```tf
provider "aws" {
  region = "us-east-1"
}
```   

### main.tf  
```tf
module "sns_topics" {
  source = "./modules"
}
```  

### backend.tf  
```tf
terraform {
    backend "s3" {
        bucket = "sctp-ce7-tfstate"
        key = "terraform-ec2-alanp-modules-4sep.tfstate"
        region = "us-east-1"
    }
}
```   

## Modules  

### main.tf   
```tf
# sns messaging modules

resource "aws_sns_topic" "cart_topic" {
  name = "${var.cart}-sns-topic"
}

resource "aws_sns_topic" "alert_topic" {
  name = "${var.alert}-sns-topic"
}
```   

### variables.tf   
```tf
#modules variables

variable "cart" {
  type = string
  default = "shopee-alanp"
}

variable "alert" {
  type = string
  default = "low-disk-space"
}
```  