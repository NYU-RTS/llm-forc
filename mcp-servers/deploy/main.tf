# Runtime identity for the container.
resource "google_service_account" "cloud_run_runtime" {
  account_id   = "sa-cloud-run-runtime"
  display_name = "Runtime identity for the socrata-mcp Cloud Run service"
}

# Publicly reachable, unauthenticated at the Cloud Run layer: the only
# caller is expected to be an MCP gateway that handles auth and rate
# limiting upstream. Disabling the invoker IAM check is Google's
# recommended way to do this: https://docs.cloud.google.com/run/docs/authenticating/public
resource "google_cloud_run_v2_service" "socrata_mcp" {
  name                 = "socrata-mcp-service"
  location             = "us-central1"
  deletion_protection  = false
  ingress              = "INGRESS_TRAFFIC_ALL"
  invoker_iam_disabled = true

  scaling {
    min_instance_count = 0
    max_instance_count = 1
  }

  template {
    service_account = google_service_account.cloud_run_runtime.email

    containers {
      image = "ghcr.io/nyu-rts/socrata-mcp-server:sha-a896f040a4de976e86a6a70abf8dd9ca5630b314"
      ports {
        container_port = 8000
      }
    }
  }
}
