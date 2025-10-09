resource "aws_s3_bucket" "my_bucket" {
  bucket = "terraform-bucket-2025-arnav"     
}

resource "aws_s3_bucket_acl" "my_bucket_acl" {
 bucket = aws_s3_bucket.my_bucket.id  # Refers to the above bucket
 acl    = "private"
}