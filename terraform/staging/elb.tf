module "elb" {
  source        = "../module/elb"
  key_name      = aws_key_pair.department.key_name
  vpc_id        = module.vpc.vpc_id
  max_size      = 2
  min_size      = 1
  subnet_ids    = [module.public_subnet.subnet_id]
  ami           = var.ami
  sg_id         = [module.public_subnet.sg_id]
  instance_type = var.instance_type
  instance_ids  = [""]
  trustedIPs    = var.trustedIPs
  SSH_PORT      = var.SSH_PORT
}
