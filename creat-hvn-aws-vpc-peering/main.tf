resource "hcp_aws_network_peering" "hvn_main" {
  hvn_id          = hellocloud-aws-sgp-hvn
  peering_id      = "dev"
  peer_vpc_id     = aws_vpc.peer.id
  peer_account_id = aws_vpc.peer.owner_id
  peer_vpc_region = data.aws_arn.peer.region
}