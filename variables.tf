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