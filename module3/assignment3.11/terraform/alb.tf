# Create an Application Load Balancer (ALB)
resource "aws_alb" "nov4_alb" {
  #checkov:skip=CKV_AWS_2:Ensure ALB protocol is HTTPS
  #checkov:skip=CKV_AWS_150:Ensure that Load Balancer has deletion protection enabled
  #checkov:skip=CKV_AWS_91:Ensure the ELBv2 (Application/Network) has access logging enabled
  #checkov:skip=CKV_AWS_378:Ensure AWS Load Balancers doesn't use HTTP protocol
  #checkov:skip=CKV2_AWS_20:Ensure that ALB redirects HTTP requests into HTTPS ones
  #checkov:skip=CKV2_AWS_28:Ensure public facing ALB are protected by WAF

  name                       = var.alb_name
  internal                   = false
  load_balancer_type         = "application"
  drop_invalid_header_fields = true

  # Attach the ECS security group to the ALB for access control
  security_groups = [aws_security_group.ecs_sg.id]

  # Specify the subnets the ALB will be associated with (public subnets)
  subnets = aws_subnet.pub_subnets[*].id

  # Tags for the ALB, useful for identification and management

  tags = {
    Name = var.alb_name
  }
}

# Data source to retrieve the details of the ALB created above
# data "aws_alb" "nov4_alb_data" {
#   name = aws_alb.nov4_alb.name
# }

# Define a listener for the ALB to handle incoming traffic
resource "aws_lb_listener" "nov4_listener" {
  #checkov:skip=CKV_AWS_103:Ensure that load balancer is using at least TLS 1.2
  #checkov:skip=CKV_AWS_2:Ensure ALB protocol is HTTPS
  #checkov:skip=CKV_AWS_378:Ensure AWS Load Balancers doesn't use HTTP protocol

  load_balancer_arn = aws_alb.nov4_alb.arn
  port              = var.alb_listener_port
  protocol          = var.alb_protocol

  # TLS 1.2 for load balancer
  # ssl_policy = "ELBSecurityPolicy-TLS13-1-2-2021-06"

  # Default action for the listener is to forward traffic to a target group
  default_action {
    # Type of action, in this case, forwarding traffic to a target group
    type             = "forward"
    target_group_arn = aws_lb_target_group.nov4_targrp.arn
  }
}

# Define a target group to register targets (e.g., ECS instances)
resource "aws_lb_target_group" "nov4_targrp" {
  #checkov:skip=CKV_AWS_2:Ensure ALB protocol is HTTPS
  #checkov:skip=CKV_AWS_378:Ensure AWS Load Balancers doesn't use HTTP protocol

  name        = "nov4-targrp"
  port        = var.alb_target_port
  protocol    = var.alb_protocol
  target_type = "ip"
  vpc_id      = aws_vpc.main_vpc.id

  # Health check configuration to monitor the health of targets
  health_check {
    interval = 30

    # Path for health check requests
    path = "/"

    # Protocol for health checks (matches the listener protocol)
    protocol            = var.alb_protocol
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }
}

# Data source to retrieve the details of the target group
# data "aws_lb_target_group" "targrp_data" {
#   name = aws_lb_target_group.nov4_targrp.name
# }
