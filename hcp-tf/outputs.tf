# Outputs file
output "vault_private_endpoint" {
  value =  hcp_vault_cluster.aws_hcp_vault_cluster.vault_private_endpoint_url
}

output "vault_namespace" {
  value =  hcp_vault_cluster.aws_hcp_vault_cluster.namespace
}

output "vault_version" {
  value =  hcp_vault_cluster.aws_hcp_vault_cluster.vault_version
}

# output "role_id" {
#   value = vault_approle_auth_backend_role.tfc_approle.role_id
# }

# output "secret_id" {
#   value = nonsensitive(vault_approle_auth_backend_role_secret_id.tfc_secrect_id.secret_id)
# }

# output "role_path" {
#   value = vault_auth_backend.approle.path
# }