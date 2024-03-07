/*
resource "aws_instance" "marketing_public" {
  ami                     = var.ami  
  instance_type           = var.instance_type
  key_name                = aws_key_pair.department.key_name  
  # vpc_security_group_ids  = [var.sg_id]   # Security Group
  # subnet_id               = aws_subnet.marketing_public.id  # public subnet
  depends_on              = [aws_internet_gateway.department, aws_key_pair.department,aws_subnet.marketing_public,   aws_route_table.marketing_public]
  
  network_interface {
    network_interface_id  = aws_network_interface.marketing_public.id
    device_index          = 0
  }
  root_block_device {
    volume_size           = 8
    delete_on_termination = true
  }

  tags = {
    Name        = "marketing Public Instance"
    Environment = "development"
    Application = "web"
    Subnet      = "public"
    vpc         = "departmental"
    Department  = "marketing"
  }
}
*/

resource "aws_instance" "marketing_private" {
  ami                     = var.ami   
  instance_type           = var.instance_type
  key_name                = aws_key_pair.department.key_name  
  # vpc_security_group_ids  = [var.sg_id]   # Security Group
  # subnet_id               = aws_subnet.marketing_private.id  # private subnet
  depends_on              = [ aws_internet_gateway.department, aws_key_pair.department, aws_subnet.marketing_private,   aws_route_table.marketing_private, aws_network_interface.marketing_private]
  
  network_interface {
    network_interface_id  = aws_network_interface.marketing_private.id
    device_index          = 0
  }
  root_block_device {
    volume_size           = 8
    delete_on_termination = true
  }

  tags = {
    Name        = "marketing Private Instance"
    Environment = "development"
    Application = "web"
    Subnet      = "private"
    vpc         = "departmental"
    Department  = "marketing"
  }
}
