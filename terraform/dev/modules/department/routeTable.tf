#Routing Table for NAT for custom private subnet
resource "aws_route_table" "custom_privateRoute" {
  vpc_id = aws_vpc.custom_VPC.id
  depends_on = [ aws_vpc.custom_VPC, aws_network_interface.custom_private_NIC ]
  route {
    cidr_block                = "0.0.0.0/0"
    network_interface_id      = aws_network_interface.custom_private_NIC.id
  }

  tags = {
    Name = "${var.department} private Route"
    Department  = "${var.department}"
  }
}

#Routing Table for the custom public subnet
resource "aws_route_table" "custom_publicRoute" {
  vpc_id = aws_vpc.custom_VPC.id
  depends_on = [ aws_vpc.custom_VPC, aws_internet_gateway.custom_internet_gw ]
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.custom_internet_gw.id
  }

  tags = {
    Name = "${var.department} public Route"
    Department  = "${var.department}"
  }
}
