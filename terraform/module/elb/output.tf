
output "ELB" {
  value = aws_elb.custom-elb.dns_name
}

output "ELB-sg_id" {
  value = aws_security_group.custom-elb.id
}
