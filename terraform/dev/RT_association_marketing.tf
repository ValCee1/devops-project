
# route associations for private subnet
resource "aws_route_table_association" "marketing_private_route_association" {
  subnet_id       = aws_subnet.marketing_private.id
  route_table_id  = aws_route_table.marketing_private.id
 }


#Routing Association for public subnet
resource "aws_route_table_association" "marketing_public_route_association" {
  subnet_id       = aws_subnet.marketing_public.id #PUBLIC SUBNET
  route_table_id  = aws_route_table.marketing_public.id
}

