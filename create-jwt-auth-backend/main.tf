#vault_jwt_auth_backend
resource "vault_jwt_auth_backend" "main" {
    description         = "Terraform Dynamic Credential Provider"
    path                = "jwt"
    type                = "jwt"
    oidc_discovery_url  = "https://app.terraform.io"
    bound_issuer        = "https://app.terraform.io"
}

#vault_policy
resource "vault_policy" "main" {
  name = "admin-policy"
  policy = <<EOT
path "auth/*"
{
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}
# Create, update, and delete auth methods
path "sys/auth/*"
{
  capabilities = ["create", "update", "delete", "sudo"]
}
# List auth methods
path "sys/auth"
{
  capabilities = ["read"]
}
# Enable and manage the key/value secrets engine at `secret/` path
# List, create, update, and delete key/value secrets
path "secret/*"
{
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}
# Manage secrets engines
path "sys/mounts/*"
{
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}
# List existing secrets engines.
path "sys/mounts"
{
  capabilities = ["read"]
}
# Manage system backend
path "db/*"
{
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}
# List existing secrets engines.
path "db/"
{
  capabilities = ["read"]
}
path "aws-master-account/" {
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}
path "aws-master-account/*" {
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}
path "sys/policy/*" {
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}
path "sys/policy/" {
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}
path "sys/policies/*" {
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}
path "sys/policies/" {
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}
EOT
}

#Role for JWT backend:
resource "vault_jwt_auth_backend_role" "main" {
  backend         = vault_jwt_auth_backend.main.path
  role_name       = "tfc-admin-role"
  token_policies  = [vault_policy.main.name]
  bound_audiences = ["vault.workload.identity"]
  bound_claims_type = "glob"
  bound_claims = {
    sub = "organization:hellocloud-zk-tfc-org:project:Default Project:workspace:hcp-tf-pj:run_phase:*"
  }
  user_claim = "terraform_full_workspace"
  role_type  = "jwt"
  token_ttl  = 1200
}