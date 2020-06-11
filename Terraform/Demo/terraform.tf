terraform {
    backend "s3" {
        region         = "eu-west-1"
        dynamodb_table = "terraform-state-lock"
        key            = "demo.tfstate"
    }
}

provider "aws" {
    region     = "eu-west-1"
}