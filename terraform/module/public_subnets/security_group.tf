#Security Group for department
resource "aws_security_group" "public" {
  vpc_id                 = var.vpc_id
  name                   = "${var.environment}_Public_SG"
  description            = "security group for ${var.environment} vpc"
  revoke_rules_on_delete = true

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [var.ALL_IPs]
    description = "Permit all outbound traffic"
  }

  ingress {
    from_port   = var.SSH_PORT
    to_port     = var.SSH_PORT
    protocol    = "tcp"
    cidr_blocks = [var.openVPN_ip]
    description = "Allow SSH access for VPN"
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [var.ALL_IPs]
    description = "Allow Elastic Load Balancer to listen on port 80"
  }

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = [var.ALL_IPs]
    description = "Allow Elastic Load Balancer to listen on port 8080"
  }


  tags = {
    Name        = "PublicSubnet Security Group"
    description = "security group that allows all inbound traffic for selected hosts"
    Environment = "${var.environment}"
  }

}


