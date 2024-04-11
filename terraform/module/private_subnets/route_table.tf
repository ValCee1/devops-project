#Routing Table for NAT for departmental private subnet
resource "aws_route_table" "private" {
  vpc_id = var.vpc_id
  route {
    cidr_block = var.ALL_IPs
    gateway_id = var.gateway_id
  }

  tags = {
    Name        = "${var.department}-private-route"
    Department  = "${var.department}"
    Environment = "${var.environment}"
  }

}
