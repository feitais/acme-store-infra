resource "google_container_cluster" "cluster" {
  name = "prod-cluster"
  location    = var.gcp_region
  release_channel {
    channel = "STABLE"
  }
  enable_autopilot = true
  
  network    = module.network.vpc_id
  subnetwork = module.network.prod_subnet_id
}

module "network" {
  source = "../../modules/network"
  network_name = var.network_name
  dev_subnet_cidr = var.dev_subnet_cidr
  prod_subnet_cidr = var.prod_subnet_cidr
  gcp_region = var.gcp_region
}

module "cloudsql" {
  source = "../../modules/cloudsql"
  instance_name = var.db_name_prefix
  region = var.gcp_region
  version = var.db_version
  tier = var.db_tier
  private_network_id = module.network.vpc_id
}