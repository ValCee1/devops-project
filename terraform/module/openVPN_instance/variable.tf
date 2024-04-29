variable "ami" {
  description = "Free tier Amazon-linux ami"
  type        = string
  default     = "ami-07bf5da57dc62b064"
}
variable "azs" {
  description = "Availability zone for open VPN"
  type        = string
}
variable "environment" {
  description = "Current deployment environment"
  type        = string
}
variable "instance_type" {
  description = "Free-tier instance type for training purposes"
  type        = string
  default     = "t2.micro"
}

variable "vpc_id" {
  description = "VPC ID for open VPN instance and subnet"
  type        = string
}
