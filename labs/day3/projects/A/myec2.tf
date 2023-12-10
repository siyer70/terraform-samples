module "ec2module" {
    source = "../../modules/ec2"
    instanceType = "t2.micro"
}