# Do not include all of terragrant.hcl because the backend does not exists
# when creating this backend resource itself.

locals {
  common-config = yamldecode(file("${find_in_parent_folders("common-config.yaml")}"))
}

terraform {
}

generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
provider "google" {
  version = "${local.common-config.gcp.provider_version}"
  project = "${local.common-config.gcp.project}"
  region  = "${local.common-config.gcp.default_region}"
  zone    = "${local.common-config.gcp.default_zone}"
}
EOF
}

inputs = {
  backend_bucket = local.common-config.gcp.backend_bucket
  region         = local.common-config.gcp.default_region
}
