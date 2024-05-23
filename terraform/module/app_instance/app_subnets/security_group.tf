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
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = var.trustedIPs
    description = "Allow all access for trusted IP"
    self        = true
  }


  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [var.ALL_IPs]
    description = "Allow HTTP access for all IP"
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = [var.ALL_IPs]
    description = "Allow https access for trusted IP"
  }

  tags = {
    Name        = "Public App Security Group"
    description = "security group that allows all inbound traffic for HTTP"
  }

}


