# EC2 with Variable Configuration
resource "aws_instance" "alannp-ec2-var-a2" {
  ami = var.ami_id
  #ami = data.aws_ami.alanp-ec2-datablockpract-a2
  instance_type = var.instance_type
  key_name = var.key_name
  subnet_id = aws_subnet.alanp-public-subnet-1a.id
  associate_public_ip_address = true
  vpc_security_group_ids = [aws_security_group.alanp-sg-a2.id]

  tags = {
    Names = var.ec2_name
  }
}

data "aws_ami" "alanp-ec2-datablockpract-a2" {
  most_recent      = true

  filter {
    name   = "name"
    values = ["al2023-ami-2023*"]
  }
}

output "name" {
  value = data.aws_ami.alanp-ec2-datablockpract-a2.id
}