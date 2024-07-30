# EC2 Configuration
resource "aws_instance" "alannp-ec2-a2" {
  ami = "ami-0b72821e2f351e396"
  instance_type = "t2.micro"
  key_name = "alan_ce_useast1"
  subnet_id = "alanp-public-subnet-1a"
  associate_public_ip_address = true
  vpc_security_group_ids = aws_security_group.alanp-sg-a2.id

  tags = {
    Names = "alanp-ec2-a2"
  }
}