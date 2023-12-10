provider "aws" {}

resource "tls_private_key" "pk" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "kp" {
  key_name   = "myKey"       # Create a "myKey" to AWS!!
  public_key = tls_private_key.pk.public_key_openssh
}

resource "local_file" "ssh_key" {
  filename = "${aws_key_pair.kp.key_name}.pem"
  content = tls_private_key.pk.private_key_openssh
}

resource "aws_instance" "chasrini_ec2_day3" {
  ami = "ami-0230bd60aa48260c6"
  instance_type = "t2.micro"
  key_name      = tls_private_key.pk.public_key_openssh
  subnet_id = "subnet-3b9a5576"

  connection {
    type = "ssh"
    user = "ec2-user"
    private_key = file("./myKey.pem")
    host = self.public_ip
    agent = false
  }

  provisioner "remote-exec" {
    inline = [ 
        "sudo dnf install nginx -y",
        "sudo systemctl start nginx"
    ]
  }
}