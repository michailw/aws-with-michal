data "aws_ami" "aws_linux" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["137112412989"] # AWS
}

resource "aws_instance" "bastion_host" {
  ami           = "${data.aws_ami.aws_linux.id}"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.indacloud-stepbystep-subnet-b.id

  key_name = aws_key_pair.id_rsa.key_name

  vpc_security_group_ids = [
    aws_security_group.ssh-inbound-traffic.id
  ]

  tags = {
    Name = var.bastion_host_name
  }
}
