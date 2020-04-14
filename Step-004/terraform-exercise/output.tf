output "vpc_id" {
  value = aws_vpc.indacloud-stepbystep.id
}

output "vpc_arn" {
  value = aws_vpc.indacloud-stepbystep.arn
}

output "instance_private_ip" {
  value = aws_instance.ec2_instance.private_ip
}

output "instance_public_ip" {
  value = aws_instance.ec2_instance.public_ip
}
