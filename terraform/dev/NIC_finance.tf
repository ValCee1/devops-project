# Network Interface (NIC) created on public subnet
resource "aws_network_interface" "finance_public" {
  subnet_id         = aws_subnet.finance_public.id #public subnet
  security_groups   = [aws_security_group.departmental.id]

  tags = {
    Name            = "finance public_NIC"
    description     = "NIC for finance public instance"
    Department      = "finance"
  }     
  
  depends_on        = [ aws_internet_gateway.department, aws_key_pair.department, aws_vpc.departmental, aws_subnet.finance_public ]
}

# Network Interface (NIC) created on private subnet
resource "aws_network_interface" "finance_private" {
  subnet_id       = aws_subnet.finance_private.id #private subnet
  security_groups = [aws_security_group.departmental.id]
 
  
  tags = {
    Name        = "finance private_NIC"
    description   = "NIC for finance private instance"
    Department  = "finance"
  }     
  
  depends_on      = [ aws_internet_gateway.department, aws_key_pair.department,  aws_subnet.finance_private ]
}