gcp_project_id = "acme-store-445401"
#gcp_project_number = "998295577464"
gcp_region = "us-central1"
gcp_zone   = "us-central1-a"

db_name_prefix     = "acme-db"
db_version         = "POSTGRES_15"
db_tier            = "db-f1-micro"
db_private_network = "acme-vpc"

network_name     = "acme-vpc"
dev_subnet_cidr  = "10.1.0.0/24"
prod_subnet_cidr = "10.2.0.0/16"