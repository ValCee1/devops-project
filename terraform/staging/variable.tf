variable "ALL_IPs" {
  description = "IP address CIDR and subnet mask for all IP ranges, without exception"
  type        = string
  default     = "0.0.0.0/0"

}

variable "ami" {
  description = "Free tier Amazon-linux ami"
  type        = string
  default     = "ami-02ea01341a2884771"
}
variable "AWS_SECRET_KEY" {
  description = "chikere-trainee account secret key"
  type        = string
  default     = ""

}
variable "AWS_ACCESS_KEY" {
  description = "chikere-trainee account access key"
  type        = string
  default     = ""

}
variable "AWS_REGION" {
  description = "developer environment region"
  type        = string
  default     = "eu-west-3"
}
variable "ebs_size" {
  description = "The size of the additional ebs size necessary to add"
  type        = string
}
variable "department" {
  description = "The department owning the resource"
  type        = string
}

variable "ebs_type" {
  description = "The size of the additional ebs size necessary to add"
  type        = string
}

variable "environment" {
  description = "Current working environment"
  type        = string
  default     = "development"
}

variable "engineering_subnets" {
  description = "List of cidr blocks for Engineering department"
  type        = map(string)

}
variable "marketing_subnets" {
  description = "List of cidr blocks for Marketing department"
  type        = map(string)

}
variable "finance_subnets" {
  description = "List of cidr blocks for Finance department"
  type        = map(string)
}
variable "iam_usernames" {
  description = "List of usernames to be created using iam role"
  type        = list(string)
}

variable "instance_type" {
  description = "Free-tier instance type for training purposes"
  type        = string
  default     = "t2-micro"
}
variable "key_name" {
  description = "the name to give my ssh security key"
  type        = string
  default     = ""
}
variable "openvpn_ami" {
  description = "ami for subscribed openvpn ami"
  type        = string
}

variable "PATH_TO_PRIVATE_KEY" {
  description = "path to get to my locally generated private-key"
  type        = string
  default     = ""
}
variable "PATH_TO_PUBLIC_KEY" {
  description = "path to get to my locally generated public-key"
  type        = string
  default     = ""
}
variable "SSH_PORT" {
  description = "SSH port in use for the instances. Default is 22"
  type        = number
  default     = 22
}
variable "trustedIPs" {
  description = ""
  type        = list(string)
  default     = [""]
}
variable "vpc_cidr" {
  description = "Custom cidr block for my vpc"
  type        = string
  default     = "10.0.0.0/16"
}
