module "openVPN_subnet" {
  source            = "./openVPN_subnets"
  environment       = var.environment
  vpc_id            = var.vpc_id
  availability_zone = var.azs
}

resource "aws_instance" "openVPN" {
  ami                    = var.ami
  instance_type          = var.instance_type
  vpc_security_group_ids = [module.openVPN_subnet.sg_id]   # Security Group
  subnet_id              = module.openVPN_subnet.subnet_id # public subnet

  root_block_device {
    volume_size           = 8
    delete_on_termination = true
  }

  tags = {
    Name        = "${var.environment} Public Instance"
    Environment = "${var.environment}"
    Application = "web-${var.environment} "
    Subnet      = "public"
    vpc         = "General-${var.environment}"
  }
}
