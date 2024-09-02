# ------------------------------------------------------------------------------
# Provider
# ------------------------------------------------------------------------------

provider "google" {
  project = var.gcp_project_id
  region  = var.gcp_region
  zone    = var.gcp_zone
}

# ------------------------------------------------------------------------------
# Module
# ------------------------------------------------------------------------------

module "service-account" {
  source = "../../"

  name        = "test-env"
  environment = var.environment
  label_order = var.label_order

  service_account_enabled                    = true
  project_id                                 = "clouddrove-1"
  service_account_key_enabled                = false
  key_algorithm                              = "KEY_ALG_RSA_2048"
  public_key_type                            = "TYPE_X509_PEM_FILE"
  private_key_type                           = "TYPE_GOOGLE_CREDENTIALS_FILE"
  google_service_account_iam_binding_enabled = true
  roles                                      = ["roles/iam.serviceAccountUser", "roles/editor"]
  members                                    = ["user:Example.example@example.com", "user:Example.example@example.com"]
}

module "iam_workload_identity" {
  source = "../../modules/gcp_github_oidc"

  project_id            = "clouddrove-1"
  wip_pool_id           = "wip-pool"
  wip_pool_display_name = "GitHub Workload Identity Pool"
  wip_provider_id       = "wip-provider"
  wip_service_account   = module.service-account.email
  organization_name     = "my-github-org"
  repository_name       = ["example1/example", "example2/example"]
} 