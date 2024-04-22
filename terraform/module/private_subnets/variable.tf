# Variable definitions for Subnet module

variable "ALL_IPs" {
  description = "IP address CIDR and subnet mask for all IP ranges, without exception"
  type        = string
  default     = "0.0.0.0/0"

}
variable "availability_zone" {
  description = "Current deployment availability zone"
  type        = string
}

variable "cidr_block" {
  description = "CIDR block for VPC"
  type        = string
}
variable "department" {
  description = "Department of deployment"
  type        = string
}

variable "environment" {
  description = "Current deployment environment"
  type        = string
}

variable "nat_gateway_id" {
  description = "Nat Gateway ID"
  type        = string
}
variable "trustedIPs" {
  description = "List of permitted ips for the security group"
  type        = list(string)
}



variable "vpc_id" {
  description = "ID of the chosen vpc"
  type        = string
}
