# VPC Resources

resource "aws_vpc" "main_vpc" {
  cidr_block = var.vpc_cidr

  # Enabling DNS support for VPC
  enable_dns_support = true
  enable_dns_hostnames = true

  tags = {
    Name = var.vpc_name
  }
}

# Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main_vpc

  tags = {
    Name = "${var.vpc_name}-igw"
  }
}
