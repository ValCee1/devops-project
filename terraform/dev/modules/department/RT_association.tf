/*
# route associations for private subnet
resource "aws_route_table_association" "custom_route_table" {
  subnet_id       = aws_subnet.custom_private_subnet.id
  route_table_id  = aws_route_table.custom_privateRoute.id
 }
*/

#Routing Association for public subnet
resource "aws_route_table_association" "custom_public_route" {
  subnet_id       = aws_subnet.custom_public_subnet.id #PUBLIC SUBNET
  route_table_id  = aws_route_table.custom_publicRoute.id
}

