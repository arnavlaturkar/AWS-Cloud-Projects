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

resource "aws_s3_bucket_server_side_encryption_configuration" "encryption" {
  bucket = aws_s3_bucket.tf_state_bucket.id # or .my_bucket for module

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256" # Simple AWS managed encryption
    }
  }
}

resource "aws_s3_bucket_public_access_block" "state_bucket" {
  bucket = aws_s3_bucket.my_bucket.id

  block_public_acls   = true
  block_public_policy = true
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
