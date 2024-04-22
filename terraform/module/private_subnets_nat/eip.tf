resource "aws_eip" "private" {
  domain = "vpc"
  vpc    = true
}
