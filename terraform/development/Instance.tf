
module "engineering_instance" {
  source             = "../module/private_instance"
  ami                = var.ami
  environment        = var.environment
  department         = "engineering"
  security_group_ids = [module.engineering_private_subnet.sg_id]
  private_subnet_id  = module.engineering_private_subnet.subnet_id
  instance_type      = var.instance_type
}

module "openVPN_instance" {
  source            = "../module/public_instance"
  environment       = var.environment
  ami               = var.openvpn_ami
  security_group_id = module.engineering_public_subnet.sg_id
  instance_type     = var.instance_type
  public_subnet_id  = module.engineering_public_subnet.subnet_id
}
