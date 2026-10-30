aws_region = "us-east-1"

name_prefix = "jenkins"
vpc_cidr    = "10.0.0.0/16"

public_subnet_cidrs = [
  "10.0.1.0/24",
  "10.0.2.0/24",
  "10.0.3.0/24",
]

private_subnet_cidrs = [
  "10.0.11.0/24",
  "10.0.12.0/24",
  "10.0.13.0/24",
]

availability_zones = [
  "us-east-1a",
  "us-east-1b",
  "us-east-1c",
]

# Replace both example values before running Terraform.
allowed_admin_cidr = "YOUR.PUBLIC.IP/32"
key_name           = "your-existing-key-pair"
instance_type      = "t3.medium"

tags = {
  Environment = "non-prod"
}

eks_name                       = "demo-eks"
kubernetes_version             = "1.37"
eks_cluster_use_public_subnets = false
eks_endpoint_public_access     = false
eks_endpoint_private_access    = true
eks_desired_size               = 2
eks_min_size                   = 1
eks_max_size                   = 3
eks_instance_types             = ["t3.medium"]
eks_capacity_type              = "ON_DEMAND"
