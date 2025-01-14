# GCP Commercetools client secret Terraform Module

Terraform module to manage a Commercetools client in Google Cloud.
<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_google"></a> [google](#requirement\_google) | >= 5.15.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_commercetools"></a> [commercetools](#provider\_commercetools) | n/a |
| <a name="provider_google"></a> [google](#provider\_google) | >= 5.15.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [commercetools_api_client.this](https://registry.terraform.io/providers/labd/commercetools/latest/docs/resources/api_client) | resource |
| [google_secret_manager_secret.this](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/secret_manager_secret) | resource |
| [google_secret_manager_secret_iam_member.this](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/secret_manager_secret_iam_member) | resource |
| [google_secret_manager_secret_version.this](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/secret_manager_secret_version) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_labels"></a> [labels](#input\_labels) | Labels to apply to the service | `map(string)` | `{}` | no |
| <a name="input_name"></a> [name](#input\_name) | Name of the secret | `string` | n/a | yes |
| <a name="input_scope"></a> [scope](#input\_scope) | The commercetools scope | `list(string)` | n/a | yes |
| <a name="input_service_accounts"></a> [service\_accounts](#input\_service\_accounts) | The service accounts that should have access to the secret | `map(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_client_id"></a> [client\_id](#output\_client\_id) | n/a |
| <a name="output_scope"></a> [scope](#output\_scope) | n/a |
| <a name="output_secret_name"></a> [secret\_name](#output\_secret\_name) | n/a |
<!-- END_TF_DOCS -->