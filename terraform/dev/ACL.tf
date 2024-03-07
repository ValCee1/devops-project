# Engineering private subnet can communicate with Finance and marketing private subnets,
# But Finance and marketing cannot talk to themselves
resource "aws_network_acl" "departmental_acl" {
  vpc_id       = aws_vpc.departmental.id
  subnet_ids   = [aws_subnet.marketing_private.id, aws_subnet.finance_private.id]

  ingress {
    protocol   = "-1"
    rule_no    = 500
    action     = "deny"
    cidr_block = var.ALL_IPs
    from_port  = 0
    to_port    = 0
  }

  ingress {
    protocol   = "-1"
    rule_no    = 100
    action     = "allow"
    cidr_block = lookup(var.engineering_subnets, "private")
    from_port  = 0
    to_port    = 0
  }

  egress {
    protocol   = "-1"
    rule_no    = 101
    action     = "allow"
    cidr_block = lookup(var.engineering_subnets, "private")
    from_port  = 0
    to_port    = 0
  }

  tags = {
    Name = "main"
  }

  depends_on = [ aws_vpc.departmental, aws_subnet.engineering_private, aws_subnet.finance_private, aws_subnet.marketing_private ]
}