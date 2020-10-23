# Terraform environment with VS Code

## Select Cloud Provider
First you should select the container image in which the CLI is installed.
Open .devcontainer/devcontainer.json and edit the line below.
```
    "args": { "VARIANT": "0.13"}
```

Supported variant are:
- 0.13-slim
- 0.13
- 0.13-gcp
- 0.13-azure
- 0.13-aws

For more detail, see https://hub.docker.com/repository/docker/norseto/dev-terraform

---
## AWS
### Run aws configure
There is any file to keep AWS key nor secret.
So, you should run `aws configure` and configure key and secret. The config will be hold in .devcontainer/credentials/aws directory.

### How to create the remote backend
Next, you should create remote backend.

#### Edit common-config.yaml
Before setting up backend, you should edit `common-config.yaml` and specify the region/bucket-name/locktable-name.

#### Generate Backend
Then cd remote-backend/aws and run:
- terragrunt init
- terragrunt apply

*Do not use terraform directly*.

---
## GCP
*This templates do not create any project*.

### Login with gcloud
There is any file to keep GCP key nor secret.
So, you should run `gcloud auth application-default login` and get key and secret. The config will be hold in .devcontainer/credentials/gcp directory.

#### Edit common-config.yaml
Before setting up backend, you should edit `common-config.yaml` and specify the region/bucket-name/locktable-name.

#### Generate Backend
Then cd remote-backend/gcp and run:
- terragrunt init
- terragrunt apply

*Do not use terraform directly*.

Caution: With this generating backend process, this templates **DO NOT**:
- Generate any ServiceAccount
- Set any ACL to backend storage bucket


---
### Azure
*This templates do not create any subscription, tenant nor resource group*.

### Login with gcloud
There is any file to keep Azure key nor secret.
So, you should run `az login` and get key and secret. The config will be hold in .devcontainer/credentials/azure directory.

#### Edit common-config.yaml
Before setting up backend, you should edit `common-config.yaml` and specify the names of resource group/storage account/storage container.

#### Generate Backend
Then cd remote-backend/azure and run:
- terragrunt init
- terragrunt apply

*Do not use terraform directly*.

Caution: With this generating backend process, this templates **DO NOT**:
- Set any ACL to backend storage bucket


