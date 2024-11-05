# EC2 Module variable inputs

variable "instance_type" {
  description = "Instance type to use for the EC2"
  type        = string
  default     = "t2.micro"
}

variable "subnet_id" {
  description = "value"
  type        = string
}

variable "key_name" {
  description = "keypair name for SSH"
  type        = string
}

variable "security_group_id" {
  description = "Security group ID for the instance"
  type        = string
}
