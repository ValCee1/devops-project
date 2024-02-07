#Define External IP 
resource "aws_eip" "devops_training_nat" {
  domain   = "vpc"
}


# route associations for private subnet
resource "aws_route_table_association" "level-private-1-a" {
  subnet_id      = aws_subnet.devops_training_private_subnet.id
  route_table_id = aws_route_table.devops_training_privateRoute.id
}


#NAT Gateway using public subnet
resource "aws_nat_gateway" "devops_training_nat_gw" {
  allocation_id = aws_eip.devops_training_nat.id
  subnet_id     = aws_subnet.devops_training_public_subnet.id
  depends_on    = [aws_internet_gateway.devops_training_gw]
}
