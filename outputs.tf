output "jenkins_instance_id" {
  description = "ID of the Jenkins EC2 instance."
  value       = module.jenkins_ec2.instance_id
}

output "jenkins_public_ip" {
  description = "Public IPv4 address of the Jenkins instance."
  value       = module.jenkins_ec2.public_ip
}

output "jenkins_url" {
  description = "Jenkins web UI URL. Accessible only from allowed_admin_cidr."
  value       = module.jenkins_ec2.url
}

output "jenkins_initial_admin_password_command" {
  description = "Run this command over SSH on the instance to read the Jenkins setup password."
  value       = module.jenkins_ec2.initial_admin_password_command
}

output "vpc_id" {
  description = "ID of the VPC shared by Jenkins and EKS."
  value       = module.vpc.vpc_id
}

output "vpc_cidr" {
  description = "CIDR block of the VPC."
  value       = aws_vpc.this.cidr_block
}

output "public_subnet_ids" {
  description = "IDs of the three public subnets."
  value       = aws_subnet.public[*].id
}

output "private_subnet_ids" {
  description = "IDs of the three private subnets."
  value       = aws_subnet.private[*].id
}

output "public_route_table_id" {
  description = "ID of the shared public route table."
  value       = aws_route_table.public.id
}

output "private_route_table_id" {
  description = "ID of the shared private route table."
  value       = aws_route_table.private.id
}

output "internet_gateway_id" {
  description = "ID of the internet gateway."
  value       = aws_internet_gateway.this.id
}

output "nat_gateway_id" {
  description = "ID of the NAT gateway."
  value       = aws_nat_gateway.this.id
}

output "nat_eip" {
  description = "Elastic IP address assigned to the NAT gateway."
  value       = aws_eip.nat.public_ip
}

output "security_group_id" {
  description = "ID of the VPC security group."
  value       = aws_security_group.this.id
}

output "cluster_name" {
  description = "Name of the EKS cluster."
  value       = aws_eks_cluster.this.name
}

output "cluster_arn" {
  description = "ARN of the EKS cluster."
  value       = aws_eks_cluster.this.arn
}

output "cluster_endpoint" {
  description = "Kubernetes API server endpoint."
  value       = aws_eks_cluster.this.endpoint
}

output "cluster_certificate_authority_data" {
  description = "Base64-encoded certificate authority data for the Kubernetes cluster."
  value       = aws_eks_cluster.this.certificate_authority[0].data
}

output "node_group_name" {
  description = "Name of the managed node group."
  value       = aws_eks_node_group.this.node_group_name
}

output "cluster_role_arn" {
  description = "ARN of the EKS cluster IAM role."
  value       = aws_iam_role.cluster.arn
}

output "node_role_arn" {
  description = "ARN of the worker node IAM role."
  value       = aws_iam_role.node.arn
}
