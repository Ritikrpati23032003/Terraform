resource "aws_instance" "name" {
  ami           = var.ami_id
  instance_type = var.instance_type

  tags = {
    Name = "dev"
  }

  lifecycle {
    create_before_destroy = true
  }

    #   lifecycle {
    #     ignore_changes = ["tags"]
    #   }

    # lifecycle {
    #     prevent_destroy = true
    #   }


    }


