#Creating Engineering VPC
resource "aws_vpc" "custom_VPC" {
  cidr_block           = lookup(var.vpc_cidr, var.department)
  instance_tenancy     = "default"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"

  tags = {
    Name = "${var.department} VPC"
    Department  = "${var.department}"
  }
}