# ------------------------------------------------------------------------------
# Variables
# ------------------------------------------------------------------------------

variable "environment" {
  type        = string
  default     = ""
  description = "Environment (e.g. `prod`, `dev`, `staging`)."
}

variable "label_order" {
  type        = list(any)
  default     = []
  description = "Label order, e.g. sequence of application name and environment `name`,`environment`,'attribute' [`webserver`,`qa`,`devops`,`public`,] ."
}

variable "name" {
  type        = string
  default     = ""
  description = "Names of the service accounts to create."
}


variable "module_enabled" {
  type        = bool
  default     = false
  description = "Flag to control the service_account_enabled creation."
}

variable "service_account_enabled" {
  type        = bool
  default     = false
  description = "Flag to control the service_account_enabled creation."
}

variable "project_id" {
  type        = string
  default     = ""
  description = "The project in which the resource belongs. If it is not provided, the provider project is used."
}

variable "description" {
  type        = string
  default     = "Managed by clouddrove"
  description = "A text description of the service account."
}

variable "service_account_key_enabled" {
  type        = bool
  default     = true
  description = "Flag to control the service_account_enabled creation."
}

variable "key_algorithm" {
  type        = string
  default     = "KEY_ALG_RSA_2048"
  description = "The algorithm used to generate the key. Possible values: `KEY_ALG_UNSPECIFIED`, `KEY_ALG_RSA_1024`, `KEY_ALG_RSA_2048`"
}

variable "public_key_type" {
  type        = string
  default     = "TYPE_X509_PEM_FILE"
  description = "The output format of the public key requested."
}

variable "private_key_type" {
  type        = string
  default     = "TYPE_GOOGLE_CREDENTIALS_FILE"
  description = "The output format of the private key."
}

variable "public_key_data" {
  type        = string
  default     = null
  description = "Public key data to create a service account key for given service account. The expected format for this field is a base64 encoded X509_PEM and it conflicts with `public_key_type` and `private_key_type`."
}

variable "keepers" {
  type        = map(string)
  default     = null
  description = "Arbitrary map of values that, when changed, will trigger a new key to be generated."
}

variable "google_service_account_iam_binding_enabled" {
  type        = bool
  default     = false
  description = "Flag to control the service_account_enabled creation."
}

variable "members" {
  type        = list(string)
  default     = [""]
  description = "Identities that will be granted the privilege in role."
}

variable "roles" {
  description = "List of roles to be assigned to the service account"
  type        = list(string)
  default     = [""]
}

variable "enable_oidc" {
  description = "Enable or disable the OIDC resources"
  type        = bool
  default     = false
}

variable "wip_pool_id" {
  description = "The ID to use for the pool"
  type        = string
  default     = ""
}

variable "wip_pool_display_name" {
  description = "A display name for the pool. Cannot exceed 32 characters."
  type        = string
  default     = ""
}

variable "wip_provider_id" {
  description = "Workload Identity Pool Provider ID"
  type        = string
  default     = ""
}

variable "wip_service_account" {
  description = "The service account for the workload identity"
  type        = string
  default     = ""
}

variable "organization_name" {
  description = "The name of the GitHub organization"
  type        = string
  default     = ""
}

variable "repository_name" {
  description = "List of repository names to grant access"
  type        = list(string)
  default     = [""]
}

