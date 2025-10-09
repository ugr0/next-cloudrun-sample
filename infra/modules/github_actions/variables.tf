variable "project_id" {
  description = "GCP project id to create resources in"
  type        = string
}

variable "github_service_account_id" {
  description = "Service account account_id (local part) to create for GitHub Actions"
  type        = string
}

variable "sa_display_name" {
  description = "Display name for the service account"
  type        = string
  default     = "GitHub Actions Service Account"
}

variable "sa_roles" {
  description = "List of project-level roles to bind to the service account"
  type        = list(string)
  default     = ["roles/run.admin", "roles/artifactregistry.writer", "roles/iam.serviceAccountUser"]
}

variable "workload_identity_pool_id" {
  description = "ID for the Workload Identity Pool"
  type        = string
}

variable "workload_identity_pool_display_name" {
  description = "Display name for the Workload Identity Pool"
  type        = string
  default     = "GitHub Actions Pool"
}

variable "workload_identity_pool_provider_id" {
  description = "ID for the Workload Identity Pool Provider"
  type        = string
}

variable "workload_identity_pool_provider_display_name" {
  description = "Display name for the provider"
  type        = string
  default     = "GitHub Provider"
}

variable "attribute_mapping" {
  description = "Attribute mapping for the OIDC provider"
  type        = map(string)
  default     = {
    "google.subject"    = "assertion.sub"
    "attribute.actor"   = "assertion.actor"
    "attribute.repository" = "assertion.repository"
  }
}

variable "attribute_condition" {
  description = "Condition for the attribute mapping"
  type        = string
}

variable "github_owner" {
  description = "GitHub owner or org"
  type        = string
}

variable "github_repo" {
  description = "GitHub repository name"
  type        = string
}
