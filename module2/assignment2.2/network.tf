# Security group config
resource "aws_security_group" "alanp-sg-a2" {
  name = var.sg_name
  vpc_id = data.aws_vpc.vpc_name.id

    ingress {
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port   = 443
        to_port     = 443
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

#Outbound for SG
    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
        ipv6_cidr_blocks    = ["::/0"]
    }
}

data "aws_vpc" "alanp-vpc-a2" {
  filter {
    name = "tag:Name"
    values = [var.vpc_name]
  }
}

data "aws_subnet" "alanp-public-subnet-1a" {
  filter {
    name = "tag:Name"
    values = [var.subnet_name]
  }
}