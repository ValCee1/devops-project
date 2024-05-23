
# DocumentDB Cluster Instance
resource "aws_docdb_cluster_instance" "app_db" {
  identifier         = "${var.db_name}-${var.environment}"
  cluster_identifier = aws_docdb_cluster.app_db.id
  instance_class     = var.docdb_instance_class
  tags = {
    Name        = "${var.db_name}-${var.environment}"
    Environment = var.environment
  }
}

