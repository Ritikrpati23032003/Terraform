#-------------VPC------------#
resource "aws_vpc" "name" {
    cidr_block = var.cidr_block
    tags = {
      Name= var.vpc_name
    }
  
}

#------------IG------------------#

resource "aws_internet_gateway" "name" {
    vpc_id = aws_vpc.name.id
    tags={
        Name=var.ig_name
    }
  
}

#---------Public-subnet-----------#

resource "aws_subnet" "public1" {
    vpc_id = aws_vpc.name.id
    cidr_block = var.public_subnet1_cidr
    availability_zone = var.az1
    tags = {
      Name= var.public_subnet1_name
    }
  
}

resource "aws_subnet" "public2" {
    vpc_id = aws_vpc.name.id
    cidr_block = var.public_subnet2_cidr
    availability_zone = var.az2
    tags = {
      Name= var.public_subnet2_name
    }
  
}

#-------------Private-subnet-frontend---------------#

resource "aws_subnet" "private1" {
    vpc_id = aws_vpc.name.id
    cidr_block = var.private_subnet1_cidr
    availability_zone = var.az1
    tags = {
      Name= var.private_subnet1_name
    }
  
}

resource "aws_subnet" "private2" {
    vpc_id = aws_vpc.name.id
    cidr_block = var.private_subnet2_cidr
    availability_zone = var.az2
    tags = {
      Name= var.private_subnet2_name
    }
  
}


#-------------Private-subnet-backend--------------#

resource "aws_subnet" "private3" {
    vpc_id = aws_vpc.name.id
    cidr_block = var.private_subnet3_cidr
    availability_zone = var.az1
    tags = {
      Name= var.private_subnet3_name
    }
  
}

resource "aws_subnet" "private4" {
    vpc_id = aws_vpc.name.id
    cidr_block = var.private_subnet4_cidr
    availability_zone = var.az2
    tags = {
      Name= var.private_subnet4_name
    }
  
}

#-------------Private-subnet-rds--------------#

resource "aws_subnet" "private5" {
    vpc_id = aws_vpc.name.id
    cidr_block = var.private_subnet5_cidr
    availability_zone = var.az1
    tags = {
      Name= var.private_subnet5_name
    }
  
}

resource "aws_subnet" "private6" {
    vpc_id = aws_vpc.name.id
    cidr_block = var.private_subnet6_cidr
    availability_zone = var.az2
    tags = {
      Name= var.private_subnet6_name
    }
  
}

#----------------Route-table---------------#

resource "aws_route_table" "name" {
    vpc_id = aws_vpc.name.id
    tags = {
      Name = var.public_rt_name
    }
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.name.id
    }
  
}

#------Route_table-public-subnet-association-------#

resource "aws_route_table_association" "public1" {
    subnet_id = aws_subnet.public1.id
    route_table_id = aws_route_table.name.id
  
}

resource "aws_route_table_association" "public2" {
    subnet_id = aws_subnet.public2.id
    route_table_id = aws_route_table.name.id
  
}

#--------Elastic-Ip-----------#

resource "aws_eip" "name" {
    domain="vpc"
    tags={
        Name = var.elastic_ip_name
    }
  
}

#------------Nat-gateway--------------#

resource "aws_nat_gateway" "name" {
    subnet_id = aws_subnet.public1.id
    allocation_id = aws_eip.name.id
    #allocation_id = aws_eip.name.allocation_id

    tags = {
      Name=var.NAT_name
    }
  
}

#--------------Private-Route-table------------#

resource "aws_route_table" "name2" {
    vpc_id = aws_vpc.name.id
    tags = {
      Name = var.private_rt_name
    }
    route {
        cidr_block = "0.0.0.0/0"
        nat_gateway_id = aws_nat_gateway.name.id
    }
  
}

#------Route_table-private-subnet-association-------#

resource "aws_route_table_association" "private1" {
    subnet_id = aws_subnet.private1.id
    route_table_id = aws_route_table.name2.id
  
}

resource "aws_route_table_association" "private2" {
    subnet_id = aws_subnet.private2.id
    route_table_id = aws_route_table.name2.id
  
}
resource "aws_route_table_association" "private3" {
    subnet_id = aws_subnet.private3.id
    route_table_id = aws_route_table.name2.id
  
}

resource "aws_route_table_association" "private4" {
    subnet_id = aws_subnet.private4.id
    route_table_id = aws_route_table.name2.id
  
}
resource "aws_route_table_association" "private5" {
    subnet_id = aws_subnet.private5.id
    route_table_id = aws_route_table.name2.id
  
}

resource "aws_route_table_association" "private6" {
    subnet_id = aws_subnet.private6.id
    route_table_id = aws_route_table.name2.id
  
}


#----------Security-group--------------#

resource "aws_security_group" "name" {
    name = var.sg_name
    vpc_id = aws_vpc.name.id
    tags={
        Name=var.sg_name
    }

    dynamic "ingress" {
    for_each = var.ingress_rules
    content {
      description = ingress.value.description
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
    }
  }

    dynamic "egress" {
    for_each = var.egress_rules
    content {
      description = egress.value.description
      from_port   = egress.value.from_port
      to_port     = egress.value.to_port
      protocol    = egress.value.protocol
      cidr_blocks = egress.value.cidr_blocks
    }
  }
  
}




