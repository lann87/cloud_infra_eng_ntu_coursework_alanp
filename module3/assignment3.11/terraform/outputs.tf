# Output Configuration - Displays key resource information after deployment

output "vpc_id" {
  # Outputs the VPC ID
  value = {
    id   = aws_vpc.main_vpc.id
    name = aws_vpc.main_vpc.tags["Name"]
  }
}

output "pubsub_ids" {
  # Outputs the IDs of the public subnets created
  value = {
    for subnet in aws_subnet.pub_subnets : subnet.tags["Name"] => subnet.id
  }
}

output "pvtsub_ids" {
  # Outputs the IDs of the private subnets created
  value = {
    for subnet in aws_subnet.pvt_subnets : subnet.tags["Name"] => subnet.id
  }
}

output "ecs_sg_id" {
  # Outputs the ID of the ECS security group
  value = aws_security_group.ecs_sg.id
}

output "ecr_repository_url" {
  # Outputs the URL of the ECR repository created for ECS container images
  value = aws_ecr_repository.nov4_ecs_ecr.id
}

output "alb_dns_name" {
  # Outputs the DNS name of the ALB
  value = aws_alb.nov4_alb.dns_name
}

output "alb_target_group_arn" {
  # Outputs the ARN of the ALB target group
  value = aws_lb_target_group.nov4_targrp.arn
}
