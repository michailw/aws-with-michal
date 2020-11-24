resource "aws_egress_only_internet_gateway" "main_egw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "${var.environment_slug}-egw"
  }
}
