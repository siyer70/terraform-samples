data "terraform_remote_state" "rs" {
  backend = "s3" 

  config = {
    bucket = "chasrini-day4-terraform-state-management"
    key    = "state/sc1/terraform.tfstate"
    region = "us-east-1"    
  }
}

resource "aws_subnet" "my_subnet" {
  vpc_id            = data.terraform_remote_state.rs.outputs.vpc_id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "tf-example"
  }
}

resource "aws_instance" "day4_ec2_sc1_project2_via_tf" {
    ami = "ami-0230bd60aa48260c6"
    instance_type = "t2.micro"
    tags = {
        Name    = "day4_ec2_sc1_project2_via_tf"
    }
    subnet_id = aws_subnet.my_subnet.id
}

