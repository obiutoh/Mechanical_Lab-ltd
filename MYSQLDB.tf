#The RDS Subnet Group

resource "aws_db_instance" "obisubnet_rds" {
  allocated_storage    = 12
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t2.micro"
  name                 = "obisubnet_rds"
  username             = "obi"
  password             = "password1"
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = true
  db_subnet_group_name = aws_db_subnet_group.db-subnet-grp.id
}

# RDS SUBNET GROUP

resource "aws_db_subnet_group" "db-subnet-grp" {
  name       = "db_subnetmain"
  subnet_ids = [aws_subnet.Private-subnet1.id, aws_subnet.Private-subnet2.id]

  tags = {
    Name = "my db subnet-group"
  }
}


# DB Security Group

resource "aws_security_group" "db-security" {
  name        = "db-security"
  description = "Allow http inbound traffic"
  vpc_id      = aws_vpc.MyVPC-MainProject.id

  ingress {
    description      = "http"
    from_port        = 3306
    to_port          = 3306
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
   
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
   
  }

  tags = {
    Name = "http"
  }
}