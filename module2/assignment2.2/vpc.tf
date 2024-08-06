resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = var.vpc_name
  }
}

resource "aws_internet_gateway" "alanp_igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "main-igw"
  }
}

resource "aws_subnet" "alanp-public-subnet-1a" {
  vpc_id                    = aws_vpc.main.id
  cidr_block                = "10.0.1.0/24"
  availability_zone         = "us-east-1a"
  map_public_ip_on_launch   = false
  
  tags = {
    Name = "public-subnet-1a"
  }
}

resource "aws_subnet" "alanp-public-subnet-1b" {
  vpc_id                    = aws_vpc.main.id
  cidr_block                = "10.0.2.0/24"
  availability_zone         = "us-east-1b"
  map_public_ip_on_launch   = true
  
  tags = {
    Name = "public-subnet-1b"
  }
}

resource "aws_subnet" "alanp-private-subnet-1a" {
  vpc_id                    = aws_vpc.main.id
  cidr_block                = "10.0.3.0/24"
  availability_zone         = "us-east-1a"
  
  tags = {
    Name = "private-subnet-1a"
  }
}

resource "aws_subnet" "alanp-private-subnet-1b" {
  vpc_id                    = aws_vpc.main.id
  cidr_block                = "10.0.4.0/24"
  availability_zone         = "us-east-1b"
  
  tags = {
    Name = "private-subnet-1b"
  }
}