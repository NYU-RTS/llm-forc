
resource "google_cloud_run_v2_service" "socrata-mcp" {
  name                = "socrata-mcp-service"
  location            = "us-central1"
  deletion_protection = false
  ingress             = "INGRESS_TRAFFIC_ALL"


  scaling {
    min_instance_count = 0
    max_instance_count = 1
  }

  template {
    containers {
      image = "ghcr.io/nyu-rts/socrata-mcp-server"
      ports {
        container_port = 8000
      }
    }
  }
}
