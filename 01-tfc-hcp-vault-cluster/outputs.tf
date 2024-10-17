# Outputs file
output "vault_private_endpoint" {
  description = "HCP Vault Cluster vault_public_endpoint_url"
  value =  hcp_vault_cluster.aws_hcp_vault_cluster.vault_private_endpoint_url
}

output "vault_namespace" {
  description = "HCP Vault Cluster Namespace"
  value =  hcp_vault_cluster.aws_hcp_vault_cluster.namespace
}

output "vault_version" {
  description = "HCP Vault Cluster vault_version"
  value =  hcp_vault_cluster.aws_hcp_vault_cluster.vault_version
}

output "hvn_id" {
  description = "HCP HVN ID"
  value = hcp_hvn.aws_hcp_vault_hvn
}

output "vault_id" {
  description = "HCP Vault Cluster ID"
  value = hcp_vault_cluster.aws_hcp_vault_cluster.cluster_id
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
