# Network Interface (NIC) created on public subnet
resource "aws_network_interface" "engineering_public" {
  subnet_id         = aws_subnet.engineering_public.id #public subnet
  security_groups   = [aws_security_group.departmental.id]

  tags = {
    Name            = "Engineering public_NIC"
    description     = "NIC for Engineering public instance"
    Department      = "Engineering"
  }     
  
  depends_on        = [ aws_internet_gateway.department, aws_key_pair.department, aws_vpc.departmental, aws_subnet.engineering_public ]
}

# Network Interface (NIC) created on private subnet
resource "aws_network_interface" "engineering_private" {
  subnet_id       = aws_subnet.engineering_private.id #private subnet
  security_groups = [aws_security_group.departmental.id]
 
  
  tags = {
    Name        = "Engineering private_NIC"
    description   = "NIC for Engineering private instance"
    Department  = "Engineering"
    }    
     
  depends_on      = [ aws_internet_gateway.department, aws_key_pair.department,  aws_subnet.engineering_private ]
}