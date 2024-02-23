#Security Group for devops_training
resource "aws_security_group" "custom_sg" {
  vpc_id                  = aws_vpc.custom_VPC.id
  name                    = "custom_sg"
  description             = "security group for custom dept"
  revoke_rules_on_delete  = true
  depends_on              = [ aws_vpc.custom_VPC ]
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Permit all outbound traffic"
  }

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = "${var.trustedIPs}"
    description = "Allow all access for trusted IP"
    self        = true
  }

  tags = {
    Name        = "${var.department} dept sg"
    description = "security group that allows all inbound traffic for selected hosts"
    Department  = "${var.department}"
  }

}


