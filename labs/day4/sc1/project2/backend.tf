terraform {
  backend "s3" {
    bucket = "chasrini-day4-terraform-state-management-p2"
    key    = "state/sc2/terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "terraform-state-locking-sc1-p2"
  }
}