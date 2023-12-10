terraform {
  backend "s3" {
    bucket = "chasrini-day4-terraform-state-management"
    key    = "state/project1/terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "chasrini-day4-terraform-state-locking-project1"
  }
}