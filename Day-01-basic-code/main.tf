resource "aws_vpc" "name" {
    cidr_block = "10.0.0.0/16"
    tags = {
      Name = "terrafom-vpc"
    }
  
}
resource "aws_subnet" "name" {
  vpc_id     = aws_vpc.name.id       # Connects subnet to the VPC created earlier
  cidr_block = "10.0.0.0/24"         # Subnet IP range

  tags = {
    Name = "terraform-subnet"
  }
}
resource "aws_subnet" "name2" {
  vpc_id     = aws_vpc.name.id       # Connects subnet to the VPC created earlier
  cidr_block = "10.0.1.0/24"         # Subnet IP range

  tags = {
    Name = "terraform-subnet2"
  }
}
