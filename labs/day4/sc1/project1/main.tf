resource "aws_vpc" "vpc-proj1" {
  cidr_block = "10.0.0.0/16"
}

output "vpc_id" {
  value = aws_vpc.vpc-proj1.id
}
