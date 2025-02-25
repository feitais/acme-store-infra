terraform {
  backend "gcs" {
    prefix = "terraform.tfstate"
  }
}

provider "google" {
  project     = var.project_id
  region      = var.region
  zone        = "us-central1-c"
  credentials = "key.json"
}