data "terraform_remote_state" "vault_admin" {
  backend = "remote"

  config = {
    organization = "hellocloud-zk-tfc-org"
    workspaces = {
      name = "aws-iam-creation"
    }
  }
}


