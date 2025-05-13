resource "google_storage_bucket" "gcs" {
  name          = "acme-store-tf-backend"
  location      = "us-central1"
}