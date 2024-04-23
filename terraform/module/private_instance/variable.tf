variable "ami" {
  description = "Free tier Amazon-linux ami"
  type        = string
  default     = "ami-02ea01341a2884771"
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

variable "instance_type" {
  description = "Free-tier instance type for training purposes"
  type        = string
}

variable "key_name" {
  description = "the name to give my ssh security key"
  type        = string
  default     = ""
}
variable "private_subnet_id" {
  description = "private subnet_id"
  type        = string
}

variable "security_group_ids" {
  description = "Instance security_groups"
  type        = list(string)
}

