variable "project_id" {
  description = "The ID of the GCP project"
  type        = string
}

variable "region" {
  description = "GCP region"
  type        = string
}

variable "service_name" {
  description = "Name of the Cloud Run service"
  type        = string
}

variable "image" {
  description = "Docker image URI to deploy"
  type        = string
}

variable "environment" {
  description = "Deployment environment (e.g. dev or prod)"
  type        = string
}

variable "github_owner" {
  description = "GitHub owner/org"
  type        = string
}

variable "github_repo" {
  description = "GitHub repository name"
  type        = string
}

variable "github_service_account_id" {
  description = "Service account id (account_id) to create for GitHub Actions (renamed)"
  type        = string
}

variable "workload_identity_pool_id" {
  description = "Workload Identity Pool id"
  type        = string
}

variable "workload_identity_pool_provider_id" {
  description = "Workload Identity Pool Provider id"
  type        = string
}
