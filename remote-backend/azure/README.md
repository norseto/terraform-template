# Azure Remote Backend Creation  
Edit `common-config.yaml` in the top directory and run terragrunt to create remote backend.

## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| azurerm | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| backend\_acctname | (Required) Storage account name for state. | `string` | n/a | yes |
| backend\_containername | (Required) Storage container name for state. | `string` | n/a | yes |
| backend\_rgname | (Required) Storage resource group name for state. | `string` | n/a | yes |
| region | (Required) The Location of backend bucket. | `string` | n/a | yes |

## Outputs

No output.

