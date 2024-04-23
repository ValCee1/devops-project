resource "aws_instance" "private" {
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = var.security_group_ids # Security Group
  subnet_id              = var.private_subnet_id  # private subnet

  root_block_device {
    volume_size           = 8
    delete_on_termination = true
  }

  tags = {
    Name        = "${var.environment} Public Instance"
    Environment = "${var.environment}"
    Application = "web-${var.environment} "
    Subnet      = "private"
    vpc         = "General-${var.environment} "
    Department  = "${var.department} "
  }
}
