# acme-store-infra
IaC for infrastructure for Acme Store

├── environments
│   ├── development
│   │   ├── cloud_run.tf
│   │   └── variables.tf
│   └── production
│       ├── gke.tf
│       ├── kubernetes
│       │   ├── deployments
│       │   │   ├── java_app.yaml
│       │   │   └── python_app.yaml
│       │   ├── secrets
│       │   │   └── db_credentials.yaml
│       │   └── services
│       │       ├── java_app.yaml
│       │       └── python_app.yaml
│       └── variables.tf
├── modules
│   ├── cloudsql
│   │   ├── main.tf
│   │   ├── outputs.tf
│   │   └── variables.tf
│   ├── network
│   │   ├── main.tf
│   │   ├── outputs.tf
│   │   └── variables.tf
│   └── security
│       ├── iam.tf
│       └── secrets.tf
├── provider.tf
├── terraform.tfvars
└── variables.tf

Backend bucket: acme-store-tf-backend

terraform plan -var-file="terraform.tfvars"
terraform apply -var-file="terraform.tfvars"
