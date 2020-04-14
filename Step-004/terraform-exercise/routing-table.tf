resource "aws_route_table" "r" {
  vpc_id = aws_vpc.indacloud-stepbystep.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  route {
    ipv6_cidr_block        = "::/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "main"
  }
}

resource "aws_route_table_association" "route_table_association_a" {
  subnet_id      = aws_subnet.indacloud-stepbystep-subnet-a.id
  route_table_id = aws_route_table.r.id
}
