variable "ami_id" {
  description = "AMI ID"
  type = string
  default = "ami-098143f68772b34f5"
}

variable "ec2_name" {
  description = "Name of EC2"
  type = string
  default = "alanp-tf-ec2-a2"
}

variable "instance_type" {
  description = "EC2 Instance Type"
  type = string
  default = "t2.micro"
}

variable "key_name" {
  description = "Name of EC2 Key Pair"
  type = string
  default = "alan_ce_useast1"
}

variable "sg_name" {
  description = "Name of EC2 Security Group"
  type = string
  default = "alanp-sg-a2"
}

variable "vpc_name" {
  description = "Name of VPC to use"
  type = string
  default = "alanp-vpc-a2"
}

variable "subnet_name" {
  description = "Name of subnet to use"
  type = string
  default = "alanp-public-subnet-1a"
}
