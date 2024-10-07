resource "vault_aws_secret_backend" "aws" {
  access_key = aws_iam_access_key.vault_root.id
  secret_key = aws_iam_access_key.vault_root.secret
  region = "ap-southeast-1"
  path = "aws-iam-admin" #aws secret engine custom path name
  default_lease_ttl_seconds =  900
  max_lease_ttl_seconds = 2000
}

resource "vault_aws_secret_backend_role" "role" {
  backend = vault_aws_secret_backend.aws.path
  name    = "admin-role"
  credential_type = "iam_user"

  policy_arns = ["arn:aws:iam::aws:policy/AdministratorAccess"] #this policy refer to later vault create iam user will get this policy
}

data "vault_aws_access_credentials" "creds" {  #to read aws dynamic credential role and create a iam user
  backend = vault_aws_secret_backend.aws.path
  role    = vault_aws_secret_backend_role.role.name
}