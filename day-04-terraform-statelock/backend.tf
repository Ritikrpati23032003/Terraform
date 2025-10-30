terraform {
  backend "s3" {
    bucket = "terraform-29-10-25"
    key    = "day4/terraform.tfstate"
    use_lockfile = true # to use s3 native locking 1.19 version above
    region = "us-east-1"
  }
}