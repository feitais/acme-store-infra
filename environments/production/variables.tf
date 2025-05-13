variable "gcp_project_id" {
  type = string
  description = "The ID of your GCP project"
}

variable "gcp_region" {
  type = string
  description = "The GCP region to deploy to"
  default = "us-central1"
}

variable "gcp_zone" {
  type = string
  description = "The GCP zone to deploy to"
  default = "us-central1-a"
}

variable "db_name_prefix" {
  type = string
  description = "Prefix for the Cloud SQL instance name"
  default = "my-app-db"
}

variable "db_version" {
  type = string
  description = "The database version for Cloud SQL"
  default = "POSTGRES_15"
}

variable "db_tier" {
  type = string
  description = "The tier for the Cloud SQL instance"
  default = "db-f1-micro"
}

variable "db_private_network" {
  type = string
  description = "The name of the VPC network for Cloud SQL private IP"
}

variable "network_name" {
  type = string
  description = "The name of the VPC network"
  default = "my-app-vpc"
}

variable "dev_subnet_cidr" {
  type = string
  description = "CIDR range for the development subnet"
  default = "10.1.0.0/24"
}

variable "prod_subnet_cidr" {
  type = string
  description = "CIDR range for the production subnet"
  default = "10.2.0.0/24"
}