# ------------------------------------------------------------------------------
# Outputs
# ------------------------------------------------------------------------------

output "workload_identity_pool_id" {
  description = "The ID of the Workload Identity Pool"
  value       = google_iam_workload_identity_pool.github_pool[*].workload_identity_pool_id
}