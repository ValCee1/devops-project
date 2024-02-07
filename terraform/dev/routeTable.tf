#Routing Table for NAT
resource "aws_route_table" "devops_training_privateRoute" {
  vpc_id = aws_vpc.devops_training_vpc.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.devops_training_nat_gw.id
  }

  tags = {
    Name = "devops_training_privateRoute"
  }
}

#Routing Table for the Custom VPC
resource "aws_route_table" "devops_training_publicRoute" {
  vpc_id = aws_vpc.devops_training_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.devops_training_gw.id
  }

  tags = {
    Name = "devops_training_publicRoute"
  }
}


#Routing Proper for public subnet
resource "aws_route_table_association" "devops_training_public_route" {
  subnet_id      = aws_subnet.devops_training_public_subnet.id        #PUBLIC SUBNET
  route_table_id = aws_route_table.devops_training_publicRoute.id
}
