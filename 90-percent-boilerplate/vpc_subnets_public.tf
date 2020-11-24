resource "aws_subnet" "subnet_public_1" {
  vpc_id     = aws_vpc.main.id
  cidr_block = cidrsubnet(aws_vpc.main.cidr_block, 4, 6)
  ipv6_cidr_block = cidrsubnet(aws_vpc.main.ipv6_cidr_block, 8, 0)
  assign_ipv6_address_on_creation = true
  availability_zone = var.availability_zone_1

  tags = {
    Name = "${var.environment_slug}-public-1a"
    Type = "Public"
    AZ = var.availability_zone_1
  }
}

resource "aws_subnet" "subnet_public_2" {
  vpc_id     = aws_vpc.main.id
  cidr_block = cidrsubnet(aws_vpc.main.cidr_block, 4, 7)
  ipv6_cidr_block = cidrsubnet(aws_vpc.main.ipv6_cidr_block, 8, 8)
  assign_ipv6_address_on_creation = true
  availability_zone = var.availability_zone_2

  tags = {
    Name = "${var.environment_slug}-public-1b"
    Type = "Public"
    AZ = var.availability_zone_2
  }
}
