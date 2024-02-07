# Creating Public Subnets in Custom VPC
resource "aws_subnet" "devops_training_public_subnet" {
  vpc_id     = aws_vpc.devops_training_vpc.id
  cidr_block = "10.0.1.0/24"
  map_public_ip_on_launch = "true"
  availability_zone = data.aws_availability_zones.available.names[0]
  
  tags = {
    Name = "devops_training_public_subnet"
  }
}

# Creating Private Subnets in Custom VPC
resource "aws_subnet" "devops_training_private_subnet" {
  vpc_id                  = aws_vpc.devops_training_vpc.id
  cidr_block              = "10.0.2.0/24"
  map_public_ip_on_launch = "false"
  availability_zone       = data.aws_availability_zones.available.names[0]

  tags = {
    Name = "devops_training_private_subnet"
  }
}

