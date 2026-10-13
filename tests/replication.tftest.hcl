mock_provider "google" {}
mock_provider "commercetools" {}

variables {
  name             = "test-client"
  scope            = ["view_products:test"]
  service_accounts = { app = "app@test-project.iam.gserviceaccount.com" }
}

run "automatic_replication_by_default" {
  command = plan

  assert {
    condition = (
      google_secret_manager_secret.this.secret_id == "test-client-commercetools" &&
      length(google_secret_manager_secret.this.replication[0].auto) == 1 &&
      length(google_secret_manager_secret.this.replication[0].user_managed) == 0
    )
    error_message = "Omitting replica locations must preserve the existing secret identity and automatic replication."
  }
}

run "restricted_replication" {
  command = plan

  variables {
    secret_replication_locations = ["europe-west4", "europe-west1"]
  }

  assert {
    condition = (
      length(google_secret_manager_secret.this.replication[0].auto) == 0 &&
      toset([for replica in google_secret_manager_secret.this.replication[0].user_managed[0].replicas : replica.location]) == toset(["europe-west4", "europe-west1"])
    )
    error_message = "Configured secrets must store payloads only in the requested regions."
  }
}

run "reject_empty_replica_set" {
  command = plan
  variables { secret_replication_locations = [] }
  expect_failures = [var.secret_replication_locations]
}

run "reject_global_replica" {
  command = plan
  variables { secret_replication_locations = ["global"] }
  expect_failures = [var.secret_replication_locations]
}

run "explicit_null_keeps_automatic_replication" {
  command = plan
  variables { secret_replication_locations = null }

  assert {
    condition = (
      length(google_secret_manager_secret.this.replication[0].auto) == 1 &&
      length(google_secret_manager_secret.this.replication[0].user_managed) == 0
    )
    error_message = "Explicit null must preserve automatic replication."
  }
}

run "single_region_replication" {
  command = plan
  variables { secret_replication_locations = ["europe-west4"] }

  assert {
    condition = (
      length(google_secret_manager_secret.this.replication[0].auto) == 0 &&
      toset([for replica in google_secret_manager_secret.this.replication[0].user_managed[0].replicas : replica.location]) == toset(["europe-west4"])
    )
    error_message = "A single requested region must be the only payload replica location."
  }

  assert {
    condition = (
      google_secret_manager_secret_iam_member.this["app"].role == "roles/secretmanager.secretAccessor" &&
      google_secret_manager_secret_iam_member.this["app"].member == "serviceAccount:app@test-project.iam.gserviceaccount.com"
    )
    error_message = "Regional replication must preserve additive service account access."
  }
}
