# Make the AWS region a reusable variable within the configuration
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
    optional_var_files = [
      "${get_parent_terragrunt_dir()}/variables.tfvars.json",
      "${get_terragrunt_dir()}/../variables.tfvars.json",
      "${get_terragrunt_dir()}/variables.tfvars.json",
    ]
  }
}

#=========================================================
#  Remote Backend. Please Change for your needs.
#=========================================================
# AWS
remote_state {
  backend = "s3"
  config = {
    region         = local.common-config.aws.default_region
    bucket         = local.common-config.aws.backend_bucket
    key            = "${path_relative_to_include()}/terraform.tfstate"
    dynamodb_table = local.common-config.aws.backend_lock
  }
}
#---------------------------------------------------------
# GCP
#remote_state {
#  backend = "gcs"
#  config = {
#    bucket = local.common-config.gcp.backend_bucket
#    prefix = "${path_relative_to_include()}/terraform.tfstate"
#  }
#}
#---------------------------------------------------------
# Azure
#remote_state {
#  backend "azurerm" {
#    resource_group_name  = local.common-config.azure.backend_rgname
#    storage_account_name = local.common-config.azure.backend_acctname
#    container_name       = local.common-config.azure.backend_containername
#    key                  = "${path_relative_to_include()}/terraform.tfstate"
#  }
#}


#=========================================================
#  Provider Generation. Please Change for your needs.
#=========================================================
generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
#---------------------------------------------------------
# AWS
terraform {
  backend "s3" {}
}
provider "aws" {
  region  = "${local.common-config.aws.default_region}"
  version = "${local.common-config.aws.provider_version}"
}
#---------------------------------------------------------
# GCP
#terraform {
#  backend "gcs" {}
#}
#provider "google" {
#  version = "${local.common-config.gcp.provider_version}"
#  project = "${local.common-config.gcp.project}"
#  region  = "${local.common-config.gcp.default_region}"
#  zone    = "${local.common-config.gcp.default_zone}"
#}
#---------------------------------------------------------
# Azure
#terraform {
#  backend "azurerm" {}
#}
#provider "azurerm" {
#  version         = "${local.common-config.azure.provider_version}"
#  subscription_id = "${local.common-config.azure.default_subscription_id}"
#  tenant_id       = "${local.common-config.azure.default_tenant_id}"
#  features {}
#}
EOF
}

#---------------------------------------------------------
#  Common Input Variables. Please Change for your needs.
#---------------------------------------------------------
inputs = {
  global-config = {
    default_region = "${local.common-config.aws.default_region}"
  }
}
