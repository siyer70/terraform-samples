terraform {
  backend "s3" {
    bucket = "chasrini-day5-terraform-state-management"
    key    = "state/a2/terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "terraform-state-locking-a2"
  }
}