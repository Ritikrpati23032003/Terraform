# ------------------ DEFAULT VPC ------------------#

data "aws_vpc" "default" {
  default = true
}

data "aws_subnets" "default_subnets" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}

#-------------deafult-vpc-EC2----------------#

resource "aws_instance" "name" {
    ami = var.ami_id
    instance_type = var.instance_type
    subnet_id = data.aws_subnets.default_subnets.ids[0]
    tags={ Name= "EC2" }
  
}

# ------------------  VPC FOR RDS ------------------#

resource "aws_vpc" "rds_vpc" {
  cidr_block = "10.1.0.0/16"
  tags = { 
    Name = "RDS-VPC" 
    }
}

#------Subent FOR RDS------------#

resource "aws_subnet" "rds_subnet_a" {
  vpc_id            = aws_vpc.rds_vpc.id
  cidr_block        = "10.1.1.0/24"
  availability_zone = "us-east-1a"
  tags = { Name = "RDS-Subnet-A" }
}

resource "aws_subnet" "rds_subnet_b" {
  vpc_id            = aws_vpc.rds_vpc.id
  cidr_block        = "10.1.2.0/24"
  availability_zone = "us-east-1b"
  tags = { Name = "RDS-Subnet-B" }
}

#---------Route-table for rds vpc-----#

resource "aws_route_table" "name" {
    vpc_id = aws_vpc.rds_vpc.id
  
}

#----------- Associate route table with RDS subnets -----------#

resource "aws_route_table_association" "rds_assoc_a" {
  subnet_id      = aws_subnet.rds_subnet_a.id
  route_table_id = aws_route_table.name.id
}

resource "aws_route_table_association" "rds_assoc_b" {
  subnet_id      = aws_subnet.rds_subnet_b.id
  route_table_id = aws_route_table.name.id
}


#----------Subnet-group----------#

resource "aws_db_subnet_group" "rds_subnet_group" {
  name       = "rds-subnet-group"
  subnet_ids = [aws_subnet.rds_subnet_a.id, aws_subnet.rds_subnet_b.id]
  tags       = { Name = "RDS-Subnet-Group" }
}

# ------------------ SECURITY GROUP FOR RDS ------------------#

resource "aws_security_group" "rds_sg" {
  vpc_id = aws_vpc.rds_vpc.id
  name   = "rds-sg"

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = [data.aws_vpc.default.cidr_block] # Allow from Default VPC
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = { Name = "RDS-SG" }
}

#==========Rds-DB=================#

resource "aws_db_instance" "mysql_rds" {
  identifier              = "rds-db"
  engine                  = "mysql"
  engine_version          = "8.0"
  instance_class          = "db.t3.micro"
  allocated_storage       = 20
  db_name                 = "testdb"
  username                = var.username
  password                = var.password
  db_subnet_group_name    = aws_db_subnet_group.rds_subnet_group.name
  vpc_security_group_ids  = [aws_security_group.rds_sg.id]
  skip_final_snapshot     = true
  publicly_accessible     = false

  tags = { Name = "RDS" }
}

#-------------peering-----------#

resource "aws_vpc_peering_connection" "peer" {
    vpc_id = data.aws_vpc.default.id
    peer_vpc_id = aws_vpc.rds_vpc.id

    auto_accept = true
    tags = {
      Name="default-rds"
    }
  
}

#------------Routes-------------------#
# Add route in deafult vpc main route table to reach rds vpc #

resource "aws_route" "name" {
    route_table_id = data.aws_vpc.default.main_route_table_id
    destination_cidr_block = aws_vpc.rds_vpc.cidr_block
    vpc_peering_connection_id = aws_vpc_peering_connection.peer.id
  
}



# Add route in RDS VPC to reach default VPC #

resource "aws_route" "name2" {
    route_table_id = aws_route_table.name.id
    destination_cidr_block = data.aws_vpc.default.cidr_block
    vpc_peering_connection_id = aws_vpc_peering_connection.peer.id  
}



