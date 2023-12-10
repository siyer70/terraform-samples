resource "aws_instance" "day4_ec2_project2_via_tf" {
    ami = "ami-0230bd60aa48260c6"
    instance_type = "t2.micro"
    tags = {
        Name    = "day4_ec2_project2_via_tf"
    }
}


