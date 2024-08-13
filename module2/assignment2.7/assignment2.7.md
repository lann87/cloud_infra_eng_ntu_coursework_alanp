![Alt Text](https://github.com/lann87/cloud_infra_eng_ntu_coursework_alanp/blob/main/.misc/ntu_logo.png)
# Assignment 2.7 - Security Groups
### Individual assignment

## Brief:  
**The objective of this assignment is to gain a deeper understanding of AWS security groups**
> Instructions:
>    Open AWS Console
>    Create a new EC2 instance with a new security group:
>        Name: “"yourname"SSHSecurityGroup”
>        Description: “Security Group To Allow SSH from my IP range(s)”
>        VPC: < Choose Any >
>        Inbound Rules: - Type: SSH - Protocol: TCP - Source: My IP

**Finding out address of My IP:**
![Alt Text](https://github.com/lann87/cloud_infra_eng_ntu_coursework_alanp/blob/main/module2/assignment2.7/ss_myIP.png)

**Security group attributes**
![Alt Text](https://github.com/lann87/cloud_infra_eng_ntu_coursework_alanp/blob/main/module2/assignment2.7/ss_tf_sgGroup_attributes.png)

**Security group launched using Terraform**
![Alt Text](https://github.com/lann87/cloud_infra_eng_ntu_coursework_alanp/blob/main/module2/assignment2.7/ss_tf-apply_sg_asmt.png)

Terraform HCL files:
1.  compute
```sh
resource "aws_instance" "alanp_ec2_sg" {
  ami = data.aws_ami.amz_linux_2.id
  instance_type = var.instance_type
  key_name = var.key_name
  vpc_security_group_ids = [aws_security_group.alanp-sg-a2.id]

  tags = {
    Name = var.ec2_name
  }
}

data "aws_ami" "amz_linux_2" {
  most_recent = true

  filter {
    name = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
  
  owners = ["137112412989"]
}

output "ami_info" {
  value = data.aws_ami.amz_linux_2.id
}
```

2. network
```sh
data "aws_vpc" "default" {
  default = true
}

# Security group config
resource "aws_security_group" "alanp-sg-a2" {
    name = var.sg_name
    description = "Security Group To Allow SSH from my IP range(s)"
    vpc_id = data.aws_vpc.default.id

    ingress {
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["119.56.99.20/32"]
    }

#Outbound for SG
    egress {
        from_port           = 0
        to_port             = 0
        protocol            = "-1"
        cidr_blocks         = ["0.0.0.0/0"]
        ipv6_cidr_blocks    = ["::/0"]
    }
}
```

3. Variables
```sh
variable "ami_id" {
  description = "AMI ID"
  type = string
  default = "ami-098143f68772b34f5"
}

variable "ec2_name" {
  description = "Name of EC2"
  type = string
  default = "alanp-ec2-sg"
}

variable "instance_type" {
  description = "EC2 Instance type"
  type = string
  default = "t2.micro"
}

variable "key_name" {
  description = "Name of EC2 Key Pair"
  type = string
  default = "alan_ce_useast1" # ssh keypair that has .pem extension
}

variable "sg_name" {
  description = "Name of EC2 Security Group"
  type = string
  default = "alanpSSHSecurityGroup"
}
```

4. provider
```sh
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