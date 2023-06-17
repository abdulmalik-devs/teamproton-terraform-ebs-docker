# Create an Amazon RDS instance
resource "aws_db_instance" "database" {
  engine           = "mysql"
  instance_class   = "db.t2.micro"
  allocated_storage = 10
  storage_type      = "gp2"
  db_name           = var.db_name
  identifier        = "teamdb"
  username          = var.db_username
  password          = "mydbpassword"
  publicly_accessible = false
  skip_final_snapshot  = true

  vpc_security_group_ids = [aws_security_group.db_security_group.id]

  tags = {
    Name = "MyRDSInstance"
  }
}

resource "aws_security_group" "db_security_group" {
  name        = "db_security_group"
  description = "Security group for RDS database"

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
