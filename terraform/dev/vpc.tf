#Creating gENERAL DEPARTMENTAL VPC
resource "aws_vpc" "departmental" {
  cidr_block           = lookup(var.vpc_cidr, "general")
  instance_tenancy     = "default"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"

  tags = {
    Name = "General departmental VPC"
    Department  = "general"
  }
}