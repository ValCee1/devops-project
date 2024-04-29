# departmental internet Gateway for VPC
# This is the first step to ensure that our instances on this vpc can communicate to
# the outside world using the public ip address

resource "aws_internet_gateway" "general" {
  vpc_id = var.vpc_id

  tags = {
    Name        = "${var.environment}-internet-Gateway"
    description = "NIC for ${var.department} public instance"
    Department  = "${var.department}"
    Environment = "${var.environment}"
  }

}
