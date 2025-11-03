#================= OUTPUTS FOR VPC MODULE =================#

output "vpc_id" {
  value = aws_vpc.name.id
}

output "public_subnet1_id" {
  value = aws_subnet.public1.id
}

output "private_subnet1_id" {
  value = aws_subnet.private1.id
}

output "security_group_id" {
  value = aws_security_group.name.id
}
