#Creating gENERAL DEPARTMENTAL VPC
resource "aws_vpc" "general" {
  cidr_block           = var.vpc_cidr
  instance_tenancy     = "default"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"


  tags = {
    Name        = "General departmental VPC"
    Department  = "general"
    Environment = "${var.environment}"
    Terraform   = "true"
  }
}
