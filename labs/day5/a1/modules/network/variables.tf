data "aws_availability_zones" "available" {
    state = "available"

    filter {
        name   = "region-name"
        values = ["us-east-1"]
  }
}

variable "num_subnets" {
    type = number
}

locals {
    vpc_cidr_prefix = "10.0"
}

locals {
    availability_zones = data.aws_availability_zones.available.names
}
