module "vpc" {
    source = "terraform-aws-modules/vpc/aws"
    version = "~>5.0"
    name                 = "a2-vpc"
    cidr                 = "${lookup(var.cidr_prefix, var.environment)}.0.0/16"
    private_subnets      = local.service_tier
    database_subnets     = local.database_tier
    public_subnets       = local.web_tier

    azs                  = ["us-east-1a", "us-east-1b"]
    single_nat_gateway = true

    # omitted arguments for brevity

}
