variable "gcp_region" {
  type = string
  description = "The GCP region to deploy to"
}

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

variable "db_name_prefix" {
  type = string
  description = "Prefix for the Cloud SQL instance name"
}

variable "db_version" {
  type = string
  description = "The database version for Cloud SQL"
}

variable "db_tier" {
  type = string
  description = "The tier for the Cloud SQL instance"
}