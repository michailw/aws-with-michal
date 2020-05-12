output "ec2_private_ip" {
  value = aws_instance.ec2_instance.private_ip
}

output "remote_state_provider" {
  value = data.terraform_remote_state.my_stack.outputs.ec2_private_ip
}