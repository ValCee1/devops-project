#Security Group for department
resource "aws_security_group" "openVPN" {
  vpc_id                 = var.vpc_id
  name                   = "${var.environment}_openVPN_SG"
  description            = "security group for ${var.environment} openVPN"
  revoke_rules_on_delete = true

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "tcp"
    cidr_blocks = [var.ALL_IPs]
    description = "Permit all outbound traffic"
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "TCP"
    cidr_blocks = [var.ALL_IPs]
    description = "Allow SSH access for all IP"
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "-1"
    cidr_blocks = [var.ALL_IPs]
    description = "Allow https access for ALL IP"
    self        = true
  }

  tags = {
    Name        = "openVPN Security Group"
    description = "security group that allows SSH and HTTPS traffics for all hosts"
    Environment = "${var.environment}"
  }

}


