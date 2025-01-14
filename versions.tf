terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 5.15.0"
    }
    commercetools = {
      source = "labd/commercetools"
    }
  }
}
