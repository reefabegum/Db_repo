terraform {
  backend "s3" {
    bucket         = "talent-academy-reefa-lab"
    key            = "talent-academy/Db_repo/terraform.tfstates"
    region         = "eu-west-1"
    dynamodb_table = "terraform-lock"
  }
}