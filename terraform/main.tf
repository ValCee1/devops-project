resource "aws_instance" "devops" {
  ami               = "ami-02ea01341a2884771"
  instance_type     = "t2.micro"
  key_name          = "ansible_euwest3"
  vpc_security_group_ids = ["devops-sg"]
  tags = {
    Name = "devops_training"
  }
  provisioner "local-exec" {
  command = "sleep 120; ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook --private-key /root/keys/ansible_euwest3.pem -i ${aws_instance.devops.public_ip}, ../ansible/playbook.yaml"
}
}

