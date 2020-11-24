resource "aws_route_table" "main_route_table" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "${var.environment_slug}-main-route-table"
  }
}
