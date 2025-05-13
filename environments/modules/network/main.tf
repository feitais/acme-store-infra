resource "google_compute_network" "vpc" {
  name                    = var.network_name
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "dev" {
  name          = "dev-subnet"
  ip_cidr_range = var.dev_subnet_cidr
  network       = google_compute_network.vpc.id
  region        = var.gcp_region
}

resource "google_compute_subnetwork" "prod" {
  name          = "prod-subnet"
  ip_cidr_range = var.prod_subnet_cidr
  network       = google_compute_network.vpc.id
  region        = var.gcp_region
}