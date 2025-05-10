output "cluster_endpoint" {
  description = "EKS cluster endpoint"
  value       = module.eks.cluster_endpoint
}

output "cluster_name" {
  description = "EKS cluster name"
  value       = module.eks.cluster_name
}

output "vpc_id" {
  description = "VPC ID"
  value       = module.vpc.vpc_id
}

# output "ebs_enabled" {
#   value = var.enable_ebs_csi
# }

output "oidc_provider_url" {
  description = "OIDC Provider URL for the EKS cluster"
  value       = module.eks.oidc_provider_url
}

output "oidc_provider_arn" {
  description = "OIDC Provider ARN for the EKS cluster"
  value       = module.eks.oidc_provider_arn
}


