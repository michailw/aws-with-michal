resource "aws_default_network_acl" "default_vpc_acl" {
  default_network_acl_id = aws_vpc.main.default_network_acl_id

  subnet_ids = [
    aws_subnet.subnet_public_1.id,
    aws_subnet.subnet_public_2.id,
    aws_subnet.subnet_private_1.id,
    aws_subnet.subnet_private_2.id
  ]

  egress {
    rule_no     = 100
    action      = "allow"
    from_port   = 0
    icmp_code   = 0
    icmp_type   = 0
    to_port     = 0
    protocol    = -1
    cidr_block  = "0.0.0.0/0"
  }

  egress {
    rule_no     = 101
    action      = "allow"
    from_port   = 0
    to_port     = 0
    icmp_code   = 0
    icmp_type   = 0
    protocol    = -1
    ipv6_cidr_block = "::0/0"
  }

  ingress {
    rule_no    = 80
    action     = "allow"
    from_port  = 0
    to_port    = 0
    icmp_code   = 0
    icmp_type   = 0
    protocol   = -1
    ipv6_cidr_block = aws_subnet.subnet_private_1.ipv6_cidr_block
  }

  ingress {
    rule_no    = 81
    action     = "allow"
    from_port  = 0
    to_port    = 0
    icmp_code   = 0
    icmp_type   = 0
    protocol   = -1
    ipv6_cidr_block = aws_subnet.subnet_private_2.ipv6_cidr_block
  }

  ingress {
    rule_no    = 82
    action     = "allow"
    from_port  = 0
    to_port    = 0
    icmp_code   = 0
    icmp_type   = 0
    protocol   = -1
    ipv6_cidr_block = aws_subnet.subnet_public_1.ipv6_cidr_block
  }

  ingress {
    rule_no    = 83
    action     = "allow"
    from_port  = 0
    to_port    = 0
    icmp_code   = 0
    icmp_type   = 0
    protocol   = -1
    ipv6_cidr_block = aws_subnet.subnet_public_2.ipv6_cidr_block
  }

  ingress {
    rule_no    = 84
    action     = "allow"
    from_port  = 0
    to_port    = 0
    icmp_code   = 0
    icmp_type   = 0
    protocol   = -1
    cidr_block = aws_subnet.subnet_private_1.cidr_block
  }

  ingress {
    rule_no    = 85
    action     = "allow"
    from_port  = 0
    to_port    = 0
    icmp_code   = 0
    icmp_type   = 0
    protocol   = -1
    cidr_block = aws_subnet.subnet_private_2.cidr_block
  }

  ingress {
    rule_no    = 86
    action     = "allow"
    from_port  = 0
    to_port    = 0
    icmp_code   = 0
    icmp_type   = 0
    protocol   = -1
    cidr_block = aws_subnet.subnet_public_1.cidr_block
  }

  ingress {
    rule_no    = 87
    action     = "allow"
    from_port  = 0
    to_port    = 0
    icmp_code   = 0
    icmp_type   = 0
    protocol   = -1
    cidr_block = aws_subnet.subnet_public_2.cidr_block
  }

  ingress {
    rule_no    = 90
    action     = "allow"
    from_port  = 0
    to_port    = 0
    icmp_code   = 0
    icmp_type   = 0
    protocol   = -1
    cidr_block = aws_vpc.main.cidr_block
  }
  ingress {
    rule_no    = 91
    action     = "allow"
    from_port  = 0
    to_port    = 0
    icmp_code   = 0
    icmp_type   = 0
    protocol   = -1
    ipv6_cidr_block = aws_vpc.main.ipv6_cidr_block
  }

  ingress {
    rule_no    = 98
    action     = "allow"
    from_port  = 1024
    to_port    = 65535
    icmp_code   = 0
    icmp_type   = 0
    protocol   = "tcp"
    ipv6_cidr_block = "::0/0"
  }
  ingress {
    rule_no    = 99
    action     = "allow"
    from_port  = 1024
    to_port    = 65535
    icmp_code   = 0
    icmp_type   = 0
    protocol   = "tcp"
    cidr_block = "0.0.0.0/0"
  }
  ingress {
    rule_no    = 1
    action     = "allow"
    from_port  = 80
    to_port    = 80
    icmp_code   = 0
    icmp_type   = 0
    protocol   = "tcp"
    cidr_block = "0.0.0.0/0"
  }
  ingress {
    rule_no    = 2
    action     = "allow"
    from_port  = 443
    to_port    = 443
    icmp_code   = 0
    icmp_type   = 0
    protocol   = "tcp"
    cidr_block = "0.0.0.0/0"
  }
  ingress {
    rule_no    = 3
    action     = "allow"
    from_port  = 80
    to_port    = 80
    icmp_code   = 0
    icmp_type   = 0
    protocol   = "tcp"
    ipv6_cidr_block = "::0/0"
  }
  ingress {
    rule_no    = 4
    action     = "allow"
    from_port  = 443
    to_port    = 443
    icmp_code   = 0
    icmp_type   = 0
    protocol   = "tcp"
    ipv6_cidr_block = "::0/0"
  }

  tags = {
    Name = "${var.environment_slug}-default-acl"
  }
}
