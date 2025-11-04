# ------------------ RDS Outputs ------------------ #

output "primary_rds_identifier" {
  description = "Primary RDS DB Identifier"
  value       = aws_db_instance.mysql_rds.identifier
}

output "primary_rds_endpoint" {
  description = "Primary RDS Endpoint"
  value       = aws_db_instance.mysql_rds.endpoint
}

output "replica_rds_identifier" {
  description = "Replica RDS DB Identifier"
  value       = aws_db_instance.mysql_rds_replica.identifier
}

output "replica_rds_endpoint" {
  description = "Replica RDS Endpoint"
  value       = aws_db_instance.mysql_rds_replica.endpoint
}
