# Module to create EC2 instance within an existing VPC

# Defining ec2 resources
resource "aws_instance" "main_ec2" {
  ami             = data.aws_ami.amazon_linux_2.id
  instance_type   = var.instance_type
  subnet_id       = var.subnet_id

  # Assign security grouip
  security_groups = [var.security_group_id]

  # SSH Key for access
  key_name        = var.key_name

  tags = {
    Name          = "alanp-ec2mod"
  }
}

# EC2 Data Source for AMZ Linux 2
data "aws_ami" "amazon_linux_2" {
  most_recent     = true

  filter {
    name          = "name"
    values        = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }

  filter {
    name          = "virtualization-type"
    values        = ["hvm"]
  }

  owners = ["amazon"]
}