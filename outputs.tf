output "secret_name" {
  value = google_secret_manager_secret.this.secret_id
  depends_on = [
    google_secret_manager_secret_version.this

  ]
}

output "scope" {
  value = commercetools_api_client.this.scope
}

output "client_id" {
  value = commercetools_api_client.this.id
}

output "secret_version_name" {
  description = "Immutable Secret Manager version resource name; contains no credential value."
  value       = google_secret_manager_secret_version.this.name
}
