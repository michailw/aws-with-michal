locals {
  security_group_name = "http-inbound-traffic"
  ssh_security_group_name = "ssh-inbound-traffic"
}

resource "aws_security_group" "http-inbound-traffic" {
  name        = local.security_group_name
  description = "Allow HTTP and HTTPS inbound traffic"
  vpc_id      = aws_vpc.indacloud-stepbystep.id

  ingress {
    description = "HTTPS inbound rule"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP inbound rule"
    from_port   = 80
    to_port     = 80
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

resource "aws_security_group" "ssh-inbound-traffic" {
  name        = local.ssh_security_group_name
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
    Name = local.ssh_security_group_name
    Terraform = "true"
  }
}
