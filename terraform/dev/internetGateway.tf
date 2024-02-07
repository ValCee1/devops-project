# Custom internet Gateway for VPC
resource "aws_internet_gateway" "devops_training_gw" {
  vpc_id = aws_vpc.devops_training_vpc.id

  tags = {
    Name = "devops_training_gw"
  }
}
