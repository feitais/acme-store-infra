module "network" {
  source     = "./environments/modules/network"
  network_name = var.network_name
  gcp_region = var.gcp_region
  dev_subnet_cidr = var.dev_subnet_cidr
  prod_subnet_cidr = var.prod_subnet_cidr
}