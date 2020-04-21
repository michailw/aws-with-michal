resource "aws_db_subnet_group" "indacloud_subnet_group" {
  name       = "indacloud-rds-subnet-group"
  subnet_ids = [
    aws_subnet.indacloud-stepbystep-subnet-a.id,
    aws_subnet.indacloud-stepbystep-subnet-b.id
  ]
}

resource "aws_db_instance" "indacloud_rds" {
  allocated_storage    = 20
  storage_type         = "gp2"
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t2.micro"
  name                 = "indacloudRDS"
  username             = var.rds_master_user
  password             = var.rds_master_password
  parameter_group_name = "default.mysql5.7"

  publicly_accessible = true
  deletion_protection = var.rds_delete_protection
  skip_final_snapshot = var.rds_skip_final_snapshot

  db_subnet_group_name = aws_db_subnet_group.indacloud_subnet_group.name
  vpc_security_group_ids = [
    aws_security_group.rds-inbound-traffic.id
  ]
}
