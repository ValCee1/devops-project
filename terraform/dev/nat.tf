#Define External IP 
resource "aws_eip" "devops_training_nat" {
  domain   = "vpc"
}


# route associations for private subnet
resource "aws_route_table_association" "level-private-1-a" {
  subnet_id      = aws_subnet.devops_training_private_subnet.id
  route_table_id = aws_route_table.devops_training_privateRoute.id
}

