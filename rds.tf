resource "aws_db_instance" "mysql_db" {
  allocated_storage    = 20
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = "db.t3.micro"
  db_name              = "movies_db"
  username             = "reefa"
  password             = "reefa$27"
  skip_final_snapshot  = true
  multi_az = true
  db_subnet_group_name = aws_db_subnet_group.mysql_db_subnet_grp.name
  vpc_security_group_ids = [aws_security_group.mysql_server.id]
  backup_retention_period = 1
}

resource "aws_db_subnet_group" "mysql_db_subnet_grp" {
  name       = "mysql-db-grp"
  subnet_ids = [
    data.aws_subnet.data_a.id,
    data.aws_subnet.data_b.id
  ]

  tags = {
    Name = "MySQL DB subnet group"
  }
}
# resource "aws_db_instance" "default" {
#   allocated_storage    = 10
#   engine               = "mysql"
#   engine_version       = "8.0"
#   instance_class       = "db.t3.micro"
#   name                 = "mydb"
#   username             = "reefa"
#   password             = "reefa$123"
#   parameter_group_name = "default.mysql8.0"
#   skip_final_snapshot  = true
# }

# resource "aws_subnet" "db_subnet_grp" {
#   name       = "db-subnet-grp"
#   subnet_ids = [
#     data.aws_subnet.data-a.id,
#     data.aws_subnet.data-b.id
#   ]

#   tags = {
#     Name = "MySQL DB subnet group"
#   }
# }
