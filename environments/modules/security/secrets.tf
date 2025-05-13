# Example using Secret Manager for Cloud Run:
resource "google_secret_manager_secret" "prod_db_password_secret" {
  secret_id = "prod-db-password"
  replication {
    auto {}
  }
}

resource "google_secret_manager_secret_version" "prod_db_password_version" {
  secret      = google_secret_manager_secret.prod_db_password_secret.id
  secret_data = "your_production_database_password" # In reality, this would be managed securely
}

resource "google_cloud_run_v2_service" "prod_python_app_sa" {
  name     = "prod-python-app-sa"
  location = var.gcp_region
  template {
    containers {
      image = "your-registry/prod-python-image:latest"
      envs = [
        {
          name  = "DATABASE_HOST"
          value = module.cloudsql.private_ip_address
        },
        {
          name  = "DATABASE_NAME"
          value = module.cloudsql.prod_db_name
        },
        {
          name  = "DATABASE_USER"
          value = "prod_db_user"
        },
        {
          name = "DATABASE_PASSWORD"
          value_from {
            secret_key_ref {
              secret = google_secret_manager_secret.prod_db_password_secret.id
              version = "latest"
            }
          }
        },
      ]
    }
  }
  traffic {
    type    = "TRAFFIC_TARGET_ALLOCATION_TYPE_LATEST"
    percent = 100
  }
  service_account = google_service_account.cloudrun_sa.email # Use the service account
  depends_on = [module.gke, module.cloudsql, google_secret_manager_secret_version.prod_db_password_version, google_service_account.cloudrun_sa]
}

resource "google_cloud_run_v2_service" "prod_java_app_sa" {
  name     = "prod-java-app-sa"
  location = var.gcp_region
  template {
    containers {
      image = "your-registry/prod-java-image:latest"
      envs = [
        {
          name  = "DATABASE_HOST"
          value = module.cloudsql.private_ip_address
        },
        {
          name  = "DATABASE_NAME"
          value = module.cloudsql.prod_db_name
        },
        {
          name  = "DATABASE_USER"
          value = "prod_db_user"
        },
        {
          name = "DATABASE_PASSWORD"
          value_from {
            secret_key_ref {
              secret = google_secret_manager_secret.prod_db_password_secret.id
              version = "latest"
            }
          }
        },
      ]
    }
  }
  traffic {
    type    = "TRAFFIC_TARGET_ALLOCATION_TYPE_LATEST"
    percent = 100
  }
  service_account = google_service_account.cloudrun_sa.email # Use the service account
  depends_on = [module.gke, module.cloudsql, google_secret_manager_secret_version.prod_db_password_version, google_service_account.cloudrun_sa]
}