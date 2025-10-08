output "cloud_run_url" {
  value = module.nextjs_cloud_run.url
}

output "artifact_registry_repo" {
  value = module.nextjs_cloud_run.repo_name
}
