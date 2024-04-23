module "rds" {
  source            = "../module/rds"
  vpc_id            = module.vpc.vpc_id
  availability_zone = module.engineering_instance.azs # Same availaibility zone as the instance that will access it
  engine            = "mariadb"
  engine_version    = "10"
  instance_class    = var.instance_type
  db_family         = ""
  db_name           = "mariadb"
  allocated_storage = 20
  multi_az          = false
  subnet_ids        = [module.engineering_private_subnet.subnet_id, module.engineering_public_subnet.subnet_id]
  instance_sg       = [module.engineering_private_subnet.sg_id, module.engineering_public_subnet.sg_id]
  db_username       = "Emerie"
  db_password       = "Valentine"
}
