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

resource "aws_instance" "ec2_instance" {
  ami           = "${data.aws_ami.aws_linux.id}"
  instance_type = "t2.micro"

  key_name = aws_key_pair.id_rsa.key_name
  associate_public_ip_address = true

  subnet_id = aws_subnet.indacloud-stepbystep-subnet-a.id
  private_ip = "20.0.1.10"

  vpc_security_group_ids = [
    aws_security_group.http-inbound-traffic.id,
    aws_security_group.ssh-inbound-traffic.id
  ]

  tags = {
    Name = var.ec2_instance_name
  }
}
