locals {
  rds_security_group_name = "rds-inbound-traffic"
}

resource "aws_security_group" "rds-inbound-traffic" {
  name        = local.rds_security_group_name
  description = "Allow MySQL 3306 inbound traffic"
  vpc_id      = aws_vpc.indacloud-stepbystep.id

  ingress {
    description = "MySQl 3306 inbound rule"
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "MySQl 3306 inbound rule"
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = local.rds_security_group_name
    Terraform = "true"
  }
}
