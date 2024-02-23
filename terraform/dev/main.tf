
module "engineering" {
  source = "./modules/department"
  ami                         = var.ami
  AWS_ACCESS_KEY              = var.AWS_ACCESS_KEY
  AWS_REGION                  = var.AWS_REGION
  AWS_SECRET_KEY              = var.AWS_SECRET_KEY
  availability_zone           = data.aws_availability_zones.available.names[0]
  custom_subnets              = var.engineering_subnets
  department                  = "engineering"
  instance_type               = var.instance_type
  key_name                    = var.key_name
  no_of_instances             = var.no_of_instances[1]
  PATH_TO_PUBLIC_KEY          = var.PATH_TO_PUBLIC_KEY
  PATH_TO_PRIVATE_KEY         = var.PATH_TO_PRIVATE_KEY
  SSH_PORT                    = var.SSH_PORT
  trustedIPs                  = var.trustedIPs
  vpc_cidr                    = var.vpc_cidr
}


module "marketing" {
  source = "./modules/department"
  ami                         = var.ami
  AWS_ACCESS_KEY              = var.AWS_ACCESS_KEY
  AWS_REGION                  = var.AWS_REGION
  AWS_SECRET_KEY              = var.AWS_SECRET_KEY
  availability_zone           = data.aws_availability_zones.available.names[0]
  custom_subnets              = var.marketing_subnets
  department                  = "marketing"
  instance_type               = var.instance_type
  key_name                    = var.key_name
  no_of_instances             = var.no_of_instances[1]
  PATH_TO_PUBLIC_KEY          = var.PATH_TO_PUBLIC_KEY
  PATH_TO_PRIVATE_KEY         = var.PATH_TO_PRIVATE_KEY
  SSH_PORT                    = var.SSH_PORT
  trustedIPs                  = var.trustedIPs
  vpc_cidr                    = var.vpc_cidr
}


module "finance" {
  source = "./modules/department"
  ami                         = var.ami
  AWS_ACCESS_KEY              = var.AWS_ACCESS_KEY
  AWS_REGION                  = var.AWS_REGION
  AWS_SECRET_KEY              = var.AWS_SECRET_KEY
  availability_zone           = data.aws_availability_zones.available.names[0]
  custom_subnets              = var.finance_subnets
  department                  = "finance"
  instance_type               = var.instance_type
  key_name                    = var.key_name
  no_of_instances             = var.no_of_instances[1]
  PATH_TO_PUBLIC_KEY          = var.PATH_TO_PUBLIC_KEY
  PATH_TO_PRIVATE_KEY         = var.PATH_TO_PRIVATE_KEY
  SSH_PORT                    = var.SSH_PORT
  trustedIPs                  = var.trustedIPs
  vpc_cidr                    = var.vpc_cidr
}

