resource "aws_eip" "lb" {
  vpc =  true
}

output "eip" {
  value = aws_eip.lb.public_ip
}

resource "aws_security_group" "allow_eip" {
  name = "day2-security-group"
  ingress {
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = ["${aws_eip.lb.public_ip}/32"]
  }
}