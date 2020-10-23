# Do not include all of terragrant.hcl because the backend does not exists
# when creating this backend resource itself.

locals {
  common-config = yamldecode(file("${find_in_parent_folders("common-config.yaml")}"))
}

terraform {
  extra_arguments "conditional_vars" {
    commands = [
      "apply",
      "plan",
      "import",
      "push",
      "refresh"
    ]
  }
}

generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
provider "azurerm" {
  version         = "${local.common-config.azure.provider_version}"
  subscription_id = "${local.common-config.azure.default_subscription_id}"
  tenant_id       = "${local.common-config.azure.default_tenant_id}"
  features {}
}
EOF
}

inputs = {
  backend_rgname        = local.common-config.azure.backend_rgname
  backend_acctname      = local.common-config.azure.backend_acctname
  backend_containername = local.common-config.azure.backend_containername
  region                = local.common-config.azure.default_region
}
