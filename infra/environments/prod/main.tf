terraform {
  required_version = ">= 1.13.0"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 7.6"
    }
  }
}

provider "google" {
  project = var.project_id
  region  = var.region
}

module "nextjs_cloud_run" {
  source = "../../modules/nextjs_cloud_run"

  project_id                           = var.project_id
  region                               = var.region
  service_name                         = var.service_name
  image                                = var.image
  environment                          = var.environment
}

module "github_actions" {
  source = "../../modules/github_actions"

  project_id = var.project_id

  github_service_account_id               = var.github_service_account_id
  sa_display_name                         = "GitHub Actions SA"
  sa_roles                                = ["roles/run.admin", "roles/artifactregistry.writer", "roles/iam.serviceAccountUser", "roles/iam.workloadIdentityUser"]

  workload_identity_pool_id               = var.workload_identity_pool_id
  workload_identity_pool_display_name     = "GitHub Actions Pool"
  workload_identity_pool_provider_id      = var.workload_identity_pool_provider_id
  workload_identity_pool_provider_display_name = "GitHub Provider"
  attribute_mapping                        = {
    "google.subject"    = "assertion.sub"
    "attribute.actor"   = "assertion.actor"
    "attribute.repository" = "assertion.repository"
  }
  attribute_condition                     = "attribute.repository_owner=='${var.github_owner}'"

  github_owner = var.github_owner
  github_repo  = var.github_repo
}

output "cloud_run_url" {
  value = module.nextjs_cloud_run.url
}

output "artifact_registry_repo" {
  value = module.nextjs_cloud_run.repo_name
}
