resource "aws_instance" "alanp_ec2_sg" {
  ami = data.aws_ami.amz_linux_2.id
  instance_type = var.instance_type
  key_name = var.key_name
  vpc_security_group_ids = [aws_security_group.alanp-sg-a2.id]

  tags = {
    Name = var.ec2_name
  }
}

data "aws_ami" "amz_linux_2" {
  most_recent = true

  filter {
    name = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
  
  owners = ["137112412989"]
}

output "ami_info" {
  value = data.aws_ami.amz_linux_2.id
}