#Routing Table for NAT for departmental private subnet
resource "aws_route_table" "engineering_private" {
  vpc_id                      = aws_vpc.departmental.id
  route {
    cidr_block                = var.ALL_IPs
    network_interface_id      = aws_network_interface.engineering_private.id
  }

  tags = {
    Name = "Engineering private Route"
    Department  = "Engineering"
  }
  
  depends_on                  = [ aws_network_interface.engineering_private ]
}

#Routing Table for the engineering public subnet
resource "aws_route_table" "engineering_public" {
  vpc_id                    = aws_vpc.departmental.id
  route {
    cidr_block              = var.ALL_IPs
    gateway_id              = aws_internet_gateway.department.id
  }

  tags = {
    Name                    = "Engineering public Route"
    Department              = "Engineering"
  }
  
  depends_on                = [ aws_internet_gateway.department ]
}
