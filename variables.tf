variable "aws_region" {
  description = "AWS region where the VPC and Jenkins instance will be created."
  type        = string
}

variable "name_prefix" {
  description = "Prefix for the VPC, EC2 instance, and security group names."
  type        = string
}

variable "vpc_cidr" {
  description = "IPv4 CIDR block for the VPC."
  type        = string
}

variable "public_subnet_cidrs" {
  description = "CIDR blocks for the three public subnets."
  type        = list(string)
}

variable "private_subnet_cidrs" {
  description = "CIDR blocks for the three private subnets."
  type        = list(string)
}

variable "availability_zones" {
  description = "Three AWS availability zones for the VPC subnets."
  type        = list(string)
}

variable "allowed_admin_cidr" {
  description = "Trusted IPv4 CIDR allowed to access SSH and the Jenkins web UI, such as your public IP with /32."
  type        = string

  validation {
    condition     = can(cidrnetmask(var.allowed_admin_cidr)) && can(regex("/(2[4-9]|3[0-2])$", var.allowed_admin_cidr))
    error_message = "allowed_admin_cidr must be a valid IPv4 CIDR with a /24 to /32 prefix."
  }
}

variable "instance_type" {
  description = "EC2 instance type for Jenkins. t3.medium provides 4 GiB of memory."
  type        = string
}

variable "key_name" {
  description = "Name of an existing EC2 key pair used for SSH access."
  type        = string
}

variable "tags" {
  description = "Additional tags for resources that support tags."
  type        = map(string)
}

variable "eks_name" {
  description = "Name of the EKS cluster."
  type        = string
}

variable "kubernetes_version" {
  description = "Kubernetes version for the EKS cluster."
  type        = string
}

variable "eks_cluster_use_public_subnets" {
  description = "Whether to include the public subnets in the EKS cluster network configuration. Worker nodes remain in private subnets."
  type        = bool
}

variable "eks_endpoint_public_access" {
  description = "Whether the Kubernetes API endpoint is reachable from the public internet."
  type        = bool
}

variable "eks_endpoint_private_access" {
  description = "Whether the Kubernetes API endpoint is reachable from inside the VPC."
  type        = bool
}

variable "eks_desired_size" {
  description = "Desired number of EKS worker nodes."
  type        = number
}

variable "eks_min_size" {
  description = "Minimum number of EKS worker nodes."
  type        = number
}

variable "eks_max_size" {
  description = "Maximum number of EKS worker nodes."
  type        = number
}

variable "eks_instance_types" {
  description = "EC2 instance types for EKS worker nodes."
  type        = list(string)
}

variable "eks_capacity_type" {
  description = "Capacity type for EKS worker nodes: ON_DEMAND or SPOT."
  type        = string
}
