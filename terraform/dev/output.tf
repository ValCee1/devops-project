 output "engineering_private_privateIP" {
   value = aws_instance.engineering_private.private_ip
 }
 output "engineering_private_publicIP" {
   value = aws_instance.engineering_private.public_ip
 }
 output "engineering_public_privateIP" {
   value = aws_instance.engineering_public.private_ip
 }
 output "engineering_public_publicIP" {
   value = aws_instance.engineering_public.public_ip
 }
 output "finance_private_privateIP" {
   value = aws_instance.finance_private.private_ip
 }
 output "marketing_private_privateIP" {
   value = aws_instance.marketing_private.private_ip
 }
