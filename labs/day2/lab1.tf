resource "aws_eip" "neweip" {
    vpc = true
}

resource "aws_instance" "chasrini_ec2_via_tf" {
    ami = "ami-0230bd60aa48260c6"
    instance_type = "t2.micro"
    tags = {
        Name    = "chasrini_ec2_via_tf"
    }
}

resource "aws_eip_association" "aea" {
    instance_id = aws_instance.chasrini_ec2_via_tf.id
    allocation_id = aws_eip.neweip.id
}