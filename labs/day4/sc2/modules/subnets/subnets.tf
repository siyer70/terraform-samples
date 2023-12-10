variable "vpc_id" {}

resource "aws_subnet" "web" {
  vpc_id            = var.vpc_id
  cidr_block        = "172.16.1.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "tf-subnet-1"
  }
}

resource "aws_subnet" "services" {
  vpc_id            = var.vpc_id
  cidr_block        = "172.16.2.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "tf-subnet-2"
  }
}

resource "aws_subnet" "db" {
  vpc_id            = var.vpc_id
  cidr_block        = "172.16.3.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "tf-subnet-3"
  }
}

output "subnet-web-id" {
  value = aws_subnet.web.id
}

output "subnet-services-id" {
  value = aws_subnet.services.id
}

output "subnet-db-id" {
  value = aws_subnet.db.id
}
