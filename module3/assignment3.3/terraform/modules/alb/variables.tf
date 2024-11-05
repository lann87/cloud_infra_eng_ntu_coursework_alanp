# ALB Module variables input
variable "vpc_id" {
  description = "ID of VPC"
  type        = string
}

variable "public_subnets" {
  description = "List of public subnets"
  type        = list(string)
}

variable "security_group_id" {
  description = "SG for ALB"
  type        = string
}

variable "svr_instance_id" {
  description = "ID of EC2 instance"
  type        = string
}
