#---------------- VPC ----------------#
output "vpc_id" {
  value = aws_vpc.name.id
}

#---------------- Internet Gateway ----------------#
output "internet_gateway_id" {
  value = aws_internet_gateway.name.id
}

#---------------- Elastic IP ----------------#
output "elastic_ip_id" {
  value = aws_eip.name.id
}

#---------------- NAT Gateway ----------------#
output "nat_gateway_id" {
  value = aws_nat_gateway.name.id
}

#---------------- Public Subnets ----------------#
output "public_subnet1_id" {
  value = aws_subnet.public1.id
}

output "public_subnet2_id" {
  value = aws_subnet.public2.id
}

# ----------frontend---------- #

output "private_subnet1_id" {
  value = aws_subnet.private1.id
}

output "private_subnet2_id" {
  value = aws_subnet.private2.id
}

# ----------backend---------- #

output "private_subnet3_id" {
  value = aws_subnet.private3.id
}

output "private_subnet4_id" {
  value = aws_subnet.private4.id
}

# ----------rds---------- #

output "private_subnet5_id" {
  value = aws_subnet.private5.id
}

output "private_subnet6_id" {
  value = aws_subnet.private6.id
}

#---------------- Route Tables ----------------#
output "public_route_table_id" {
  value = aws_route_table.name.id
}

output "private_route_table_id" {
  value = aws_route_table.name2.id
}

#---------------- Security Group ----------------#
output "security_group_id" {
  value = aws_security_group.name.id
}
