
module "vpc" {
  source = "./modules/vpc"

  vpc_cidr             = var.vpc_cidr
  availability_zones   = var.availability_zones
  private_subnet_cidrs = var.private_subnet_cidrs
  public_subnet_cidrs  = var.public_subnet_cidrs
  cluster_name         = var.cluster_name
}

module "eks" {
  source = "./modules/eks"

  cluster_name    = var.cluster_name
  cluster_version = var.cluster_version
  vpc_id          = module.vpc.vpc_id
  subnet_ids      = module.vpc.private_subnet_ids
  node_groups     = var.node_groups
  enable_irsa     = var.enable_irsa
}

// Configuration for EBS CSI Driver
// This module creates an IAM role for the EBS CSI driver to allow it to
// interact with AWS services. The role is associated with the OIDC provider

module "ebs_csi_irsa" {
  source = "terraform-aws-modules/iam/aws//modules/iam-assumable-role-with-oidc"
  count  = 1

  role_name        = "ebs-csi-controller-role"
  provider_url     = module.eks.oidc_provider
  role_policy_arns = ["arn:aws:iam::aws:policy/service-role/AmazonEBSCSIDriverPolicy"]

  oidc_fully_qualified_subjects = [
    "system:serviceaccount:kube-system:ebs-csi-controller-sa"
  ]
}




resource "aws_eks_addon" "ebs_csi" {
  depends_on = [ module.ebs_csi_irsa ]
  cluster_name             = module.eks.cluster_name
  addon_name               = "aws-ebs-csi-driver"
  addon_version            = "v1.43.0-eksbuild.1"
  service_account_role_arn = module.ebs_csi_irsa[0].iam_role_arn
}
