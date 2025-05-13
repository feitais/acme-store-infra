output "vpc_id" {
  value = google_compute_network.vpc.id
  description = "The ID of the VPC network"
}

output "dev_subnet_id" {
  value = google_compute_subnetwork.dev.id
  description = "The ID of the development subnet"
}

output "prod_subnet_id" {
  value = google_compute_subnetwork.prod.id
  description = "The ID of the production subnet"
}