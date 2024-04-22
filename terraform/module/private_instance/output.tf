output "instance_id" {
  value = aws_instance.private.id
}

output "azs" {
  value = aws_instance.private.availability_zone
}
