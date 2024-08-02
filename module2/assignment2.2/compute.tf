# EC2 with Variable Configuration
resource "aws_instance" "alannp-ec2-var-a2" {
  ami = var.ami_id
  instance_type = var.instance_type
  key_name = var.key_name
  subnet_id = aws_subnet.alanp-public-subnet-1a.id
  associate_public_ip_address = true
  vpc_security_group_ids = [aws_security_group.alanp-sg-a2.id]

  tags = {
    Names = var.ec2_name
  }
}