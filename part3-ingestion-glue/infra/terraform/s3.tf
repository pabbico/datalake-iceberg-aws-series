# -----------------------------------------------------------------------------
# s3.tf — Data Lake bucket (Bronze / Silver / Gold via prefixes)
# -----------------------------------------------------------------------------

resource "aws_s3_bucket" "data_lake" {
  bucket = var.data_lake_bucket_name

  tags = {
    Name = "${local.name_prefix}-data-lake"
  }
}

resource "aws_s3_bucket_versioning" "data_lake" {
  bucket = aws_s3_bucket.data_lake.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "data_lake" {
  bucket = aws_s3_bucket.data_lake.id
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_public_access_block" "data_lake" {
  bucket                  = aws_s3_bucket.data_lake.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

# Layer "folders" — implemented as zero-byte objects just to make the
# structure visible in the console. Actual data is written here by Glue jobs.
resource "aws_s3_object" "bronze_prefix" {
  bucket  = aws_s3_bucket.data_lake.id
  key     = "bronze/"
  content = ""
}

resource "aws_s3_object" "silver_prefix" {
  bucket  = aws_s3_bucket.data_lake.id
  key     = "silver/"
  content = ""
}

resource "aws_s3_object" "gold_prefix" {
  bucket  = aws_s3_bucket.data_lake.id
  key     = "gold/"
  content = ""
}

# Separate location for raw/unstructured files (logs, JSON, etc.)
resource "aws_s3_object" "raw_unstructured_prefix" {
  bucket  = aws_s3_bucket.data_lake.id
  key     = "raw-unstructured/"
  content = ""
}

output "data_lake_bucket_name" {
  value = aws_s3_bucket.data_lake.bucket
}
