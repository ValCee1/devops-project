
# route associations for private subnet
resource "aws_route_table_association" "finance_private_route_association" {
  subnet_id       = aws_subnet.finance_private.id
  route_table_id  = aws_route_table.finance_private.id
 }


#Routing Association for public subnet
resource "aws_route_table_association" "finance_public_route_association" {
  subnet_id       = aws_subnet.finance_public.id #PUBLIC SUBNET
  route_table_id  = aws_route_table.finance_public.id
}

