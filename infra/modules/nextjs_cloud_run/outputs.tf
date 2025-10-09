output "url" {
  description = "Deployed Cloud Run service URL"
  value       = google_cloud_run_service.app.status[0].url
}

output "repo_name" {
  description = "Artifact Registry repository name"
  value       = google_artifact_registry_repository.repo.repository_id
}
