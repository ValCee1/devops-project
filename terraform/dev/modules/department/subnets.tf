
# Creating Private Public Subnets in Custom VPC
resource "aws_subnet" "custom_public_subnet" {
  vpc_id                  = aws_vpc.custom_VPC.id
  cidr_block              = var.custom_subnets[0]
  map_public_ip_on_launch = "true"
  availability_zone       = var.availability_zone
  depends_on              = [ aws_vpc.custom_VPC ]
  tags = {
    Name = "${var.department} Public subnet"
    Department  = "${var.department}"
  }
}


# Creating Private Public Subnets in Custom VPC
resource "aws_subnet" "custom_private_subnet" {
  vpc_id                  = aws_vpc.custom_VPC.id
  cidr_block              = var.custom_subnets[1]
  map_public_ip_on_launch = "false"
  availability_zone       = var.availability_zone
  depends_on              = [ aws_vpc.custom_VPC ]
  tags = {
    Name = "${var.department} Private subnet"
    Department  = "${var.department}"
  }
}
