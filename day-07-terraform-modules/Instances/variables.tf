variable "ami_id" {
    default = ""
    type = string
  
}

variable "instance_type" {
    default = ""
    type = string
  
}


variable "public_subnet_id" {
    default = ""
    type = string
  
}
variable "private_subnet_id" {
    default = ""
    type = string
  
}
variable "public_instance_name" {
    default = ""
    type = string
  
}
variable "private_instance_name" {
    default = ""
    type = string
  
}

variable "security_group_id" {
    default = ""
    type = string
  
}

variable "associate_public_ip" {
  description = "Whether to assign a public IP"
  type        = bool
  default     = false
}