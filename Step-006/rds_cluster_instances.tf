locals {
  engine          = aws_rds_cluster.postgresql.engine
  engine_version  = aws_rds_cluster.postgresql.engine_version
  instance_class  = "db.t3.medium"
}

resource "aws_rds_cluster_instance" "cluster_instance_writer" {
  identifier              = "${var.rds_cluster_id}-writer"
  cluster_identifier      = aws_rds_cluster.postgresql.id
  instance_class          = local.instance_class
  engine                  = local.engine
  engine_version          = local.engine_version
  apply_immediately       = true

  db_subnet_group_name    = aws_db_subnet_group.rds_subnet_group.name
  availability_zone       = "eu-central-1a"
}

resource "aws_rds_cluster_instance" "cluster_instance_reader" {
  identifier              = "${var.rds_cluster_id}-reader"
  cluster_identifier      = aws_rds_cluster.postgresql.id
  instance_class          = local.instance_class
  engine                  = local.engine
  engine_version          = local.engine_version
  apply_immediately       = true

  db_subnet_group_name    = aws_db_subnet_group.rds_subnet_group.name
  availability_zone       = "eu-central-1b"
}
