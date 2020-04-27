resource "aws_eip" "bastion_eip" {
  instance = aws_instance.bastion_host.id
  vpc = true
}
