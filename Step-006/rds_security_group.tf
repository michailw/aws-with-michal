resource "aws_security_group" "rds_security_group" {
  name = "rds-sg"

  description = "RDS access"
  vpc_id      = aws_vpc.indacloud-stepbystep.id

  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = [
      aws_vpc.indacloud-stepbystep.cidr_block
    ]
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
}
