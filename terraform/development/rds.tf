module "rds" {
  source            = "../module/rds"
  engine            = ""
  engine_version    = ""
  instance_class    = ""
  db_family         = ""
  db_name           = ""
  allocated_storage = ""
  multi_az          = false
  subnet_ids        = []
  instance_sg       = [module.engineering_private_subnet.sg_id, module.engineering_public_subnet.id]
  db_username       = ""
  db_password       = ""
}
