# Subnet Group
resource "aws_docdb_subnet_group" "app_db" {
  name       = "${var.db_name}-${var.environment}-subnet-group"
  subnet_ids = var.subnet_ids
  tags = {
    Name        = "${var.db_name}-${var.environment}-subnet-group"
    Environment = var.environment
  }
}
