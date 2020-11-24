resource "aws_eip" "nat_gateway_1" {
  vpc      = true

  tags = {
    Name = "${var.environment_slug}-eip-nat-gateway-1"
    AZ = var.availability_zone_1
  }
}

resource "aws_eip" "nat_gateway_2" {
  vpc      = true

  tags = {
    Name = "${var.environment_slug}-eip-nat-gateway-2"
    AZ = var.availability_zone_2
  }
}

resource "aws_nat_gateway" "nat_gateway_1" {
  allocation_id = aws_eip.nat_gateway_1.id
  subnet_id     = aws_subnet.subnet_public_1.id

  tags = {
    Name = "${var.environment_slug}-nat-gateway-1"
    AZ = var.availability_zone_1
  }
}

resource "aws_nat_gateway" "nat_gateway_2" {
  allocation_id = aws_eip.nat_gateway_2.id
  subnet_id     = aws_subnet.subnet_public_2.id

  tags = {
    Name = "${var.environment_slug}-nat-gateway-2"
    AZ = var.availability_zone_2
  }
}
