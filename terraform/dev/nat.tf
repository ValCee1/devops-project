#Define External IP 
resource "aws_eip" "devops_training_nat" {
  domain   = "vpc"
}



#NAT Gateway using public subnet
resource "aws_nat_gateway" "devops_training_nat_gw" {
  allocation_id = aws_eip.devops_training_nat.id
  subnet_id     = aws_subnet.devops_training_private_subnet.id
  depends_on    = [aws_internet_gateway.devops_training_gw]
}
