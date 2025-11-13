variable "allocated_storage" {
  description = "The allocated storage in GBs"
  type        = number
  default     = 20
}

variable "engine" {
  description = "Database engine type"
  type        = string
  default     = "mysql"
}

variable "engine_version" {
  description = "Database engine version"
  type        = string
  default     = "8.0"
}

variable "instance_class" {
  description = "The instance type of the RDS instance"
  type        = string
  default     = "db.t3.micro"
}

variable "db_name" {
  description = "The name of the database to create"
  type        = string
}

variable "username" {
  description = "Master username"
  type        = string
}

variable "password" {
  description = "Master password"
  type        = string
  sensitive   = true
}

variable "parameter_group_name" {
  description = "Name of the DB parameter group"
  type        = string
  default     = "default.mysql8.0"
}

variable "subnet_group_name" {
  description = "Name of the DB subnet group"
  type        = string
  default     = "rds-subnet-group"
}

variable "skip_final_snapshot" {
  description = "Whether to skip final snapshot on destroy"
  type        = bool
  default     = true
}

variable "private_subnet1_id" {
  description = "Private subnet 1 ID"
  type        = string
}

variable "private_subnet2_id" {
  description = "Private subnet 2 ID"
  type        = string
}

variable "security_group_id" {
  description = "Security group ID for RDS"
  type        = string
}

variable "db_instance_name" {
  description = "Tag name for RDS instance"
  type        = string
}
