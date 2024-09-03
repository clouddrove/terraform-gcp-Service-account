# ------------------------------------------------------------------------------
# IAM_Workload_Identity_Pool
# ------------------------------------------------------------------------------

resource "google_iam_workload_identity_pool" "github_pool" {
  count                     = var.enable_oidc ? 1 : 0
  project                   = var.project_id
  workload_identity_pool_id = var.wip_pool_id
  display_name              = var.wip_pool_display_name
  description               = "Identity pool for GitHub deployments"
}

resource "google_iam_workload_identity_pool_provider" "github" {
  count                              = var.enable_oidc ? 1 : 0
  project                            = var.project_id
  workload_identity_pool_id          = google_iam_workload_identity_pool.github_pool[0].workload_identity_pool_id
  workload_identity_pool_provider_id = var.wip_provider_id

  attribute_mapping = {
    "attribute.aud"        = "assertion.aud"
    "google.subject"       = "assertion.sub"
    "attribute.actor"      = "assertion.actor"
    "attribute.repository" = "assertion.repository"
  }

  oidc {
    allowed_audiences = []
    issuer_uri        = "https://token.actions.githubusercontent.com"
  }
}

resource "google_service_account_iam_member" "workload_identity_user" {
  count = var.enable_oidc ? length(var.repository_name) : 0

  service_account_id = "projects/${var.project_id}/serviceAccounts/${var.wip_service_account}"
  role               = "roles/iam.workloadIdentityUser"
  member             = "principalSet://iam.googleapis.com/${google_iam_workload_identity_pool.github_pool[0].name}/attribute.repository/${var.organization_name}/${element(var.repository_name, count.index)}"
}
