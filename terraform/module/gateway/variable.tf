variable "department" {
  description = "Department of deployment"
  type        = string
  default     = "general"
}

variable "environment" {
  description = "Current deployment environment"
  type        = string
}

variable "vpc_id" {
  description = "ID of the chosen vpc"
  type        = string
}
