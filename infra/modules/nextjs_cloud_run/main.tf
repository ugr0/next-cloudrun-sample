# Artifact Registry
resource "google_artifact_registry_repository" "repo" {
  location      = var.region
  repository_id = "${var.service_name}-repo"
  description   = "Artifact Registry for ${var.service_name}"
  format        = "DOCKER"
}

# Cloud Run 用 Service Account
resource "google_service_account" "app" {
  account_id   = "${var.service_name}-sa"
  display_name = "${var.service_name} Service Account"
}

# Cloud Run Service
resource "google_cloud_run_service" "app" {
  name     = var.service_name
  location = var.region

  template {
    spec {
      service_account_name = google_service_account.app.email

      containers {
        image = var.image
        ports {
          container_port = 8080
        }

        env {
          name  = "NEXT_PUBLIC_ENV"
          value = var.environment
        }
      }
    }
  }

  traffic {
    percent         = 100
    latest_revision = true
  }
}

# 公開アクセス許可
resource "google_cloud_run_service_iam_member" "public" {
  service  = google_cloud_run_service.app.name
  location = var.region
  role     = "roles/run.invoker"
  member   = "allUsers"
}
