resource "commercetools_api_client" "this" {
  name  = var.name
  scope = var.scope
}

resource "google_secret_manager_secret" "this" {
  secret_id = "${var.name}-commercetools"
  labels    = var.labels

  replication {
    dynamic "auto" {
      for_each = var.secret_replication_locations == null ? [1] : []
      content {}
    }

    dynamic "user_managed" {
      for_each = var.secret_replication_locations == null ? [] : [var.secret_replication_locations]
      content {
        dynamic "replicas" {
          for_each = user_managed.value
          content {
            location = replicas.value
          }
        }
      }
    }
  }
}

resource "google_secret_manager_secret_version" "this" {
  secret      = google_secret_manager_secret.this.id
  secret_data = commercetools_api_client.this.secret
}

resource "google_secret_manager_secret_iam_member" "this" {
  for_each = var.service_accounts

  secret_id = google_secret_manager_secret.this.id
  role      = "roles/secretmanager.secretAccessor"
  member    = "serviceAccount:${each.value}"
}
