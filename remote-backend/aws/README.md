# AWS Remote Backend Creation  
Edit `common-config.yaml` in the top directory and run terragrunt to create remote backend.

## Requirements

| Name | Version |
|------|---------|
| aws | ~> 3.10.0 |

## Providers

| Name | Version |
|------|---------|
| aws | ~> 3.10.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| backend\_bucket | (Required) S3 bucket name for state. | `string` | n/a | yes |
| backend\_lock | (Required) Lock table name for state. | `string` | n/a | yes |

## Outputs

No output.

