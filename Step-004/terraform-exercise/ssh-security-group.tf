locals {
  security_group_name = "ssh-inbound-traffic"
}

resource "aws_security_group" "ssh-inbound-traffic" {
  name        = local.security_group_name
  description = "Allow SSH inbound traffic"
  vpc_id      = aws_vpc.indacloud-stepbystep.id

  ingress {
    description = "SSH inbound rule"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = local.security_group_name
    Terraform = "true"
  }
}
