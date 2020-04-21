locals {
  db_subnet_group_name = "indacloud-subnet-group"
  db_rds_name = "IndacloudRDS"
}

resource "aws_db_subnet_group" "indacloud_subnet_group" {
  name       = local.db_subnet_group_name
  subnet_ids = [
    aws_subnet.indacloud-stepbystep-subnet-a.id,
    aws_subnet.indacloud-stepbystep-subnet-b.id
  ]

  tags = {
    Name = local.db_subnet_group_name
  }
}

resource "aws_db_instance" "indacloud_rds" {
  allocated_storage    = 20
  storage_type         = "gp2"
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t2.micro"
  name                 = local.db_rds_name
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

  tags = {
    Name = local.db_rds_name
  }
}
