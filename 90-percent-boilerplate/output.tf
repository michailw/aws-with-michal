output "private_subnets_ids" {
  value = [
    aws_subnet.subnet_private_1.id,
    aws_subnet.subnet_private_2.id
  ]
}
