resource "aws_instance" "engineering_public" {
  ami                     = var.ami  
  instance_type           = var.instance_type
  key_name                = aws_key_pair.department.key_name  
  # vpc_security_group_ids  = [var.sg_id]   # Security Group
  # subnet_id               = aws_subnet.engineering_public.id  # public subnet
  
  network_interface {
    network_interface_id  = aws_network_interface.engineering_public.id
    device_index          = 0
  }
  root_block_device {
    volume_size           = 8
    delete_on_termination = true
  }

  tags = {
    Name        = "Engineering Public Instance"
    Environment = "development"
    Application = "web"
    Subnet      = "public"
    vpc         = "departmental"
    Department  = "Engineering"
  }
  
  depends_on              = [aws_internet_gateway.department, aws_key_pair.department,aws_subnet.engineering_public,   aws_route_table.engineering_public]
}

resource "aws_instance" "engineering_private" {
  ami                     = var.ami   
  instance_type           = var.instance_type
  key_name                = aws_key_pair.department.key_name  
  # vpc_security_group_ids  = [var.sg_id]   # Security Group
  # subnet_id               = aws_subnet.engineering_private.id  # private subnet

  network_interface {
    network_interface_id  = aws_network_interface.engineering_private.id
    device_index          = 0
  }
  root_block_device {
    volume_size           = 8
    delete_on_termination = true
  }

  tags = {
    Name        = "Engineering Private Instance"
    Environment = "development"
    Application = "web"
    Subnet      = "private"
    vpc         = "departmental"
    Department  = "Engineering"
  }

  depends_on              = [ aws_internet_gateway.department, aws_key_pair.department, aws_subnet.engineering_private,   aws_route_table.engineering_private, aws_network_interface.engineering_private]
  
}
