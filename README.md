# GCP Commercetools client secret Terraform Module

Terraform module to manage a Commercetools client in Google Cloud.

## Secret replication

By default, the secret uses automatic replication. Set the optional
`secret_replication_locations` input to store its payload only in selected regions:

```hcl
secret_replication_locations = ["europe-west4"]
```

Omitting the input or setting it to `null` preserves automatic replication. A
non-empty set selects user-managed replication, with one replica per region.
The secret remains a standard Secret Manager secret, compatible with Cloud Run
secret injection.

Secret replication is immutable. Enabling this option on an existing secret, or
changing its replica locations, requires secret replacement. Review the plan and
coordinate the migration with consumers before applying it. Resource addresses,
outputs and additive service-account IAM grants are unchanged.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
| ---- | ------- |
| <a name="requirement_google"></a> [google](#requirement\_google) | >= 5.15.0 |

## Providers

| Name | Version |
| ---- | ------- |
| <a name="provider_commercetools"></a> [commercetools](#provider\_commercetools) | n/a |
| <a name="provider_google"></a> [google](#provider\_google) | >= 5.15.0 |

## Modules

No modules.

## Resources

| Name | Type |
| ---- | ---- |
| [commercetools_api_client.this](https://registry.terraform.io/providers/labd/commercetools/latest/docs/resources/api_client) | resource |
| [google_secret_manager_secret.this](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/secret_manager_secret) | resource |
| [google_secret_manager_secret_iam_member.this](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/secret_manager_secret_iam_member) | resource |
| [google_secret_manager_secret_version.this](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/secret_manager_secret_version) | resource |

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| <a name="input_labels"></a> [labels](#input\_labels) | Labels to apply to the service | `map(string)` | `{}` | no |
| <a name="input_name"></a> [name](#input\_name) | Name of the secret | `string` | n/a | yes |
| <a name="input_scope"></a> [scope](#input\_scope) | The commercetools scope | `list(string)` | n/a | yes |
| <a name="input_secret_replication_locations"></a> [secret\_replication\_locations](#input\_secret\_replication\_locations) | Secret payload replica regions. Null keeps automatic replication; changing this replaces existing secrets. | `set(string)` | `null` | no |
| <a name="input_service_accounts"></a> [service\_accounts](#input\_service\_accounts) | The service accounts that should have access to the secret | `map(string)` | n/a | yes |

## Outputs

| Name | Description |
| ---- | ----------- |
| <a name="output_client_id"></a> [client\_id](#output\_client\_id) | n/a |
| <a name="output_scope"></a> [scope](#output\_scope) | n/a |
| <a name="output_secret_name"></a> [secret\_name](#output\_secret\_name) | n/a |
<!-- END_TF_DOCS -->