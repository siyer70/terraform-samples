terraform {
  backend "s3" {
    bucket = "chasrini-day4-terraform-state-management"
    key    = "state/sc1/terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "terraform-state-locking-sc1"
  }
}