variable "bucket_name" {
  description = "S3 bucket name"
  type        = string
  default     = "terraform-bucket-2025-arnav"
}

variable "tags" {
  description = "Tags for the S3 bucket"
  type        = map(string)
  default = {
    Name = "terraform-bucket-2025-arnav"
  }
}
