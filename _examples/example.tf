# ------------------------------------------------------------------------------
# Provider
# ------------------------------------------------------------------------------

provider "google" {
  project     = var.gcp_project_id
  credentials = var.gcp_credentials
  region      = var.gcp_region
  zone        = var.gcp_zone
}

# ------------------------------------------------------------------------------
# Module
# ------------------------------------------------------------------------------


module "service-account" {
  source = "../"

  name        = "test"
  environment = var.environment
  label_order = var.label_order

  service_account_enabled                    = true
  project_id                                 = "clouddrove-1"
  service_account_key_enabled                = true
  key_algorithm                              = "KEY_ALG_RSA_2048"
  public_key_type                            = "TYPE_X509_PEM_FILE"
  private_key_type                           = "TYPE_GOOGLE_CREDENTIALS_FILE"
  google_service_account_iam_binding_enabled = true
  roles                                      = ["roles/iam.serviceAccountUser", "roles/editor"]
  members                                    = ["user:Example.example@example.com", "user:Example.example@example.com"]
}
