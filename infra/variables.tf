variable "project_id" {
  description = "GCP project ID"
  type        = string
}

variable "region" {
  description = "Deployment region (e.g. asia-northeast1)"
  type        = string
  default     = "asia-northeast1"
}

variable "service_name" {
  description = "Cloud Run service name"
  type        = string
}

variable "image" {
  description = "Docker image for Cloud Run"
  type        = string
}

variable "environment" {
  description = "Environment name (e.g. development, production)"
  type        = string
}

variable "github_actions_service_account_email" {
  description = "Service Account email used by GitHub Actions via Workload Identity Federation"
  type        = string
}
