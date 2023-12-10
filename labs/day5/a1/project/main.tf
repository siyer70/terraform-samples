module "a1-network" {
  source = "../modules/network"
  num_subnets = terraform.workspace == "prod" ? 2 : 1
}

output "vpc_id" {
  value = module.a1-network.vpc_id
}
