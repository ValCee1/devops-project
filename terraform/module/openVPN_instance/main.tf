module "openVPN_subnet" {
  source              = "./openVPN_subnets"
  environment         = var.environment
  vpc_id              = var.vpc_id
  availability_zone   = var.azs
  instance_connect_ip = var.instance_connect_ip
}

resource "aws_instance" "openVPN" {
  ami                    = var.ami
  instance_type          = var.instance_type
  vpc_security_group_ids = [module.openVPN_subnet.sg_id]   # Security Group
  subnet_id              = module.openVPN_subnet.subnet_id # public subnet
  key_name               = var.key_name

  root_block_device {
    volume_size           = 8
    delete_on_termination = true
  }

  tags = {
    Name        = "OpenVPN-${var.environment}"
    Environment = "${var.environment}"
    Application = "VPN-${var.environment}"
    Subnet      = "public"
    vpc         = "General-${var.environment}"
  }
}
