output "vpc_id" {
  value = aws_vpc.indacloud-stepbystep.id
}

output "vpc_arn" {
  value = aws_vpc.indacloud-stepbystep.arn
}

output "bastion_ip" {
  value = aws_eip.bastion_eip.public_ip
}

output "rds_read_endpoint" {
  value = aws_rds_cluster.postgresql.reader_endpoint
}

output "rds_write_endpoint" {
  value = aws_rds_cluster.postgresql.endpoint
}
