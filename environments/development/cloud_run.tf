resource "google_cloud_run_v2_service" "python_app" {
  name     = "dev-python-app"
  location = var.gcp_region
  template {
    containers {
      image = "python:3.9-slim-buster" # Replace with your container image
      #envs = [
      #  {
      #    name  = "DATABASE_HOST"
      #    value = module.cloudsql.private_ip_address
      #  },
      #  {
      #    name  = "DATABASE_NAME"
      #    value = module.cloudsql.dev_db_name
      #  },
      #  {
      #    name  = "DATABASE_USER"
      #    value = "dev_db_user" # Consider using Secret Manager
      #  },
      #  {
      #    name  = "DATABASE_PASSWORD"
      #    value = "dev_db_password" # Use Secret Manager
      #  },
      #]
    }
  }
  traffic {
    type    = "TRAFFIC_TARGET_ALLOCATION_TYPE_LATEST"
    percent = 100
  }
  depends_on = [module.cloudsql]
}

resource "google_cloud_run_v2_service" "java_app" {
  name     = "dev-java-app"
  location = var.gcp_region
  template {
    containers {
      image = "openjdk:17-jdk-slim" # Replace with your container image
#      envs = [
#        {
#          name  = "DATABASE_HOST"
#          value = module.cloudsql.private_ip_address
#        },
#        {
#          name  = "DATABASE_NAME"
#          value = module.cloudsql.dev_db_name
#        },
#        {
#          name  = "DATABASE_USER"
#          value = "dev_db_user" # Consider using Secret Manager
#        },
#        {
#          name  = "DATABASE_PASSWORD"
#          value = "dev_db_password" # Use Secret Manager
#        },
#      ]
    }
  }
  traffic {
    type    = "TRAFFIC_TARGET_ALLOCATION_TYPE_LATEST"
    percent = 100
  }
  depends_on = [module.cloudsql]
}

module "network" {
  source = "../../modules/network"
  network_name = var.network_name
  dev_subnet_cidr = var.dev_subnet_cidr
  prod_subnet_cidr = var.prod_subnet_cidr
  gcp_region = var.gcp_region
}

module "cloudsql" {
  source = "../../modules/cloudsql"
  instance_name = "${var.db_name_prefix}-dev"
  region = var.gcp_region
  version = var.db_version
  tier = var.db_tier
  private_network_id = module.network.vpc_id
}