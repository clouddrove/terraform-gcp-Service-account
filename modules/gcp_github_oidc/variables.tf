# ------------------------------------------------------------------------------
# Variables
# ------------------------------------------------------------------------------

variable "project_id" {
  type        = string
  default     = null
  description = "(Optional) The ID of the project in which the resource belongs. If it is not set, the provider project is used."
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

variable "enable_oidc" {
  description = "Enable or disable the OIDC resources"
  type        = bool
  default     = false
}