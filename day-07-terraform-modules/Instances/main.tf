#-------------Public-Instance---------------#

resource "aws_instance" "public" {
    ami = var.ami_id
    instance_type = var.instance_type
    subnet_id = var.public_subnet_id
    associate_public_ip_address = var.associate_public_ip
    tags = {
      Name=var.public_instance_name
    }
    vpc_security_group_ids = [var.security_group_id]

  
}

#================Private-instance===============#
#----------------frontend-------------------#

resource "aws_instance" "frontend" {
    ami = var.ami_id
    instance_type =var.instance_type
    subnet_id = var.private_subnet1_id
     key_name               = var.key_name
    tags = {
      Name=var.pvt_fronend_name
    }
    vpc_security_group_ids = [var.security_group_id]

  
}
#----------------backend------------------#

resource "aws_instance" "backend" {
    ami = var.ami_id
    instance_type =var.instance_type
    subnet_id = var.private_subnet2_id
     key_name               = var.key_name
    tags = {
      Name=var.pvt_backend_name
    }
    vpc_security_group_ids = [var.security_group_id]

  
}

