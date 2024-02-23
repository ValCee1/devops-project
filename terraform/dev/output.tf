
output "peering_status_eng_fin" {
    value = aws_vpc_peering_connection.engineering_finance_peer.accept_status
}


output "peering_status_eng_mar" {
    value = aws_vpc_peering_connection.engineering_marketing_peer.accept_status
}