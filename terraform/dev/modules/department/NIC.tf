# Network Interface (NIC) created on public subnet
resource "aws_network_interface" "custom_public_NIC" {
  subnet_id       = aws_subnet.custom_public_subnet.id #public subnet
  security_groups = [aws_security_group.custom_sg.id]
  depends_on      = [ aws_internet_gateway.custom_internet_gw, aws_key_pair.devops_training_key, aws_vpc.custom_VPC, aws_subnet.custom_public_subnet, aws_security_group.custom_sg,]

  tags = {
    Name        = "${var.department} public_NIC"
    description   = "NIC for ${var.department} public instance"
    Department  = "${var.department}"
  }     
}

# Network Interface (NIC) created on private subnet
resource "aws_network_interface" "custom_private_NIC" {
  subnet_id       = aws_subnet.custom_private_subnet.id #private subnet
  security_groups = [aws_security_group.custom_sg.id]
  depends_on      = [ aws_internet_gateway.custom_internet_gw, aws_key_pair.devops_training_key, aws_vpc.custom_VPC, aws_subnet.custom_private_subnet, aws_security_group.custom_sg,]
 
  
  tags = {
    Name        = "${var.department} private_NIC"
    description   = "NIC for ${var.department} private instance"
    Department  = "${var.department}"
  }     
}