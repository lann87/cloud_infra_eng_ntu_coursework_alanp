# Security groups
resource "aws_security_group" "sg_http_ssh" {
  name          = "ap-secgrp-http-ssh"
  description   = "security group for http & ssh"
  vpc_id        = aws_vpc.main_vpc.id

  # Ingress rule for HTTP & SSH
  ingress = {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_block  = ["0.0.0.0/0"] # Allow HTTP from everywhere
  }
  
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Allow SSH access from anywhere
  }

  # Egress rule for all outbound traffic
  egress = {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "ap-sg-http-ssh"
  }
}