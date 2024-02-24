output "vpc_id" {
    value = aws_vpc.custom_VPC.id
  }
  
 output "cidr_block" {
    value = aws_vpc.custom_VPC.cidr_block
  }
  
 output "private_subnet_id" {
   value = aws_subnet.custom_private_subnet.id
 }