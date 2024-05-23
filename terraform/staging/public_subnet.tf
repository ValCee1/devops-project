
module "frontend_subnet" {
  source            = "../module/public_subnets"
  environment       = var.environment
  vpc_id            = module.vpc.vpc_id
  availability_zone = module.data.availability_zone[0]
  cidr_block        = lookup(var.subnet_cidr, "private")
  SSH_PORT          = var.SSH_PORT
  openVPN_ip        = module.openVPN_instance.private_ip
}
