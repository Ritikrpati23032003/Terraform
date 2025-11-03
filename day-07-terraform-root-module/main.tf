#==============VPC-MODULE============#

module "vpc" {
    source = "../day-07-terraform-modules/vpc"

  cidr_block           = "10.0.0.0/16"
  vpc_name             = "Dev-VPC"

  ig_name              = "Dev-IG"

  public_subnet1_cidr  = "10.0.1.0/24"
  public_subnet1_name  = "Public-Subnet-1"

  public_subnet2_cidr  = "10.0.2.0/24"
  public_subnet2_name  = "Public-Subnet-2"

  private_subnet1_cidr = "10.0.3.0/24"
  private_subnet1_name = "Private-Subnet-1"

  private_subnet2_cidr = "10.0.4.0/24"
  private_subnet2_name = "Private-Subnet-2"

  az1                  = "us-east-1a"
  az2                  = "us-east-1b"

  public_rt_name       = "Public-RT"
  private_rt_name      = "Private-RT"

  elastic_ip_name      = "EIP-Dev"

  NAT_name             = "NAT-Dev"

  sg_name              = "Dev-SG"

  ingress_rules = [
    {
      description = "Allow SSH"
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    },
    {
      description = "Allow HTTP"
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    },
    {
      description = "Allow HTTP"
      from_port   = 443
      to_port     = 443
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]

  egress_rules = [
    {
      description = "Allow all outbound"
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]
}

#=================EC2-MODULE=================#


module "instances" {
  source                = "../day-07-terraform-modules/Instances"
  ami_id                = var.ami_id
  instance_type         = var.instance_type
  public_subnet_id      = module.vpc.public_subnet1_id
  private_subnet_id     = module.vpc.private_subnet1_id
  security_group_id     = module.vpc.security_group_id
  associate_public_ip   = true
  public_instance_name  = "public-instance"
  private_instance_name = "private-instance"
}
