variable "AWS_SECRET_KEY" {
  type = string
}

variable "AWS_ACCESS_KEY" {
  type = string
}

variable "AWS_REGION" {
  type    = string
}

variable "PATH_TO_PUBLIC_KEY" {
  default = "devops_training_key.pub"
}

variable "SSH_PORT" {}

