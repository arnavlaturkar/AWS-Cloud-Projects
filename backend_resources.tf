# Backend resource setup 

# S3 Bucket for Backend use

resource "aws_s3_bucket" "tf_state_bucket" {
  bucket = "terraform-state-bucket-arnav-2025"
  tags = {
    Name = "TerraformStateBucket"
  }
}

resource "aws_s3_bucket_versioning" "tf_state_bucket_versioning" {
  bucket = aws_s3_bucket.tf_state_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

# RDS setup using Dynamodb

resource "aws_dynamodb_table" "tf_state_lock" {
  name         = "terraform-lock-table-arnav"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }
  tags = {
    Name = "TerraformLockTable"
  }
}
