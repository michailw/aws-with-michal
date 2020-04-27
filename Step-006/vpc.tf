resource "aws_vpc" "indacloud-stepbystep" {
  cidr_block = "20.0.0.0/16"


  enable_dns_hostnames = true
  enable_dns_support = true

  tags = {
    Name = "indacloud-stepbystep"
    Terraform = "true"
  }
}

resource "aws_subnet" "indacloud-stepbystep-subnet-a" {
  vpc_id     = aws_vpc.indacloud-stepbystep.id
  cidr_block = "20.0.1.0/24"
  availability_zone = "eu-central-1a"

  tags = {
    Name = "indacloud-stepbystep-subnet-a"
    Terraform = "true"
  }
}

resource "aws_subnet" "indacloud-stepbystep-subnet-b" {
  vpc_id     = aws_vpc.indacloud-stepbystep.id
  cidr_block = "20.0.2.0/24"
  availability_zone = "eu-central-1b"

  tags = {
    Name = "indacloud-stepbystep-subnet-b"
    Terraform = "true"
  }
}

### Private subnets section

resource "aws_subnet" "indacloud-stepbystep-private-subnet-a" {
  vpc_id     = aws_vpc.indacloud-stepbystep.id
  cidr_block = "20.0.10.0/24"
  availability_zone = "eu-central-1a"

  tags = {
    Name = "indacloud-stepbystep-private-subnet-a"
    Terraform = "true"
  }
}

resource "aws_subnet" "indacloud-stepbystep-private-subnet-b" {
  vpc_id     = aws_vpc.indacloud-stepbystep.id
  cidr_block = "20.0.11.0/24"
  availability_zone = "eu-central-1b"

  tags = {
    Name = "indacloud-stepbystep-private-subnet-b"
    Terraform = "true"
  }
}
