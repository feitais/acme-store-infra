output "private_ip_address" {
  value = google_sql_database_instance.main.private_ip_address
  description = "The private IP address of the Cloud SQL instance"
}

output "instance_name" {
  value = google_sql_database_instance.main.name
  description = "The name of the Cloud SQL instance"
}

output "dev_db_name" {
  value = google_sql_database.dev_db.name
  description = "The name of the development database"
}

output "prod_db_name" {
  value = google_sql_database.prod_db.name
  description = "The name of the production database"
}