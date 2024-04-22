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
  description = "CIDR block for public subnet"
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

variable "gateway_id" {
  description = "Internet gateway for all subnets"
  type        = string
  default     = ""
}
variable "trustedIPs" {
  description = ""
  type        = list(string)
}



variable "vpc_id" {
  description = "ID of the chosen vpc"
  type        = string
}
