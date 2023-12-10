resource "aws_instance" "ec2_lab_via_tf" {
    ami = var.amid
    instance_type = var.instance_type
    subnet_id = var.subnet_id
    tags = {
        Name    = "new_ec2_via_tf"
    }
}