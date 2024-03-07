#Routing Table for NAT for departmental private subnet
resource "aws_route_table" "finance_private" {
  vpc_id                      = aws_vpc.departmental.id

  route {
    cidr_block                = var.ALL_IPs
    network_interface_id      = aws_network_interface.finance_private.id
  }

  tags = {
    Name = "finance private Route"
    Department  = "finance"
  }
  
  depends_on                  = [ aws_network_interface.finance_private ]
}

#Routing Table for the finance public subnet
resource "aws_route_table" "finance_public" {
  vpc_id                    = aws_vpc.departmental.id

  route {
    cidr_block              = var.ALL_IPs
    gateway_id              = aws_internet_gateway.department.id
  }

  tags = {
    Name                    = "finance public Route"
    Department              = "finance"
  }
  
  depends_on                = [ aws_internet_gateway.department ]
}
