# Example: Creating a service account for Cloud Run
resource "google_service_account" "cloudrun_sa" {
  account_id   = "cloudrun-sa"
  display_name = "Cloud Run Service Account"
}

# Grant necessary roles (e.g., cloudsql.client)
resource "google_project_iam_member" "cloudrun_db_access" {
  project = var.gcp_project_id
  role    = "roles/cloudsql.client"
  member  = "serviceAccount:${google_service_account.cloudrun_sa.email}"
}
