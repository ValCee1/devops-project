
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
    }
  }
}


provider "aws" {
  access_key                      = var.AWS_ACCESS_KEY
  secret_key                      = var.AWS_SECRET_KEY
  region                          = lookup(var.AWS_REGION, "engineering"  )
  alias                           = "engineering"   
}


provider "aws" {
  access_key                      = var.AWS_ACCESS_KEY
  secret_key                      = var.AWS_SECRET_KEY
  region                          = lookup(var.AWS_REGION, "marketing"  )
  alias                           = "marketing"   
}


provider "aws" {
  access_key                      = var.AWS_ACCESS_KEY
  secret_key                      = var.AWS_SECRET_KEY
  region                          = lookup(var.AWS_REGION, "finance"  )
  alias                           = "finance"   
}

