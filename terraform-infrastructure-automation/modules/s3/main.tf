resource "aws_s3_bucket" "my_bucket" {
  bucket = "terraform-bucket-2025-arnav"
}

resource "aws_s3_bucket_public_access_block" "my_bucket_pab" {
  bucket = aws_s3_bucket.my_bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_server_side_encryption_configuration" "encryption" {
  bucket = aws_s3_bucket.tf_state_bucket.id # or .my_bucket for module

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256" # Simple AWS managed encryption
    }
  }
}
