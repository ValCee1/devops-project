
# Creating Private Public Subnets in departmental VPC
resource "aws_subnet" "engineering_public" {
  vpc_id                  = aws_vpc.departmental.id
  cidr_block              = lookup(var.engineering_subnets, "public")
  map_public_ip_on_launch = "true"
  availability_zone       = data.aws_availability_zones.available.names[0]

  tags = {
    Name = "Engineering Public subnet"
    Department  = "Engineering"
  }
  
  depends_on              = [ aws_vpc.departmental, data.aws_availability_zones.available, data.aws_ami.latest_amazon_linux]
}


# Creating Private Public Subnets in departmental VPC
resource "aws_subnet" "engineering_private" {
  vpc_id                  = aws_vpc.departmental.id
  cidr_block              = lookup(var.engineering_subnets, "private")
  map_public_ip_on_launch = "false"
  availability_zone       = data.aws_availability_zones.available.names[0]

  tags = {
    Name = "Engineering Private subnet"
    Department  = "Engineering"
  }
  
  depends_on              = [ aws_vpc.departmental, data.aws_availability_zones.available, data.aws_ami.latest_amazon_linux]
}
