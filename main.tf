module "labels" {
  source  = "clouddrove/labels/gcp"
  version = "1.0.0"

  name        = var.name
  environment = var.environment
  label_order = var.label_order
}
# ------------------------------------------------------------------------------
# resource_to_create_service_account
# ------------------------------------------------------------------------------

resource "google_service_account" "default" {
  count = var.service_account_enabled && var.module_enabled ? 1 : 0

  account_id   = module.labels.id
  display_name = module.labels.id
  description  = var.description
  project      = var.project_id
}
# ------------------------------------------------------------------------------
# resource_to_create_service_account_key
# ------------------------------------------------------------------------------

resource "google_service_account_key" "default" {
  count = var.service_account_key_enabled && var.module_enabled ? 1 : 0

  service_account_id = join("", google_service_account.default[*].name)
  key_algorithm      = var.key_algorithm
  public_key_type    = var.public_key_type
  private_key_type   = var.private_key_type
  public_key_data    = var.public_key_data
  keepers            = var.keepers
}
# ------------------------------------------------------------------------------
# resource_to_create_service_account_iam_binding
# ------------------------------------------------------------------------------

resource "google_service_account_iam_binding" "admin-account-iam" {
  count = var.google_service_account_iam_binding_enabled && var.module_enabled ? length(var.roles) : 0


  service_account_id = join("", google_service_account.default[*].name)
  role               = var.roles[count.index]
  members            = var.members
}

# ------------------------------------------------------------------------------
# IAM_Workload_Identity_Pool
# ------------------------------------------------------------------------------

module "iam_workload_identity" {
  source = "./modules/gcp_github_oidc"

  enable_oidc           = var.enable_oidc
  project_id            = var.project_id
  wip_pool_id           = var.wip_pool_id
  wip_pool_display_name = var.wip_pool_display_name
  wip_provider_id       = var.wip_provider_id
  wip_service_account   = var.wip_service_account
  organization_name     = var.organization_name
  repository_name       = var.repository_name
}  