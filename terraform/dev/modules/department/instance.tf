resource "aws_instance" "custom_public_instance" {
  ami                     = var.ami  
  instance_type           = var.instance_type
  key_name                = aws_key_pair.devops_training_key.key_name  
  # vpc_security_group_ids  = [aws_security_group.custom_sg.id]   # Security Group
  # subnet_id               = aws_subnet.custom_public_subnet.id  # public subnet
  depends_on              = [aws_internet_gateway.custom_internet_gw, aws_key_pair.devops_training_key, aws_vpc.custom_VPC, aws_subnet.custom_public_subnet, aws_security_group.custom_sg, aws_route_table.custom_publicRoute]
  
  network_interface {
    network_interface_id  = aws_network_interface.custom_public_NIC.id
    device_index          = 0
  }
  root_block_device {
    volume_size           = 8
    delete_on_termination = true
  }

  tags = {
    Name        = "${var.department} Public Instance"
    Environment = "development"
    Application = "web"
    Subnet      = "public"
    vpc         = "custom"
    Department  = "${var.department}"
  }
}

resource "aws_instance" "custom_private_instance" {
  ami                     = var.ami   
  instance_type           = var.instance_type
  key_name                = aws_key_pair.devops_training_key.key_name  
  # vpc_security_group_ids  = [aws_security_group.custom_sg.id]   # Security Group
  # subnet_id               = aws_subnet.custom_private_subnet.id  # private subnet
  depends_on              = [ aws_internet_gateway.custom_internet_gw, aws_key_pair.devops_training_key, aws_vpc.custom_VPC, aws_subnet.custom_private_subnet, aws_security_group.custom_sg, aws_route_table.custom_privateRoute]
  
  network_interface {
    network_interface_id  = aws_network_interface.custom_private_NIC.id
    device_index          = 0
  }
  root_block_device {
    volume_size           = 8
    delete_on_termination = true
  }

  tags = {
    Name        = "${var.department} Private Instance"
    Environment = "development"
    Application = "web"
    Subnet      = "private"
    vpc         = "custom"
    Department  = "${var.department}"
  }
}
