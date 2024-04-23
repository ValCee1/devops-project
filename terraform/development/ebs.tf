# Create EBS Volume to attach to engineering instance
module "ebs" {
  source      = "../module/ebs"
  vpc_id      = module.vpc.vpc_id
  environment = var.environment
  department  = "engineering"
  instance_id = module.engineering_instance.instance_id
  azs         = module.engineering_instance.azs
  ebs_size    = "20"
  ebs_type    = "gp2"
}
