#Routing Table for NAT for departmental private subnet
resource "aws_route_table" "marketing_private" {
  vpc_id                      = aws_vpc.departmental.id
  route {
    cidr_block                = var.ALL_IPs
    network_interface_id      = aws_network_interface.marketing_private.id
  }

  tags = {
    Name = "marketing private Route"
    Department  = "marketing"
  }
  
  depends_on                  = [ aws_network_interface.marketing_private ]
}

#Routing Table for the marketing public subnet
resource "aws_route_table" "marketing_public" {
  vpc_id                    = aws_vpc.departmental.id

  route {
    cidr_block              = var.ALL_IPs
    gateway_id              = aws_internet_gateway.department.id
  }

  tags = {
    Name                    = "marketing public Route"
    Department              = "marketing"
  }
  
  depends_on                = [ aws_internet_gateway.department ]
}
