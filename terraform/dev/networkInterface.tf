# Network Interface (NIC) created on public subnet
resource "aws_network_interface" "devops_training_public_NIC" {
  subnet_id       = aws_subnet.devops_training_public_subnet.id        #public subnet
  security_groups = [aws_security_group.devops_training_sg.id]
  
}

# Network Interface (NIC) created on private subnet
resource "aws_network_interface" "devops_training_private_NIC" {
  subnet_id       = aws_subnet.devops_training_private_subnet.id        #public subnet
  security_groups = [aws_security_group.devops_training_sg.id]

}