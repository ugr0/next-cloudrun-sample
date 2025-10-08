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

variable "github_actions_service_account_email" {
  description = "Service account email used by GitHub Actions"
  type        = string
}
