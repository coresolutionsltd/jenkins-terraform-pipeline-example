module "backend_bucket" {
  source  = "coresolutions-ltd/s3-bucket/aws"
  version = "~> 0.0.3"

  versioning    = true
  encryption    = true
  force_destroy = true
}

resource "aws_dynamodb_table" "locking_table" {
  name           = "terraform-state-lock"
  hash_key       = "LockID"
  write_capacity = 5
  read_capacity  = 5

  attribute {
    name = "LockID"
    type = "S"
  }
}
