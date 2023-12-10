provider "aws" {
  
}

resource "aws_eip" "myeip" {
    vpc = true
}

resource "aws_s3_bucket" "mys3bucket" {
    bucket = "chasrini-s3-bucket"
    tags = {
        Name        = "chasrini bucket"
        Environment = "Dev"
  }
}

output "output_myeip" {
  value = aws_eip.myeip.public_ip
}

output "chasrini_bucket_name" {
  value = aws_s3_bucket.mys3bucket.bucket_domain_name
}