resource "aws_key_pair" "devops_training_key" {
  key_name   = "${var.department}_training_key"
  public_key = file(var.PATH_TO_PUBLIC_KEY)
}