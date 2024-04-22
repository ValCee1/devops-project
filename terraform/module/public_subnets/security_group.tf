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

  tags = {
    Name        = "PublicSubnet Security Group"
    description = "security group that allows all inbound traffic for selected hosts"
    Department  = "${var.department}"
    Environment = "${var.environment}"
  }

}


