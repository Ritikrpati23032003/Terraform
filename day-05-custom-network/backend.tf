terraform {
  backend "s3" {
    bucket = "terraform-29-10-25"
    key    = "day5/network/terraform.tfstate"
    region = "us-east-1"
    #use_lockfile = true # to use s3 native locking 1.19 version above
    #dynamodb_table = "terraform" # any version we can use dynamodb locking 
    #encrypt = true
  }
}