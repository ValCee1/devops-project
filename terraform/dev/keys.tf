resource "aws_key_pair" "devops_training_key" {
    key_name = "devops_training_key"
    public_key = file(var.PATH_TO_PUBLIC_KEY)
}