/**
 * # GCP Remote Backend Creation
 * Edit `common-config.yaml` in the top directory and run terragrunt to create remote backend.
 */
resource "google_storage_bucket" "main" {
  name          = var.backend_bucket
  location      = var.region
  force_destroy = false
  storage_class = "REGIONAL"

  encryption {}
  versioning {
    enabled = true
  }
}
