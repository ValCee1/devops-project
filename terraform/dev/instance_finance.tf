/*
resource "aws_instance" "finance_public" {
  ami                     = var.ami  
  instance_type           = var.instance_type
  key_name                = aws_key_pair.department.key_name  
  # vpc_security_group_ids  = [var.sg_id]   # Security Group
  # subnet_id               = aws_subnet.finance_public.id  # public subnet
  depends_on              = [aws_internet_gateway.department, aws_key_pair.department,aws_subnet.finance_public,   aws_route_table.finance_public]
  
  network_interface {
    network_interface_id  = aws_network_interface.finance_public.id
    device_index          = 0
  }
  root_block_device {
    volume_size           = 8
    delete_on_termination = true
  }

  tags = {
    Name        = "finance Public Instance"
    Environment = "development"
    Application = "web"
    Subnet      = "public"
    vpc         = "departmental"
    Department  = "finance"
  }
}
*/

resource "aws_instance" "finance_private" {
  ami                     = var.ami   
  instance_type           = var.instance_type
  key_name                = aws_key_pair.department.key_name  
  # vpc_security_group_ids  = [var.sg_id]   # Security Group
  # subnet_id               = aws_subnet.finance_private.id  # private subnet
  
  network_interface {
    network_interface_id  = aws_network_interface.finance_private.id
    device_index          = 0
  }
  root_block_device {
    volume_size           = 8
    delete_on_termination = true
  }

  tags = {
    Name        = "finance Private Instance"
    Environment = "development"
    Application = "web"
    Subnet      = "private"
    vpc         = "departmental"
    Department  = "finance"
  }
  
  depends_on              = [ aws_internet_gateway.department, aws_key_pair.department, aws_subnet.finance_private,   aws_route_table.finance_private, aws_network_interface.finance_private]
}
