# Service Account that will be used
resource "google_service_account" "sa_invoke_cloud_run" {
  account_id   = "sa-invoke-cloud-run"
  display_name = "Service account to invoke cloud-run"
}

# Policy data to grant permissions on Cloud Run instance to SA created above
data "google_iam_policy" "invoker_policy" {
  binding {
    role    = "roles/run.invoker"
    members = ["serviceAccount:${google_service_account.sa_invoke_cloud_run.email}"]
  }
}

# Grant permissions to SA for this Cloud Run instance
resource "google_cloud_run_v2_service_iam_policy" "policy" {
  project     = google_cloud_run_v2_service.socrata_mcp.project
  location    = google_cloud_run_v2_service.socrata_mcp.location
  name        = google_cloud_run_v2_service.socrata_mcp.name
  policy_data = data.google_iam_policy.invoker_policy.policy_data
}

# Cloud Run instance using the SA created above
resource "google_cloud_run_v2_service" "socrata_mcp" {
  name                = "socrata-mcp-service"
  location            = "us-central1"
  deletion_protection = false
  ingress             = "INGRESS_TRAFFIC_ALL"
  service_account     = google_service_account.sa_invoke_cloud_run.email

  scaling {
    min_instance_count = 0
    max_instance_count = 1
  }

  template {
    containers {
      image = "ghcr.io/nyu-rts/socrata-mcp-server:sha-a896f040a4de976e86a6a70abf8dd9ca5630b314"
      ports {
        container_port = 8000
      }
    }
  }
}

# ID token for sa_invoke_cloud_run, scoped to this service's URL.
# Whoever runs `terraform apply` must hold roles/iam.serviceAccountTokenCreator
# on sa_invoke_cloud_run to mint this.
data "google_service_account_id_token" "invoker_token" {
  target_service_account = google_service_account.sa_invoke_cloud_run.email
  target_audience        = google_cloud_run_v2_service.socrata_mcp.uri
}
