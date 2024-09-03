# ------------------------------------------------------------------------------
# Output
# ------------------------------------------------------------------------------

output "id" {
  value       = module.service-account[*].id
  description = "The ID of the service-account."
}

output "wip_pool_id" {
  value = module.iam_workload_identity.wip_pool_id
}