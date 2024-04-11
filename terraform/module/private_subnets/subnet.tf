

# Creating Private Public Subnets in departmental VPC
resource "aws_subnet" "private" {
  vpc_id                  = var.vpc_id
  cidr_block              = var.cidr_block
  map_public_ip_on_launch = false
  availability_zone       = var.availability_zone

  tags = {
    Name        = "${var.department}-Private-subnet"
    Department  = "${var.department}"
    Environment = "${var.environment}"
  }
}
