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
resource "aws_instance" "private" {
    ami = var.ami_id
    instance_type =var.instance_type
    subnet_id = var.private_subnet_id
    tags = {
      Name=var.private_instance_name
    }
    vpc_security_group_ids = [var.security_group_id]

  
}