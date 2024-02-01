resource "aws_instance" "devops_training" {
  ami               = data.aws_ami.latest_amazon_linux.id
  instance_type     = "t2.micro"
  availability_zone = data.aws_availability_zones.available.names[0]
  key_name          = aws_key_pair.devops_training_key.key_name
  vpc_security_group_ids = ["devops-sg"]

  tags = {
    Name = "devops_training"
  }
}  
