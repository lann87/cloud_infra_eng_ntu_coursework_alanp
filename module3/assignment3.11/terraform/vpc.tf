# VPC and Internet Gateway Configuration - Sets up the primary networking infrastructure

resource "aws_vpc" "main_vpc" {
  #checkov:skip=CKV2_AWS_11:Ensure VPC flow logging is enabled in all VPCs
  #checkov:skip=CKV2_AWS_12:Ensure the default security group of every VPC restricts all traffic
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "ce7-ap-main-vpc"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main_vpc.id

  tags = {
    Name = "ce7-ap-igw"
  }
}

# data "aws_vpc" "main_vpc" {
#   # Retrieves the details of the created VPC using its ID
#   id = aws_vpc.main_vpc.id
# }
