#Routing Table for NAT for custom private subnet

resource "aws_route_table" "peer_owner_eng_mar" {
  vpc_id                        = module.engineering.vpc_id
  depends_on                    = [ aws_vpc_peering_connection.engineering_finance_peer,aws_vpc_peering_connection.engineering_marketing_peer]
  route {
    cidr_block                  = module.marketing.cidr_block
    vpc_peering_connection_id   = aws_vpc_peering_connection.engineering_marketing_peer.id
  }

  tags = {
    Name = "Peer Route Owner"
  }
}

resource "aws_route_table" "peer_accepter_eng_mar" {
  vpc_id                        = module.marketing.vpc_id
  depends_on                    = [ aws_route_table.peer_owner_eng_mar]
  route {
    cidr_block                  = module.engineering.cidr_block
    vpc_peering_connection_id   = aws_vpc_peering_connection.engineering_marketing_peer.id
  }

  tags = {
    Name = "Peer Route Accepter"
  }
}


