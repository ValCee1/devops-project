#This allows connectivity from private instances to public instance, with the public instance as the customer gateway
resource "aws_customer_gateway" "devops_training_customer_gateway" {
  bgp_asn    = 65000
  ip_address = aws_instance.devops_training_public.public_ip
  type       = "ipsec.1"

  tags = {
    Name = "AWS Customer Gateway"
  }
}

#Virtual Private Gateway creation and attachment to AWS VPC; Route propagation enabled
resource "aws_vpn_gateway" "devops_training_vpn_gw" {
  vpc_id = aws_vpc.devops_training_vpc.id

  tags = {
    Name = "Devops Training Virtual Private Gateway"
  }
}

#Attach the vpc to the vpn gateway
resource "aws_vpn_gateway_attachment" "devops_training_gateway_attachment" {
  vpc_id         = aws_vpc.devops_training_vpc.id
  vpn_gateway_id = aws_vpn_gateway.devops_training_vpn_gw.id
}

#Attach the route table to the vpn
resource "aws_vpn_gateway_route_propagation" "devops_training_route_propagation" {
  vpn_gateway_id = aws_vpn_gateway.devops_training_vpn_gw.id
  route_table_id = aws_route_table.devops_training_privateRoute.id  #Should I use public or private route?
}

#Creation of site to site VPN in AWS using the AWS Virtual Private Gateway, the Customer Gateway of the on-premise router/firewall, and a predefined pre-shared key for the tunnel
resource "aws_vpn_connection" "devops_training_vpn" {
  vpn_gateway_id      = aws_vpn_gateway.devops_training_vpn_gw.id
  customer_gateway_id = aws_customer_gateway.devops_training_customer_gateway.id
  type                = "ipsec.1"
  static_routes_only  = true
  tunnel1_preshared_key = aws_key_pair.devops_training_key.key_name
}

#create static route to the on-premise network on the AWS VPN side
resource "aws_vpn_connection_route" "onpremNetwork" {
  destination_cidr_block = "10.0.0.0/16"
  vpn_connection_id      = aws_vpn_connection.devops_training_vpn.id
}

output "Private_Instance_Private_IP" {
    value = aws_instance.devops_training_private.private_ip
}
output "Private_Instance_Public_IP" {
    value = aws_instance.devops_training_private.public_ip
}
output "Public_Instance_Private_IP" {
    value = aws_instance.devops_training_public.private_ip
}
output "Public_Instance_Public_IP" {
    value = aws_instance.devops_training_public.public_ip
}

#output of Tunnel 1 IP address
output "AWStunnel1IP" {
  value = aws_vpn_connection.devops_training_vpn.tunnel1_address
}

#output of Tunnel 2 IP address
output "AWStunnel2IP" {
  value = aws_vpn_connection.devops_training_vpn.tunnel1_address
}