#Security Group for devops_training
resource "aws_security_group" "devops_training_sg" {
  vpc_id      = aws_vpc.devops_training_vpc.id
  name        = "devops_training_sg"
  description = "security group that allows ssh connection for and from terraform with Nwanze"

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  tags = {
    Name = "devops_training_sg"
    description = "security group that allows ssh connection for and from terraform"
  }
 
}

