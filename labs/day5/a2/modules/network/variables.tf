variable "cidr_prefix" {
    type = map
    default = {
        dev     = "172.16"
        qa      = "172.18"
        prod    = "172.20"
    }
}

locals {
    web_tier          = [
        "${lookup(var.cidr_prefix, var.environment)}.1.0/24",
        "${lookup(var.cidr_prefix, var.environment)}.2.0/24"
    ]

    service_tier         = [
        "${lookup(var.cidr_prefix, var.environment)}.11.0/24",
        "${lookup(var.cidr_prefix, var.environment)}.12.0/24"
    ]

    database_tier        = [
        "${lookup(var.cidr_prefix, var.environment)}.21.0/24",
        "${lookup(var.cidr_prefix, var.environment)}.22.0/24"
    ]

}

variable "environment" {
    type = string
    description = "dev, qa, prod"
}


data "aws_availability_zones" "available" {
    state = "available"

    filter {
        name   = "region-name"
        values = ["us-east-1"]
  }
}


locals {
    availability_zones = data.aws_availability_zones.available.names
}
