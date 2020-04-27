resource "aws_key_pair" "id_rsa" {
  key_name   = "id_rsa"
  public_key = var.bastion_host_public_key
}
