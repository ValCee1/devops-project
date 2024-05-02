
module "public_subnet" {
  source              = "../module/public_subnets"
  environment         = var.environment
  vpc_id              = module.vpc.vpc_id
  availability_zone   = module.data.availability_zone[0]
  cidr_block          = lookup(var.engineering_subnets, "public")
  department          = var.department
  trustedIPs          = var.trustedIPs
  SSH_PORT            = var.SSH_PORT
  instance_connect_ip = module.data.instance_connect_ips
}
