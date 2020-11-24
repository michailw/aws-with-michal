resource "aws_subnet" "subnet_private_1" {
  vpc_id     = aws_vpc.main.id
  cidr_block = cidrsubnet(aws_vpc.main.cidr_block, 4, 1)
  ipv6_cidr_block = cidrsubnet(aws_vpc.main.ipv6_cidr_block, 8, 1)
  assign_ipv6_address_on_creation = true
  availability_zone = var.availability_zone_1

  tags = {
    Name = "${var.environment_slug}-private-1a"
    Type = "Private"
    AZ = var.availability_zone_1
  }
}

resource "aws_subnet" "subnet_private_2" {
  vpc_id     = aws_vpc.main.id
  cidr_block = cidrsubnet(aws_vpc.main.cidr_block, 4, 2)
  ipv6_cidr_block = cidrsubnet(aws_vpc.main.ipv6_cidr_block, 8, 9)
  assign_ipv6_address_on_creation = true
  availability_zone = var.availability_zone_2

  tags = {
    Name = "${var.environment_slug}-private-1b"
    Type = "Private"
    AZ = var.availability_zone_2
  }
}
