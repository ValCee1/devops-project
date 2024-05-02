# Variable definitions for Subnet module

variable "ALL_IPs" {
  description = "IP address CIDR and subnet mask for all IP ranges, without exception"
  type        = string
  default     = "0.0.0.0/0"

}
variable "ami" {
  description = "instance_ami to be created"
  type        = string

}
variable "instance_type" {
  description = "Instance Type to be used"
  type        = string
}
variable "instance_ids" {
  description = "Instance IDs to be used"
  type        = list(string)
}

variable "key_name" {
  description = "SSH key name"
  type        = string
}
variable "sg_id" {
  description = "Security group to be attached to autoscaling instances"
  type        = list(string)
}

variable "SSH_PORT" {
  description = "Custom SSH Port"
  type        = number
}


variable "max_size" {
  description = "Maximum Number of Instances"
  type        = number
}
variable "min_size" {
  description = "Minimum Number of Instances"
  type        = number
}
variable "subnet_ids" {
  description = "List of subnet_ids to be linked with the load balancer"
  type        = list(string)
}


variable "trustedIPs" {
  description = "The trusted IP address ranges"
  type        = list(string)
}

variable "vpc_id" {
  description = "ID of the chosen vpc"
  type        = string
}
