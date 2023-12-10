resource "aws_vpc" "vpc-a1" {
    cidr_block = "${local.vpc_cidr_prefix}.0.0/16"

    tags = {
        Name = "my-vpc"
        Environment = terraform.workspace
  }
}

output "vpc_id" {
  value = aws_vpc.vpc-a1.id
}

resource "aws_subnet" "vpc-a1-subnets" {
  vpc_id            = aws_vpc.vpc-a1.id
  count = var.num_subnets

  cidr_block        = "${local.vpc_cidr_prefix}.${count.index+1}.0/24"
  availability_zone = local.availability_zones[count.index]

}