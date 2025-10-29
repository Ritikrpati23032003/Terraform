terraform {
  backend "s3" {
    bucket = "terraform-29-10-25"
    key    = "day3/terraform.tfstate"
    region = "us-east-1"
  }
}