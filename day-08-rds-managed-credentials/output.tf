# Primary RDS ARN
output "primary_rds_arn" {
  description = "ARN of the primary RDS instance"
  value       = aws_db_instance.rds.arn
}
