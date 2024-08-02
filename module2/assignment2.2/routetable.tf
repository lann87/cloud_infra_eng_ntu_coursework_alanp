# Public Route Table
resource "aws_route_table" "alanp_rt_pub" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.alanp_igw.id
  }

  tags = {
    Name = "alanp_rt_pub1"
  }
}

# Private Route Table
resource "aws_route_table" "alanp_rt_pvt" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "alanp_rt_pvt1"
  }
}

# Route Table Association connecting pub subnet 1a to Pub RT
resource "aws_route_table_association" "alanp_rta_pub1" {
  subnet_id = aws_subnet.alanp-public-subnet-1a.id
  route_table_id = aws_route_table.alanp_rt_pub.id
}

# RTA connecting pub subnet 1b to Pub RT
resource "aws_route_table_association" "alanp_rta_pub2" {
  subnet_id = aws_subnet.alanp-public-subnet-1b.id
  route_table_id = aws_route_table.alanp_rt_pub.id
}

# RTA connecting pvt subnet 1a to Pvt RT
resource "aws_route_table_association" "alanp_rta_pvt1" {
  subnet_id = aws_subnet.alanp-private-subnet-1a.id
  route_table_id = aws_route_table.alanp_rt_pvt.id
}

# RTA connecting pvt subnet 1b to Pvt RT
resource "aws_route_table_association" "alanp_rta_pvt2" {
  subnet_id = aws_subnet.alanp-private-subnet-1b.id
  route_table_id = aws_route_table.alanp_rt_pvt.id
}