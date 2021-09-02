resource "aws_db_instance" "tier-db-instance" {
  allocated_storage      = 10
  db_subnet_group_name   = aws_db_subnet_group.default.id
  engine                 = "mysql"
  engine_version         = "5.7"
  instance_class         = "db.t2.micro"
  multi_az               = true
  name                   = "demodb"
  username               = var.db_username
  password               = var.db_password
  skip_final_snapshot    = true
  vpc_security_group_ids = [aws_security_group.web-db-sg.id]
}

resource "aws_db_subnet_group" "default" {
  name       = "tier-db-subnet-group"
  subnet_ids = [aws_subnet.tier-db-subnet-1.id, aws_subnet.tier-db-subnet-2.id]

  tags = {
    Name = "${var.resource_prefix}-DB-SUBNET-GROUP"
  }
}