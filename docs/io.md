## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| description | A text description of the service account. | `string` | `"Managed by clouddrove"` | no |
| environment | Environment (e.g. `prod`, `dev`, `staging`). | `string` | `""` | no |
| google\_service\_account\_iam\_binding\_enabled | Flag to control the service\_account\_enabled creation. | `bool` | `false` | no |
| keepers | Arbitrary map of values that, when changed, will trigger a new key to be generated. | `map(string)` | `null` | no |
| key\_algorithm | The algorithm used to generate the key. Possible values: `KEY_ALG_UNSPECIFIED`, `KEY_ALG_RSA_1024`, `KEY_ALG_RSA_2048` | `string` | `"KEY_ALG_RSA_2048"` | no |
| label\_order | Label order, e.g. sequence of application name and environment `name`,`environment`,'attribute' [`webserver`,`qa`,`devops`,`public`,] . | `list(any)` | `[]` | no |
| members | Identities that will be granted the privilege in role. | `list(string)` | <pre>[<br>  ""<br>]</pre> | no |
| module\_enabled | Flag to control the service\_account\_enabled creation. | `bool` | `true` | no |
| name | Names of the service accounts to create. | `string` | `""` | no |
| private\_key\_type | The output format of the private key. | `string` | `"TYPE_GOOGLE_CREDENTIALS_FILE"` | no |
| project\_id | The project in which the resource belongs. If it is not provided, the provider project is used. | `string` | `""` | no |
| public\_key\_data | Public key data to create a service account key for given service account. The expected format for this field is a base64 encoded X509\_PEM and it conflicts with `public_key_type` and `private_key_type`. | `string` | `null` | no |
| public\_key\_type | The output format of the public key requested. | `string` | `"TYPE_X509_PEM_FILE"` | no |
| roles | List of roles to be assigned to the service account | `list(string)` | <pre>[<br>  ""<br>]</pre> | no |
| service\_account\_enabled | Flag to control the service\_account\_enabled creation. | `bool` | `true` | no |
| service\_account\_key\_enabled | Flag to control the service\_account\_enabled creation. | `bool` | `true` | no |

## Outputs

| Name | Description |
|------|-------------|
| email | The e-mail address of the service account. |
| id | The id of the service account. |
| key\_id | The id of the service account key. |
| key\_name | The name of the service account key. |
| name | The fully-qualified name of the service account. |
| private\_key | The private key in JSON format, base64 encoded. |
| public\_key | The public key, base64 encoded. |
| unique\_id | The unique id of the service account. |
