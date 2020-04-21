output "vpc_id" {
  value = aws_vpc.indacloud-stepbystep.id
}

output "vpc_arn" {
  value = aws_vpc.indacloud-stepbystep.arn
}

output "rds_endpoint" {
  value = aws_db_instance.indacloud_rds.endpoint
}
