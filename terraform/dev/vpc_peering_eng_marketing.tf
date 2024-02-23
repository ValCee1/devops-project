resource "aws_vpc_peering_connection" "engineering_marketing_peer" {
  vpc_id        = module.engineering.vpc_id
  peer_vpc_id   = module.marketing.vpc_id
  peer_region   = var.AWS_REGION
  auto_accept   = false
  depends_on    = [ module.engineering, module.marketing ]
  
  tags = {
    Name        = "Engineering_Marketing_Peer"
    description = "Peering between Engineering and Marketing"
  }
}

resource "aws_vpc_peering_connection_accepter" "engineering_marketing_peer_accepter" {
  vpc_peering_connection_id = aws_vpc_peering_connection.engineering_marketing_peer.id
  auto_accept               = true
  depends_on    = [aws_vpc_peering_connection.engineering_marketing_peer, module.engineering, module.marketing ]
}

resource "aws_vpc_peering_connection_options" "engineering_marketing_peer_options" {
  vpc_peering_connection_id = aws_vpc_peering_connection.engineering_marketing_peer.id
  depends_on    = [aws_vpc_peering_connection.engineering_marketing_peer, aws_vpc_peering_connection_accepter.engineering_marketing_peer_accepter, module.engineering, module.marketing ]
  
  accepter {
    allow_remote_vpc_dns_resolution = true
  }

}

