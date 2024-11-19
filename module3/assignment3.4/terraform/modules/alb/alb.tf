# Application Load Balancer module
resource "aws_alb" "app_alb" {
  name = "alanp-app-lb"
  internal = false
  load_balancer_type = "application"
  security_groups = [var.security_group_id]
  subnets = var.public_subnets

  tags = {
    Name = "alanp-app-load-balancer"
  }
}

# Listener for ALB
resource "aws_lb_listener" "http_listener" {
  load_balancer_arn = aws_alb.app_alb.arn
  port = "80"
  protocol = "HTTP"

  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.app_tg.arn
  }
}

# Target group for EC2
resource "aws_lb_target_group" "app_tg" {
  name = "ap-app-tg"
  port = 80
  protocol = "HTTP"
  vpc_id = var.vpc_id

  health_check {
    path = "/"
  }
}

# EC2 register with ALB
resource "aws_lb_target_group_attachment" "svr_instance" {
  target_group_arn = aws_lb_target_group.app_tg.arn
  target_id = var.svr_instance_id
  port = 80
}