output "cluster_name" {
  description = "The name of the EKS Cluster"
  value       = module.eks.cluster_name
}

output "cluster_endpoint" {
  description = "Endpoint of the EKS API server"
  value       = module.eks.cluster_endpoint
}

output "cluster_platform_version" {
  description = "Platform version of the cluster"
  value       = module.eks.cluster_platform_version
}

output "cluster_status" {
  description = "Status of the EKS cluster. One of `CREATING`, `DELETING`, `FAILED` "
  value       = module.eks.cluster_status
}

# Kubectl Configuration
output "configure_kubectl" {
  description = "Configure kubectl: make sure you're logged in with the correct AWS profile and run the following command to update your kubeconfig"
  value       = "aws eks update-kubeconfig --name ${module.eks.cluster_name} --region ${var.aws_region}"
}

output "ecr_repo_url" {
  description = "ECR REPO URL "
  value       = module.ecr.repository_url
}

output "ecr_repo_name" {
  description = "ecr repository"
  value       = module.ecr.repository_registry_id
}