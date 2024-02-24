
# route associations for private subnet
resource "aws_route_table_association" "peer_owner_RT_association" {
  subnet_id       = module.engineering.private_subnet_id
  route_table_id  = aws_route_table.peer_owner_eng_mar.id
 }

# route associations for private subnet
resource "aws_route_table_association" "peer_accepter_RT_association" {
  subnet_id       = module.marketing.private_subnet_id
  route_table_id  = aws_route_table.peer_accepter_eng_mar.id
 }

