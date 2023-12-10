resource "aws_vpc" "vpc-sc2" {
  cidr_block = "172.16.0.0/16"
}

output "vpc_id" {
  value = aws_vpc.vpc-sc2.id
}
