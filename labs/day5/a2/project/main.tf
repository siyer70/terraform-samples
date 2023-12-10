module "a2-network" {
  source = "../modules/network"
  environment = "prod"
}

module "myec2s" {
  source = "../modules/ec2"
  webserver_subnet_id = module.a2-network.public_subnets[0]
  appserver_subnet_id = module.a2-network.private_subnets[0]
  dbserver_subnet_id = module.a2-network.database_subnets[0]
  vpc_id = module.a2-network.vpc_id
}

output "vpc_id" {
  value = module.a2-network.vpc_id
}
