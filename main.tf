module "storage" {
  project_id = var.project_id
  source     = "./components/buckets"
}