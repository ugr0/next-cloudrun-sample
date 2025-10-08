terraform {
  required_version = ">= 1.13.0"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 7.0"
    }
  }
}

provider "google" {
  project = var.project_id
  region  = var.region
}

module "nextjs_cloud_run" {
  source = "./modules/nextjs_cloud_run"

  project_id                           = var.project_id
  region                               = var.region
  service_name                         = var.service_name
  image                                = var.image
  environment                          = var.environment
  github_actions_service_account_email = var.github_actions_service_account_email
}
