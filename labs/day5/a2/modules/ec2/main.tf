resource "aws_instance" "webserver" {
    ami = "ami-0230bd60aa48260c6"
    instance_type = "t2.micro"
    security_groups = ["${aws_security_group.sg_mytraffic.id}"]
    subnet_id = var.webserver_subnet_id
    tags = {
        Name    = "webserver"
        Terraform   = "true"
        Environment = "prod"
    }
}

resource "aws_security_group" "sg_mytraffic" {
  name = "sg_allow_webserver_traffic"
  vpc_id = var.vpc_id
  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "appserver" {
    ami = "ami-0230bd60aa48260c6"
    instance_type = "t2.micro"
    subnet_id = var.appserver_subnet_id
    tags = {
        Name    = "appserver"
        Terraform   = "true"
        Environment = "prod"
    }
}

resource "aws_instance" "dbserver" {
    ami = "ami-0230bd60aa48260c6"
    instance_type = "t2.micro"
    subnet_id = var.dbserver_subnet_id
    tags = {
        Name    = "dbserver"
        Terraform   = "true"
        Environment = "prod"
    }
}
