resource "aws_security_group" "mysql_server" {
  name        = "mysql-server-sg"
  description = "Allow connection to the MySQL RDS server"
  vpc_id      = data.aws_vpc.lab_vpc.id

  ingress {
    description      = "Allow port 3306"
    from_port        = 3306
    to_port          = 3306
    protocol         = "tcp"
    # security_groups  = [data.aws_security_group.ec2_server.id]
    cidr_blocks      = ["157.45.138.253/32"]
  }
     ingress {
    description      = "allow port 22"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["157.45.138.253/32"]
  }

   ingress {
    description      = "allow port 80"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["157.45.138.253/32"]
   }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "mysql-server-sg"
  }
}
