# ------------------------------------------------------------------------------
# Outputs
# ------------------------------------------------------------------------------

output "id" {
  value       = module.service-account[*].id
  description = "The ID of the service-account."
}
