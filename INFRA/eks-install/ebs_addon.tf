resource "null_resource" "create_ebs_csi_addon" {
  provisioner "local-exec" {
    command = <<EOT
      echo "Creating EBS CSI add-on for cluster: ${module.eks.cluster_name}"
      aws eks create-addon \
        --cluster-name ${module.eks.cluster_name} \
        --addon-name aws-ebs-csi-driver \
        --addon-version v1.38.1-eksbuild.2 \
        --service-account-role-arn ${aws_iam_role.ebs_csi_controller_sa.arn} \
        --resolve-conflicts OVERWRITE || echo "Add-on may already exist or be degraded"
    EOT
  }

  triggers = {
    always_run = "${timestamp()}"
  }

  depends_on = [
    aws_iam_role.ebs_csi_controller_sa,
    aws_iam_role_policy_attachment.ebs_csi_policy
  ]
}
