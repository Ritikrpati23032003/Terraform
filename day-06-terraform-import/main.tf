resource "aws_instance" "name" {
    ami = var.ami_id
    instance_type = var.instance_type
    tags                                 = {
        Name = "server"
        }
  
}


# terraform import aws_instance.name i-07e5099c4fe7293c7 <instance id>
# Use the terraform import command to import existing infrastructure to Terraform state. 