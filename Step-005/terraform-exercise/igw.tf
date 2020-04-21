resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.indacloud-stepbystep.id

  tags = {
    Name = "Indacloud IGW"
  }
}
