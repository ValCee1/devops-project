
# route associations for private subnet
resource "aws_route_table_association" "engineering_private_route_association" {
  subnet_id       = aws_subnet.engineering_private.id
  route_table_id  = aws_route_table.engineering_private.id
 }


#Routing Association for public subnet
resource "aws_route_table_association" "engineering_public_route_association" {
  subnet_id       = aws_subnet.engineering_public.id #PUBLIC SUBNET
  route_table_id  = aws_route_table.engineering_public.id
}

