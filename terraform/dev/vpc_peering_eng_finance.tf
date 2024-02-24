resource "aws_vpc_peering_connection" "engineering_finance_peer" {
  vpc_id        = module.engineering.vpc_id
  peer_vpc_id   = module.finance.vpc_id
  peer_region   = var.AWS_REGION
  auto_accept   = false
  depends_on    = [module.engineering, module.finance ]
  
  tags = {
    Name        = "Engineering_finance_Peer"
    description = "Peering between Engineering and finance"
  }
}

resource "aws_vpc_peering_connection_accepter" "engineering_finance_peer_accepter" {
  vpc_peering_connection_id = aws_vpc_peering_connection.engineering_finance_peer.id
  depends_on                = [aws_vpc_peering_connection.engineering_finance_peer]
  auto_accept               = true 

  tags = {
    Name                    = "Engineering_finance_Peer_Accepter"
    description             = "Peering Acceptance between Engineering and finance"
  }
}

resource "aws_vpc_peering_connection_options" "engineering_finance_peer_options" {
  vpc_peering_connection_id = aws_vpc_peering_connection.engineering_finance_peer.id
  depends_on                = [aws_vpc_peering_connection.engineering_finance_peer, aws_vpc_peering_connection_accepter.engineering_finance_peer_accepter, module.engineering, module.finance ]
  
  accepter {
    allow_remote_vpc_dns_resolution = true
  }

}

