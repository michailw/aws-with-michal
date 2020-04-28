resource "aws_db_subnet_group" "rds_subnet_group" {
  subnet_ids = [
    aws_subnet.indacloud-stepbystep-private-subnet-a.id,
    aws_subnet.indacloud-stepbystep-private-subnet-b.id
  ]
}
