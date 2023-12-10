module "vpcmodule" {
    source = "../modules/vpc"
}

variable "amid" {
  default = "ami-0230bd60aa48260c6"
}

variable "instance_type" {
  default = "t2.micro"
}

module "subnetmodule" {
    source = "../modules/subnets"
    vpc_id = module.vpcmodule.vpc_id
}

module "ec2module" {
    source = "../modules/ec2"
    amid = var.amid
    instance_type = var.instance_type
    subnet_id = module.subnetmodule.subnet-web-id
}
