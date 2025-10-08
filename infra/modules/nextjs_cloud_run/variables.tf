variable "project_id" {
  type = string
}

variable "region" {
  type    = string
  default = "asia-northeast1"
}

variable "service_name" {
  type = string
}

variable "image" {
  type = string
}

variable "environment" {
  type = string
}

variable "github_actions_service_account_email" {
  type        = string
  description = "Service Account email for GitHub Actions (Workload Identity Federation)"
}
