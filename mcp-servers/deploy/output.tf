output "urls" {
  value = google_cloud_run_v2_service.socrata_mcp.urls
}

output "invoker_id_token" {
  value     = data.google_service_account_id_token.invoker_token.id_token
  sensitive = true
}
