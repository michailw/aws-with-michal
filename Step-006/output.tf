output "vpc_id" {
  value = aws_vpc.indacloud-stepbystep.id
}

output "vpc_arn" {
  value = aws_vpc.indacloud-stepbystep.arn
}

output "bastion_ip" {
  value = aws_eip.bastion_eip.public_ip
}
