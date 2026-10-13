variable "scope" {
  type        = list(string)
  description = "The commercetools scope"
}


variable "name" {
  type        = string
  description = "Name of the secret"
}


variable "service_accounts" {
  type        = map(string)
  description = "The service accounts that should have access to the secret"
}


variable "labels" {
  description = "Labels to apply to the service"
  type        = map(string)
  default     = {}
}

variable "secret_replication_locations" {
  description = "Secret payload replica regions. Null keeps automatic replication; changing this replaces existing secrets."
  type        = set(string)
  default     = null
}
