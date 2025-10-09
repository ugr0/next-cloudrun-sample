data "google_project" "project" {
  project_id = var.project_id
}

resource "google_service_account" "github_actions" {
  account_id   = var.github_service_account_id
  project      = var.project_id
  display_name = var.sa_display_name
}

# Grant project-level roles to the service account
resource "google_project_iam_member" "sa_roles" {
  for_each = toset(var.sa_roles)
  project  = var.project_id
  role     = each.value
  member   = "serviceAccount:${google_service_account.github_actions.email}"
}

resource "google_iam_workload_identity_pool" "github_pool" {
  project                   = var.project_id
  workload_identity_pool_id  = var.workload_identity_pool_id
  display_name               = var.workload_identity_pool_display_name
}

resource "google_iam_workload_identity_pool_provider" "github_provider" {
  project                               = var.project_id
  workload_identity_pool_id             = google_iam_workload_identity_pool.github_pool.workload_identity_pool_id
  workload_identity_pool_provider_id    = var.workload_identity_pool_provider_id
  display_name                          = var.workload_identity_pool_provider_display_name

  oidc {
    issuer_uri = "https://token.actions.githubusercontent.com"
  }

  attribute_mapping   = var.attribute_mapping
  attribute_condition = var.attribute_condition
}

# Allow the GitHub principal (repository) to impersonate the service account
resource "google_service_account_iam_member" "allow_workload_identity" {
  service_account_id = google_service_account.github_actions.name
  role               = "roles/iam.workloadIdentityUser"
  member             = "principalSet://iam.googleapis.com/projects/${data.google_project.project.number}/locations/global/workloadIdentityPools/${google_iam_workload_identity_pool.github_pool.workload_identity_pool_id}/attribute.repository/${var.github_owner}/${var.github_repo}"
}
