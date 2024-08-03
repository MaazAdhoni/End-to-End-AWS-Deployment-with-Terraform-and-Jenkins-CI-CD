resource "aws_s3_bucket" "my-s3-bucket" {
  bucket_prefix = var.bucket_prefix
  tags = var.tags
}

resource "aws_s3_bucket_acl" "example" {
  bucket = aws_s3_bucket.my-s3-bucket.bucket
  acl    = "private"
}

resource "aws_s3_bucket_versioning" "example" {
  bucket = aws_s3_bucket.my-s3-bucket.id
  versioning_configuration {
    status = var.versioning ? "Enabled" : "Suspended"
  }
}
