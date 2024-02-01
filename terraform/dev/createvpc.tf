#Creating my AWS VPC
resource "aws_vpc" "devops_training" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
 
  tags = {
    Name = "devops_training"
  }
}

# Private Subnets in Custom VPC
resource "aws_subnet" "devops_training_public" {
  vpc_id     = aws_vpc.devops_training.id
  cidr_block = "10.0.1.0/24"
  map_public_ip_on_launch = "true"
  availability_zone = data.aws_availability_zones.available.names[0]

  tags = {
    Name = "devops_training_public"
  }
}

# Private Subnets in Custom VPC
resource "aws_subnet" "devops_training_private" {
  vpc_id                  = aws_vpc.devops_training.id
  cidr_block              = "10.0.2.0/24"
  map_public_ip_on_launch = "false"
  availability_zone       = data.aws_availability_zones.available.names[0]

  tags = {
    Name = "devops_training_private"
  }
}


# Custom internet Gateway
resource "aws_internet_gateway" "devops_training_gw" {
  vpc_id = aws_vpc.devops_training.id

  tags = {
    Name = "devops_training_gw"
  }
}

#Routing Table for the Custom VPC
resource "aws_route_table" "devops_training_public" {
  vpc_id = aws_vpc.devops_training.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.devops_training_gw.id
  }

  tags = {
    Name = "devops_training_public"
  }
}

#Routing Proper
resource "aws_route_table_association" "devops_training_public" {
  subnet_id      = aws_subnet.devops_training_public.id
  route_table_id = aws_route_table.devops_training_public.id
}
