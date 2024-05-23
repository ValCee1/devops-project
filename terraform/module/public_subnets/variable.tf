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

variable "environment" {
  description = "Current deployment environment"
  type        = string
}

variable "openVPN_ip" {
  description = "IP address for openVPN"
  type        = string
}
variable "SSH_PORT" {
  description = "Custom SSH Port"
  type        = number
}


variable "vpc_id" {
  description = "ID of the chosen vpc"
  type        = string
}
