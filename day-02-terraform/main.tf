resource "aws_vpc" "name" {
    cidr_block = "10.0.0.0/16"
    tags = {
      Name = "dev_vpc"
    }
  
}

resource "aws_subnet" "name" {
    vpc_id = aws_vpc.name.id
    cidr_block = "10.0.0.0/24"
    tags = {
      Name = "subnet-01"
    }
  
}

resource "aws_instance" "name" {
    ami= var.ami_id
    instance_type = var.instance_type
    subnet_id = aws_subnet.name.id
    tags = {
      Name="Linux"
    }
  
}