resource "aws_eks_addon" "aws_ebs_csi_driver" {
  count = 1

  cluster_name  = module.eks.cluster_name
  addon_name    = "aws-ebs-csi-driver"
  addon_version = "v1.38.1-eksbuild.2"

  resolve_conflicts_on_create = "OVERWRITE"
  resolve_conflicts_on_update = "OVERWRITE"



  preserve = true

  tags = {
    "eks_addon" = "aws-ebs-csi-driver"
  }
}