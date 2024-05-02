
module "public_instance" {
  source             = "../module/public_instance"
  ami                = var.ami
  environment        = var.environment
  department         = "engineering"
  security_group_ids = [module.public_subnet.sg_id]
  public_subnet_id   = module.public_subnet.subnet_id
  instance_type      = var.instance_type
  depends_on         = [module.public_subnet]
  sh_script          = file("my_shell.sh")
  key_name           = var.key_name
}
