![Alt Text](https://github.com/lann87/cloud_infra_eng_ntu_coursework_alanp/blob/main/.misc/ntu_logo.png)  
# Assignment 2.5 - Deployment of RDS with Terraform.  
## Individual - Brief  

### Objective: The objective of this assignment is to gain a deeper understanding of AWS Database as a Service (DBaaS) offerings and how they can be used in different use cases.  

# 1: Research on AWS Databases  
Research and investigate the various AWS DBaaS offerings, including RDS, DynamoDB, and Aurora.   

### Amazon Relational Database Service(RDS)  
- Managed relational database service.  
- Supports multiple database engines: MySQL, PostgreSQL, Oracle, SQL Server, MariaDB and Amazon Aurora.  
- Handles management tasks like provisioning, patching, backup, failure detection, recovery, and repair.  
- Offers multi-AZ deployments, reading replicas, and automated backups.  

### Amazon DynamoDB  
- Fully managed NoSQL database services, that supports key-value, and document data models.  
- Designed for applications that demands high performances, automatic scaling, and 99.999% availability.  

### Amazon Aurora  
- High performance and availability of enterprise level databases, combined with simplicity and cost effectiveness of open sourced databases.  
- Compatible with popular databases such as MySQL and PostgreSQL, provides automatic protection from data loss, enhance security features through isolation, encryption, and IAM.  


# 2: Create an AWS RDS  

### AWS console RDS terraform deployment summary page  
![Alt Text](https://github.com/lann87/cloud_infra_eng_ntu_coursework_alanp/blob/main/module2/assignment2.5/alanp-rds-tf-summary.png)  

### AWS console RDS terraform deployment configuration page
![Alt Text](https://github.com/lann87/cloud_infra_eng_ntu_coursework_alanp/blob/main/module2/assignment2.5/alanp-rds-tf-config.png)  

### AWS CLI RDS terraform deployment   
![Alt Text](https://github.com/lann87/cloud_infra_eng_ntu_coursework_alanp/blob/main/module2/assignment2.5/alanp-rds-tf-cli.png)  

### RDS Terraform deployment files  

- rds.tf  
```tf
resource "aws_db_instance" "alanp-rds-asm25" {
  allocated_storage    = 5
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t3.micro"
  db_name              = "alanprdsdb"
  username             = "alanp"
  password             = "password123"
 # parameter_group_name = "default.mysql"
  skip_final_snapshot = "true"


  vpc_security_group_ids = [aws_security_group.rds_sg.id]
  db_subnet_group_name   = aws_db_subnet_group.rds_subnet_group.name
}
```  

- network.tf  
```tf
resource "aws_db_subnet_group" "rds_subnet_group" {
  name       = "rds-subnet-group"
  subnet_ids = ["subnet-024b7de5056c50b1d", "subnet-0292ef33cff12f834"]

  tags = {
    Name = "rds-subnet-group"
  }
}

resource "aws_security_group" "rds_sg" {
  name        = "rds-security-group"
  description = "Allow database traffic"
  vpc_id      = "vpc-092bbea6ea28b7d0d"

  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/16"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "rds-security-group"
  }
}
```  

- provider.tf  
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

### References:  
[AWS RDS](https://aws.amazon.com/rds/features/)  
[AWS DynamoDB](https://aws.amazon.com/dynamodb/features/)  
[AWS Aurora MySQL/PostgreSQL](https://aws.amazon.com/rds/aurora/features/)  
[Choosing the right AWS DB](https://www.projectpro.io/article/aws-databases-/904)
