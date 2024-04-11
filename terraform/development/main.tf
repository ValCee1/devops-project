module "data" {
  source = "../module/data"
}
module "vpc" {
  source      = "../module/vpc"
  vpc_cidr    = var.vpc_cidr
  environment = var.environment
}

module "security_group" {
  source      = "../module/security_group"
  environment = var.environment
  vpc_id      = module.vpc.vpc_id
  trustedIPs  = var.trustedIPs
  depends_on  = [module.vpc]
}

module "engineering_private_subnet" {
  source            = "../module/private_subnets"
  environment       = var.environment
  vpc_id            = module.vpc.vpc_id
  availability_zone = "module.data.availability_zone[0]"
  cidr_block        = lookup(var.engineering_subnets, "private")
  department        = "engineering"
}

module "engineering_public_subnet" {
  source            = "../module/public_subnets"
  environment       = var.environment
  department        = "engineering"
  vpc_id            = module.vpc.vpc_id
  availability_zone = module.data.availability_zone[0]
  cidr_block        = lookup(var.engineering_subnets, "public")
}

module "engineering_instance" {
  source               = "../module/instances"
  environment          = var.environment
  department           = "engineering"
  security_group_id    = module.security_group.sg_id
  private_subnet_id    = module.engineering_private_subnet.subnet_id
  public_subnet_id     = module.engineering_public_subnet.subnet_id
  instance_type        = var.instance_type
  create_priv_instance = true
  create_pub_instance  = true
}

module "openVPN_instance" {
  source               = "../module/instances"
  environment          = var.environment
  ami                  = var.openvpn_ami
  security_group_id    = module.security_group.sg_id
  private_subnet_id    = ""
  instance_type        = var.instance_type
  public_subnet_id     = module.engineering_public_subnet.subnet_id
  create_priv_instance = false
  create_pub_instance  = true
}
