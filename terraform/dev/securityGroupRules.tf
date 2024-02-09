resource "aws_security_group_rule" "devops_training_dev_rules" {
  type        = "ingress"
  from_port   = 8
  to_port     = 0
  protocol    = "icmp"
  security_group_id = aws_security_group.devops_training_sg.id
  source_security_group_id = aws_security_group.devops_training_sg.id
  
  

# Still haven't learnt how to use tags to set up security rules
/*source_tags = {
    Application = "web"
  }
  */
}

