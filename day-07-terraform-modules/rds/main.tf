# ---------------- RDS Instance ---------------- #
resource "aws_db_instance" "rds" {
  allocated_storage      = var.allocated_storage
  engine                 = var.engine
  engine_version         = var.engine_version
  instance_class         = var.instance_class
  db_name                = var.db_name
  username               = var.username
  password               = var.password
  parameter_group_name   = var.parameter_group_name
  skip_final_snapshot    = var.skip_final_snapshot

  # Place inside private subnet
  db_subnet_group_name   = aws_db_subnet_group.rds_subnet_group.name
  vpc_security_group_ids = [var.security_group_id]

  publicly_accessible    = false

  tags = {
    Name = var.db_instance_name
  }
}

# ---------------- RDS Subnet Group ---------------- #
resource "aws_db_subnet_group" "rds_subnet_group" {
  name       = var.subnet_group_name
  subnet_ids = [var.private_subnet1_id, var.private_subnet2_id]

  tags = {
    Name = var.subnet_group_name
  }
}
