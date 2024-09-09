resource "aws_db_instance" "alanp-rds-asm25" {
  allocated_storage    = 5
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t3.micro"
  db_name              = "alanprdsdb"
  username             = "alanp"
  password             = "password123"
 # parameter_group_name = "default.mysql"
  skip_final_snapshot = "true"


  vpc_security_group_ids = [aws_security_group.rds_sg.id]
  db_subnet_group_name   = aws_db_subnet_group.rds_subnet_group.name
}


