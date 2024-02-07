resource "aws_security_group_rule" "devops_training_dev_rules" {
  type        = "ingress"
  from_port   = 80
  to_port     = 80
  protocol    = "tcp"
  security_group_id = aws_security_group.devops_training_sg.id
  source_security_group_id = aws_security_group.devops_training_sg.id

/*source_tags = {
    Application = "web"
  }
  */
}

