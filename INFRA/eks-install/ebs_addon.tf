resource "aws_eks_addon" "aws_ebs_csi_driver" {
  count = 1

  cluster_name  = module.eks.cluster_name
  addon_name    = "aws-ebs-csi-driver"
  addon_version = "v1.38.1-eksbuild.2"

  resolve_conflicts_on_create = "OVERWRITE"
  resolve_conflicts_on_update = "OVERWRITE"

  service_account_role_arn = aws_iam_role.ebs_csi_controller_sa.arn
  depends_on = [aws_iam_role.ebs_csi_controller_sa,
  aws_iam_role_policy_attachment.ebs_csi_policy]

  preserve = true

  tags = {
    "eks_addon" = "aws-ebs-csi-driver"
  }
}