data "aws_vpc" "default" {
  default = true
}

# Security group config
resource "aws_security_group" "alanp-sg-a2" {
    name = var.sg_name
    description = "Security Group To Allow SSH from my IP range(s)"
    vpc_id = data.aws_vpc.default.id

    ingress {
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["119.56.99.20/32"]
    }

#Outbound for SG
    egress {
        from_port           = 0
        to_port             = 0
        protocol            = "-1"
        cidr_blocks         = ["0.0.0.0/0"]
        ipv6_cidr_blocks    = ["::/0"]
    }
}