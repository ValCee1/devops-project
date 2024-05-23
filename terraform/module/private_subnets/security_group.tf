#Security Group for private subnet
resource "aws_security_group" "private" {
  vpc_id                 = var.vpc_id
  name                   = "${var.environment}_Private_SG"
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
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [var.vpc_cidr]
    description = "Allow Elastic Load Balancer to listen on port 80"
  }

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = [var.vpc_cidr]
    description = "Allow Elastic Load Balancer to listen on port 8080"
  }

  ingress {
    from_port   = var.SSH_PORT
    to_port     = var.SSH_PORT
    protocol    = "tcp"
    cidr_blocks = [var.openVPN_ip]
    description = "Allow SSH access for VPN"
  }


  ingress {
    from_port   = var.DB_PORT
    to_port     = var.DB_PORT
    protocol    = "tcp"
    cidr_blocks = [var.vpc_cidr]
    description = "Allow access to Database"
  }

  tags = {
    Name        = "Private Subnet Security Group"
    description = "security group that allows communication between Private Instances, ELB, and Database"
    Environment = "${var.environment}"
  }

}


