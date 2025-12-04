terraform {
  backend "s3" {
    bucket = "s3-terraform-backend"
    key    = "LockID"
    region = "us-east-1"
    encrypt = "true"
    dynamodb_table = "DDB-terraform-lock"
  }
}
