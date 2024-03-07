# departmental internet Gateway for VPC
# This is the first step to ensure that our instances on this vpc can communicate to
# the outside world using the public ip address

resource "aws_internet_gateway" "department" {
  vpc_id              = aws_vpc.departmental.id

  tags = {
    Name              = "Departmental Internet_gw"
    Department        = "General"
  }
  
  depends_on          = [ aws_vpc.departmental ]
}
