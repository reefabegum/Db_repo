data "aws_vpc" "lab_vpc"{
    filter {
        name = "tag:Name"
        values = ["lab_vpc"]
    }
}
data "aws_subnet" "data_a" {
  filter {
    name   = "tag:Name"
    values = ["data-a"]
  }
}

data "aws_subnet" "data_b" {
  filter {
    name   = "tag:Name"
    values = ["data-b"]
  }
}

data "aws_security_group" "ec2_server" {
  filter {
    name   = "tag:Name"
    values = ["ansible-server"]
  }
}
