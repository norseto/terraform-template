# GCP Remote Backend Creation  
Edit `common-config.yaml` in the top directory and run terragrunt to create remote backend.

## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| google | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| backend\_bucket | (Required) Storage bucket name for state. | `string` | n/a | yes |
| region | (Required) The Location of backend bucket. | `string` | n/a | yes |

## Outputs

No output.

