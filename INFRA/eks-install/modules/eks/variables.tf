variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
}

variable "cluster_version" {
  description = "Kubernetes version"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "subnet_ids" {
  description = "Subnet IDs"
  type        = list(string)
}

variable "node_groups" {
  description = "EKS node group configuration"
  type = map(object({
    instance_types = list(string)
    capacity_type  = string
    scaling_config = object({
      desired_size = number
      max_size     = number
      min_size     = number
    })
  }))
}

# variable "enable_irsa" {
#   description = "Whether to enable IAM Roles for Service Accounts (IRSA)"
#   type        = bool
#   default     = false
# }

# variable "enable_ebs_csi" {
#   type        = bool
#   description = "Whether to deploy the EBS CSI driver addon"
#   default     = true
# }

# variable "ebs_csi_addon_version" {
#   type        = string
#   description = "Version of the aws-ebs-csi-driver addon"
#   default     = "v1.43.0-eksbuild.1"
# }

# variable "ebs_csi_role_name" {
#   type        = string
#   description = "Name of the IAM role for the EBS CSI driver"
#   default     = "ebs-csi-controller-role"
# }

variable "enable_irsa" {
  type        = bool
  description = "Enable IAM Roles for Service Accounts (IRSA)"
  default     = true
}

