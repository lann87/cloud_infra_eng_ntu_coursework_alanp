# Output of VPC & public subnet details

output "vpc_id" {
  description = "ID of VPC"
  value       = aws_vpc.main_vpc.id
}

output "public_subnet_1a_id" {
  description = "ID of Subnet 1a"
  value       = aws_subnet.public_subnet_1a.id
}

output "public_subnet_1b_id" {
  description = "ID of subnet 1b"
  value       = aws_subnet.public_subnet_1b.id
}

output "public_subnet_1c_id" {
  description = "ID of subnet 1c"
  value       = aws_subnet.public_subnet_1c.id
}