terraform {
  backend "gcs" {
    bucket = "acme-store-tf-backend"  
  }
}