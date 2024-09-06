resource "aws_db_instance" "alanp-rds-asm24" {
  allocated_storage    = 5
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t3.micro"
  db_name              = "alanp-rds-assmn2-4"
  username             = "alanpadmin"
  password             = "password123"
  parameter_group_name = "default.postgres12"
  publicly_accessible  = false
  skip_final_snapshot  = true

  # Optional but useful
  backup_retention_period = 7
  backup_window           = "03:00-06:00"
  maintenance_window      = "Mon:00:00-Mon:03:00"

  vpc_security_group_ids = [aws_security_group.rds_sg.id]
  db_subnet_group_name   = aws_db_subnet_group.rds_subnet_group.name
}


