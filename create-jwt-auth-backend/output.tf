output "admin_rolename" {
    value =  vault_jwt_auth_backend_role.main.role_name
    description = "ADMIN ROLE NAME"
}

output "admin_bond_clain" {
    value =  vault_jwt_auth_backend_role.main.bound_claims
    description = "ADMIN BOND CLAIN"
}
