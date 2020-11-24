resource "aws_route_table" "private_route_table_1" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gateway_1.id
  }

  route {
    ipv6_cidr_block        = "::/0"
    egress_only_gateway_id = aws_egress_only_internet_gateway.main_egw.id
  }

  tags = {
    Name = "${var.environment_slug}-private-route-table-1"
  }
}

resource "aws_route_table" "private_route_table_2" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gateway_2.id
  }

  route {
    ipv6_cidr_block        = "::/0"
    egress_only_gateway_id = aws_egress_only_internet_gateway.main_egw.id
  }

  tags = {
    Name = "${var.environment_slug}-private-route-table-2"
  }
}

resource "aws_route_table_association" "public_route_table_association_private_subnet_1" {
  subnet_id = aws_subnet.subnet_private_1.id
  route_table_id = aws_route_table.private_route_table_1.id
}

resource "aws_route_table_association" "public_route_table_association_private_subnet_2" {
  subnet_id = aws_subnet.subnet_private_2.id
  route_table_id = aws_route_table.private_route_table_2.id
}
