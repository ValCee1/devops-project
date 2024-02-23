variable "ami" {}
variable "AWS_SECRET_KEY" {
  type = string
}
variable "AWS_ACCESS_KEY" {
  type = string
}
variable "AWS_REGION" {}
variable "department" {}
variable "engineering_subnets" {}
variable "marketing_subnets" {}
variable "finance_subnets" {}
variable "instance_type" {}
variable "key_name" {}
variable "no_of_instances" {}
#variable "openvpn_ami" {}

variable "PATH_TO_PRIVATE_KEY" {}
variable "PATH_TO_PUBLIC_KEY" {}
variable "SSH_PORT" {}
variable "trustedIPs" {}
variable "vpc_cidr" {}
