# Network Interface (NIC) created on public subnet
resource "aws_network_interface" "marketing_public" {
  subnet_id         = aws_subnet.marketing_public.id #public subnet
  security_groups   = [aws_security_group.departmental.id]

  tags = {
    Name            = "marketing public_NIC"
    description     = "NIC for marketing public instance"
    Department      = "marketing"
  }     
  
  depends_on        = [ aws_internet_gateway.department, aws_key_pair.department, aws_vpc.departmental, aws_subnet.marketing_public ]
}

# Network Interface (NIC) created on private subnet
resource "aws_network_interface" "marketing_private" {
  subnet_id       = aws_subnet.marketing_private.id #private subnet
  security_groups = [aws_security_group.departmental.id]
 
  
  tags = {
    Name        = "marketing private_NIC"
    description   = "NIC for marketing private instance"
    Department  = "marketing"
  }     
  
  depends_on      = [ aws_internet_gateway.department, aws_key_pair.department,  aws_subnet.marketing_private ]
}