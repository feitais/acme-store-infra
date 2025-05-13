variable "network_name" {
  type = string
  description = "The name of the VPC network"
}

variable "dev_subnet_cidr" {
  type = string
  description = "CIDR range for the development subnet"
}

variable "prod_subnet_cidr" {
  type = string
  description = "CIDR range for the production subnet"
}

variable "gcp_region" {
  type = string
  description = "The GCP region"
}