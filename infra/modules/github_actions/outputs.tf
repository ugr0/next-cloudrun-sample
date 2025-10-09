output "service_account_email" {
  value = google_service_account.github_actions.email
}

output "workload_identity_pool_id" {
  value = google_iam_workload_identity_pool.github_pool.workload_identity_pool_id
}

output "workload_identity_pool_provider_id" {
  value = google_iam_workload_identity_pool_provider.github_provider.workload_identity_pool_provider_id
}
