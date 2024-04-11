# Variable definitions for VPC module


variable "ALL_IPs" {
  description = "IP address CIDR and subnet mask for all IP ranges, without exception"
  type        = string
  default     = "0.0.0.0/0"

}
variable "department" {
  description = "Department of deployment"
  type        = string
  default     = "general"
}

variable "environment" {
  description = "Current deployment environment"
  type        = string
}

variable "trustedIPs" {
  description = ""
  type        = list(string)
}


variable "vpc_id" {
  description = "ID of the chosen vpc"
  type        = string
}
