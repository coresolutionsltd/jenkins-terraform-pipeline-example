terraform {
  backend "s3" {
    region         = "eu-west-1"
    dynamodb_table = "terraform-state-lock"
  }
}

provider "aws" {
  region = "eu-west-1"
}
