# Custom internet Gateway for VPC
resource "aws_internet_gateway" "devops_training_gw" {
  vpc_id = aws_vpc.devops_training_vpc.id

  tags = {
    Name = "devops_training_gw"
  }
}

#NAT Gateway using public subnet
resource "aws_nat_gateway" "devops_training_nat_gw" {
  allocation_id = aws_eip.devops_training_nat.id
  subnet_id     = aws_subnet.devops_training_public_subnet.id
  depends_on    = [aws_internet_gateway.devops_training_gw]
}
