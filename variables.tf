variable "project_id" {
  description = "Project id"
  type        = string
}

variable "project_number" {
  type = number
}

variable "region" {
  description = "Region"
  type        = string
  default     = "us-central1"
}
