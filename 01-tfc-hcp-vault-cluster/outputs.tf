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
  value = hcp_hvn.aws_hcp_vault_hvn.hvn_id
}

output "vault_id" {
  description = "HCP Vault Cluster ID"
  value = hcp_vault_cluster.aws_hcp_vault_cluster.cluster_id
}

# output "vault_admin_token_id" {
#   description = "HCP Vault Admin Token ID"
#   value = hcp_vault_cluster_admin_token.vault_admin_token.id
# }

# output "vault_admin_token" {
#   description = "HCP Vault Admin Token"
#   value = hcp_vault_cluster_admin_token.vault_admin_token.token
#   sensitive = true
# }

# output "vault_private_endpoint_url" {
#   description = "HCP Vault Cluster vault_public_endpoint_url"
#   value = hcp_vault_cluster.vault_cluster.vault_private_endpoint_url
# }