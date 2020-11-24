resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr_block
  enable_dns_support = true
  enable_dns_hostnames = true
  assign_generated_ipv6_cidr_block = true

  tags = {
    Name = var.environment_slug
  }
}

resource "aws_vpc_dhcp_options" "main_dhcp_options" {
  domain_name_servers = [
    "AmazonProvidedDNS"
  ]

  tags = {
    Name = "${var.environment_slug}-dhcp-options"
  }
}

resource "aws_vpc_dhcp_options_association" "main_dhcp_options" {
  vpc_id          = aws_vpc.main.id
  dhcp_options_id = aws_vpc_dhcp_options.main_dhcp_options.id
}
