# Custom internet Gateway for VPC
# This is the first step to ensure that our instances on this vpc can communicate to
# the outside world using the public ip address

resource "aws_internet_gateway" "custom_internet_gw" {
  vpc_id        = aws_vpc.custom_VPC.id
  depends_on    = [ aws_vpc.custom_VPC ]
  tags = {
    Name = "${var.department} internet_gw"
    Department  = "${var.department}"
  }
}
