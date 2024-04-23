module "autoscale" {
  source        = "../module/autoscaling"
  key_name      = aws_key_pair.department.key_name
  vpc_id        = module.vpc.vpc_id
  ami           = var.ami
  subnet_ids    = [module.engineering_private_subnet.subnet_id, module.engineering_public_subnet.subnet_id]
  instance_type = var.instance_type
  min_size      = 1
  max_size      = 2
  min_threshold = 30
  max_threshold = 50
}
