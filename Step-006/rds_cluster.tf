resource "aws_rds_cluster" "postgresql" {
  cluster_identifier      = var.rds_cluster_id
  engine                  = "aurora-postgresql"
  engine_version          = "11.6"
  availability_zones      = ["eu-central-1a", "eu-central-1b", "eu-central-1c"]
  database_name           = "indacloud"
  master_username         = var.rds_master_user
  master_password         = var.rds_master_password
  backup_retention_period = 5
  preferred_backup_window = "07:00-09:00"

  deletion_protection     = var.rds_delete_protection
  skip_final_snapshot     = var.rds_skip_final_snapshot

  db_subnet_group_name    = aws_db_subnet_group.rds_subnet_group.name

  apply_immediately       = true

  vpc_security_group_ids = [
    aws_security_group.rds_security_group.id
  ]
}
