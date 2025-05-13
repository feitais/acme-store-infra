resource "google_sql_database_instance" "main" {
  name             = var.instance_name
  region           = var.region
  database_version = var.version
  settings {
    tier = var.tier
    ip_configuration {
      ipv4_enabled = false
      private_network = var.private_network_id
    }
  }
}

resource "google_sql_database" "dev_db" {
  name     = "development"
  instance = google_sql_database_instance.main.name
}

resource "google_sql_database" "prod_db" {
  name     = "production"
  instance = google_sql_database_instance.main.name
}