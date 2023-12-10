resource "aws_instance" "day2_ec2_lab_via_tf" {
    ami = "ami-0230bd60aa48260c6"
    instance_type = var.instanceType
    tags = {
        Name    = "day2_ec2_lab_via_tf"
    }
}

