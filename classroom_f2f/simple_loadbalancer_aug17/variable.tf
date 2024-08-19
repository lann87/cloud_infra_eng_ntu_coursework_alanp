variable "ami_id" {
  description = "AMI ID"
  type = string
  default = "ami-098143f68772b34f5"
}

variable "ec2_name" {
  description = "Name of EC2"
  type = string
  default = "alanp-ec2-lb"
}

variable "instance_type" {
  description = "EC2 Instance type"
  type = string
  default = "t2.micro"
}

variable "key_name" {
  description = "Name of EC2 Key Pair"
  type = string
  default = "alan_ce_useast1" # ssh keypair that has .pem extension
}

variable "sg_name" {
  description = "Name of EC2 Security Group"
  type = string
  default = "alanpLBSecurityGroup"
}