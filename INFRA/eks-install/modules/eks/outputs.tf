output "cluster_endpoint" {
  description = "EKS cluster endpoint"
  value       = aws_eks_cluster.main.endpoint
}

output "cluster_name" {
  description = "EKS cluster name"
  value       = aws_eks_cluster.main.name
}

output "oidc_provider" {
  value       = aws_iam_openid_connect_provider.add_oidc[0].url
  description = "OIDC provider URL for IRSA"
}

