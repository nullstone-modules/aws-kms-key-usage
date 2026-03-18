variable "app_metadata" {
  description = <<EOF
Nullstone automatically injects metadata from the app module into this module through this variable.
This variable is a reserved variable for capabilities.
EOF

  type    = map(string)
  default = {}
}

variable "kms_key_arn" {
  description = "The ARN of the KMS key to grant decrypt and describe access."
  type        = string
}

locals {
  role_name           = var.app_metadata["role_name"]
  execution_role_name = var.app_metadata["execution_role_name"]
}