
#Security group for AWS ELB
resource "aws_security_group" "custom-elb" {
  vpc_id      = var.vpc_id
  name        = "custom-elb-sg"
  description = "security group for Elastic Load Balancer"

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = var.trustedIPs
    description = "Allow all access for trusted IP"
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [var.ALL_IPs]
    description = "Allow all access for all IP"
  }

  ingress {
    from_port   = var.SSH_PORT
    to_port     = var.SSH_PORT
    protocol    = "tcp"
    cidr_blocks = [var.ALL_IPs]
    description = "Allow all access for trusted IP"
  }
  tags = {
    Name = "custom-elb-sg"
  }
}
