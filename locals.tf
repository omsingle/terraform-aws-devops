locals {
  project_name = "terraform-project3"

  common_tags = {
    Project     = "terraform-project3"
    ManagedBy   = "Terraform"
    Environment = "dev"
  }
}