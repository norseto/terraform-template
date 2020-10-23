resource "google_storage_bucket" "main" {
  name          = var.backend_bucket
  location      = var.region
  force_destroy = false
  storage_class = "REGIONAL"

  versioning {
    enabled = true
  }
}
