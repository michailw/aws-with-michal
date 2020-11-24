resource "aws_security_group" "internal-access-sg" {
  name        = "internal-access.${var.environment_slug}"
  description = "Internal access [${var.environment_slug}]"
  vpc_id      = aws_vpc.main.id

  ingress {
    description = "Internal access from VPC"
    from_port   = 0
    to_port     = 0
    protocol    = "tcp"
    cidr_blocks = [
      aws_vpc.main.cidr_block
    ]
    ipv6_cidr_blocks = [
      aws_vpc.main.ipv6_cidr_block
    ]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [
      "0.0.0.0/0"
    ]
    ipv6_cidr_blocks = [
      "::/0"
    ]
  }

  tags = {
    Name = "Internal access - ${var.environment_name}"
  }
}
