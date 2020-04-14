resource "aws_vpc" "vpc-test1" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "test-vpc"
    Terraform = "true"
  }
}

resource "aws_subnet" "subnet-1a" {
  cidr_block = "10.0.1.0/24"
  vpc_id = aws_vpc.vpc-test1.id
  availability_zone = "us-east-1a"

  tags = {
    Name = "test-vpc-subnet-1a"
    Terraform = "true"
  }
}

resource "aws_subnet" "subnet-1b" {
  cidr_block = "10.0.2.0/24"
  vpc_id = aws_vpc.vpc-test1.id
  availability_zone = "us-east-1b"

  tags = {
    Name = "test-vpc-subnet-1b"
    Terraform = "true"
  }
}
