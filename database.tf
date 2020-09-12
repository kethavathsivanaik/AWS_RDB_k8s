// DB instance

resource "aws_db_instance" "default" {
  allocated_storage    = 20
  identifier           = "database-instance-wp"
  storage_type         = "gp2"
  engine               = "mysql"
  engine_version       = "5.7.30"
  instance_class       = "db.t2.micro"
  name                 = "mydb"
  username             = "root"
  password             = "sivanaik"
  parameter_group_name = "default.mysql5.7"
  iam_database_authentication_enabled = true
  publicly_accessible = true
  skip_final_snapshot  = true
  tags = {
      Name  = "sql-database"
  }
}

output "DB_Endpoint" {
  value = aws_db_instance.default.endpoint
}
