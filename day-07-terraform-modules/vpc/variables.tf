#---------VPC-------------#

variable "cidr_block" {
    default = ""
    type = string
  
}

variable "vpc_name" {
    default = ""
}

#----------INTERNET-GATEWAY--------------------#

variable "ig_name" {
    default = ""
    type = string
  
}

#------------public-subent----------------#

variable "public_subnet1_cidr" {
    default = ""
    type = string
  
}

variable "public_subnet1_name" {
    default = ""
  
}

variable "public_subnet2_cidr" {
    default = ""
    type = string
  
}

variable "public_subnet2_name" {
    default = ""
  
}

#--------------Private-subent-(frontend)-----------#

variable "private_subnet1_cidr" {
    default = ""
    type = string
  
}

variable "private_subnet1_name" {
    default = ""
  
}

variable "private_subnet2_cidr" {
    default = ""
    type = string
  
}

variable "private_subnet2_name" {
    default = ""
  
}


#--------------Private-subent (backend) -----------#

variable "private_subnet3_cidr" {
    default = ""
    type = string
  
}

variable "private_subnet3_name" {
    default = ""
  
}

variable "private_subnet4_cidr" {
    default = ""
    type = string
  
}

variable "private_subnet4_name" {
    default = ""
  
}

#--------------Private-subent-(rds)-----------#

variable "private_subnet5_cidr" {
    default = ""
    type = string
  
}

variable "private_subnet5_name" {
    default = ""
  
}

variable "private_subnet6_cidr" {
    default = ""
    type = string
  
}

variable "private_subnet6_name" {
    default = ""
  
}



#--------------Aviabilality-Zone-------------#

variable "az1" {
    default = ""
    type = string
  
}

variable "az2" {
    default = ""
    type = string
  
}

#---------Route-table-public---------#

variable "public_rt_name" {
    default = ""
    type = string 
}

variable "private_rt_name" {
    default = ""
    type = string
  
}

#==========ELASTIC-IP=========#

variable "elastic_ip_name"{
    default=""
    type=string
}

#=========NAT-GATEWAY========#

variable "NAT_name" {
    default = ""
    type = string
  
}

#=======SG===========#

variable "sg_name" {
    default = ""
    type = string
  
}

variable "ingress_rules" {
  description = "List of ingress rules"
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
    description = string
  }))
}


variable "egress_rules" {
  description = "List of egress rules"
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
    description = string
  }))
}








