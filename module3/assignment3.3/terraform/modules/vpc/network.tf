# Public subnets
resource "aws_subnet" "public_subnet_1a" {
  vpc_id      = aws_vpc.main_vpc
  cidr_block  = var.public_subnet_1a_cidr
  
  tags = {
    Name      = "${var.vpc_name}-public-1a"
  }  
}

resource "aws_subnet" "public_subnet_1b" {
  vpc_id      = aws_vpc.main_vpc
  cidr_block  = var.public_subnet_1b_cidr
  
  tags = {
    Name      = "${var.vpc_name}-public-1b"
  }  
}

resource "aws_subnet" "public_subnet_1c" {
  vpc_id      = aws_vpc.main_vpc
  cidr_block  = var.public_subnet_1c_cidr
  
  tags = {
    Name      = "${var.vpc_name}-public-1c"
  }  
}

# Private subnets
resource "aws_subnet" "private_subnet_1a" {
  vpc_id      = aws_vpc.main_vpc
  cidr_block  = var.private_subnet_1a_cidr
  
  tags = {
    Name      = "${var.vpc_name}-private-1a"
  }  
}

resource "aws_subnet" "private_subnet_1b" {
  vpc_id      = aws_vpc.main_vpc
  cidr_block  = var.private_subnet_1b_cidr
  
  tags = {
    Name      = "${var.vpc_name}-private-1b"
  }  
}

resource "aws_subnet" "private_subnet_1c" {
  vpc_id      = aws_vpc.main_vpc
  cidr_block  = var.private_subnet_1c_cidr
  
  tags = {
    Name      = "${var.vpc_name}-private-1c"
  }  
}

# Routetable for public subnets
resource "aws_route_table" "public_routetable" {
  vpc_id        = aws_vpc.main_vpc.id

  route {
    cidr_block  = "0.0.0.0/0"
    gateway_id  = aws_internet_gateway.igw.id
  }

  tags = {
    Name        = "${var.vpc_name}-public-routetable"
  }
}

# Routetable association for public subnets
resource "aws_route_table_association" "public_rt_assoc_1a" {
    subnet_id       = aws_subnet.public_subnet_1a.id
    route_table_id  = aws_route_table.public_routetable.id  
}

resource "aws_route_table_association" "public_rt_assoc_1b" {
    subnet_id       = aws_subnet.public_subnet_1b.id
    route_table_id  = aws_route_table.public_routetable.id  
}

resource "aws_route_table_association" "public_rt_assoc_1c" {
    subnet_id       = aws_subnet.public_subnet_1c.id
    route_table_id  = aws_route_table.public_routetable.id  
}