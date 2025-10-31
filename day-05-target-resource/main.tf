resource "aws_instance" "name" {
  count         = var.create_instance ? 1 : 0
  ami           = var.ami_id
  instance_type = var.instance_type

  tags = {
    Name = "Test"
  }
}





resource "aws_s3_bucket" "name" {
  bucket = "my-bucket-31-10-25"
  
}

resource "aws_s3_bucket" "name1" {
  bucket = "my-bucket-30-10-25"
  
  
}


#  When u want to run specifuc instance outof many

#  terraform apply -target=aws_s3_bucket.name1      or

#  terraform apply -target=aws_s3_bucket.name1 -target=aws_instance.name

#  terraform destroy -target=aws_instance.name


 # terraform apply -var="create_instance=false"


