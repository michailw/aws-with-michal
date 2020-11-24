resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  route {
    ipv6_cidr_block = "::/0"
    gateway_id      = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "${var.environment_slug}-public-route-table"
  }
}

resource "aws_route_table_association" "public_route_table_association_public_subnet_1" {
  subnet_id = aws_subnet.subnet_public_1.id
  route_table_id = aws_route_table.public_route_table.id
}

resource "aws_route_table_association" "public_route_table_association_public_subnet_2" {
  subnet_id = aws_subnet.subnet_public_2.id
  route_table_id = aws_route_table.public_route_table.id
}
