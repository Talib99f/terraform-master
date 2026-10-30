
module "eks" {
  source = "../terraform-eks-module"

  name               = var.eks_name
  kubernetes_version = var.kubernetes_version

  cluster_subnet_ids = concat(
    var.eks_cluster_use_public_subnets ? module.vpc.public_subnet_ids : [],
    module.vpc.private_subnet_ids,
  )
  node_subnet_ids = module.vpc.private_subnet_ids

  endpoint_public_access  = var.eks_endpoint_public_access
  endpoint_private_access = var.eks_endpoint_private_access

  desired_size   = var.eks_desired_size
  min_size       = var.eks_min_size
  max_size       = var.eks_max_size
  instance_types = var.eks_instance_types
  capacity_type  = var.eks_capacity_type

  tags = var.tags
}

output "eks_cluster_name" {
  value = module.eks.cluster_name
}
