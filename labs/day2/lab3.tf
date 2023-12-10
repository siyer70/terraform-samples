variable "envname" {
    type = list(string)
    default = ["dev", "uat", "prod"]
}

resource "aws_s3_bucket" "srchan_bucket" {
    bucket = "srchan-s3-bucket-${var.envname[count.index]}"
    count = 3
    
    tags = {
        Name        = "srchan_bucket_${var.envname[count.index]}"
        Environment = var.envname[count.index] == "prod" ? "Prod Instance" : "Non Prod Instance"

  }


}

locals {
  common_tags = {
    Name = "General"
    Environment = "common"
  }
}

resource "aws_s3_bucket" "log_bucket" {
  bucket = "my-tf-log-bucket"
  tags = local.common_tags
}

resource "aws_s3_bucket_acl" "log_bucket_acl" {
  bucket = aws_s3_bucket.log_bucket.id
  acl    = "log-delivery-write"
}

