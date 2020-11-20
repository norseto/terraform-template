# Do not include all of terragrant.hcl because the backend does not exists
# when creating this backend resource itself.

locals {
  common-config = yamldecode(file("${find_in_parent_folders("common-config.yaml")}"))
}

generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
provider "aws" {
  region  = "${local.common-config.aws.default_region}"
  version = "${local.common-config.aws.provider_version}"
}
EOF
}

inputs = {
  region         = "${local.common-config.aws.default_region}"
  backend_bucket = local.common-config.aws.backend_bucket
  backend_lock   = local.common-config.aws.backend_lock
}
