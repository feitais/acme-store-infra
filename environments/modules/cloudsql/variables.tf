variable "instance_name" {
  type = string
  description = "The name of the Cloud SQL instance"
}

variable "region" {
  type = string
  description = "The GCP region"
}

variable "version" {
  type = string
  description = "The database version"
}

variable "tier" {
  type = string
  description = "The tier of the Cloud SQL instance"
}

variable "private_network_id" {
  type = string
  description = "The ID of the private VPC network"
}