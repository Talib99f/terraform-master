variable "name_prefix" {
  description = "Prefix used to name the EC2 instance and security group."
  type        = string
}

variable "vpc_id" {
  description = "ID of the VPC where the Jenkins instance will run."
  type        = string
}

variable "subnet_id" {
  description = "ID of a public subnet for the Jenkins instance."
  type        = string
}

variable "allowed_admin_cidr" {
  description = "Trusted IPv4 CIDR allowed to access SSH and the Jenkins web UI."
  type        = string

  validation {
    condition     = can(cidrnetmask(var.allowed_admin_cidr)) && can(regex("/(2[4-9]|3[0-2])$", var.allowed_admin_cidr))
    error_message = "allowed_admin_cidr must be a valid IPv4 CIDR with a /24 to /32 prefix."
  }
}

variable "instance_type" {
  description = "EC2 instance type for Jenkins."
  type        = string
  default     = "t3.medium"
}

variable "key_name" {
  description = "Name of an existing EC2 key pair for SSH access."
  type        = string
}

variable "tags" {
  description = "Additional tags for resources that support tags."
  type        = map(string)
  default     = {}
}
