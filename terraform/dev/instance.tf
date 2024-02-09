resource "aws_instance" "devops_training_private" {
  ami               = "ami-06e7d9bed6ecdc388"     #data.aws_ami.latest_amazon_linux.id
  instance_type     = "t2.micro"
  availability_zone = data.aws_availability_zones.available.names[0]
  key_name          = aws_key_pair.devops_training_key.key_name
  
#  vpc_security_group_ids = [aws_security_group.devops_training_sg.id]
#  subnet_id = aws_subnet.devops_training_private_subnet.id
  
  network_interface {
    network_interface_id = aws_network_interface.devops_training_private_NIC.id
    device_index         = 0
  }

  root_block_device {
    volume_size = 8
    delete_on_termination = true
  }
/*
provisioner "local-exec" {
  command = "sleep 20; echo ${var.SSH_PORT} >> /etc/ssh/sshd_config;  systemctl restart sshd"
}
*/
  tags = {
    Name = "devops_training_private"
    Environment = "development"
    Application = "db"
    Subnet      = "private"
  }
}  


resource "aws_instance" "devops_training_public" {
  ami               = "ami-06e7d9bed6ecdc388"     #data.aws_ami.latest_amazon_linux.id
  instance_type     = "t2.micro"
  availability_zone = data.aws_availability_zones.available.names[0]
  key_name          = aws_key_pair.devops_training_key.key_name
#  vpc_security_group_ids = [aws_security_group.devops_training_sg.id]
#  subnet_id = aws_subnet.devops_training_public_subnet.id
#  associate_public_ip_address = true
  
  network_interface {
    network_interface_id = aws_network_interface.devops_training_public_NIC.id
    device_index         = 0
  }

  root_block_device {
    volume_size = 8
    delete_on_termination = true
  }

/*
provisioner "local-exec" {
  command = "sleep 20; echo ${var.SSH_PORT} >> /etc/ssh/sshd_config;  systemctl restart sshd"
}
*/

  tags = {
    Name = "devops_training_public"
    Environment = "development"
    Application = "web"
    Subnet      = "public"
  }
}  
