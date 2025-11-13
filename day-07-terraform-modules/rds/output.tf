output "rds_endpoint" {
  description = "The RDS instance endpoint"
  value       = aws_db_instance.rds.endpoint
}

output "rds_identifier" {
  description = "RDS instance identifier"
  value       = aws_db_instance.rds.id
}
