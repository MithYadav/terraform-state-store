locals {
  common_tags = {
    Environment = var.environment
    Project     = var.project_name
    ManagedBy   = "Terraform"
    CreatedBy   = "GitHub Actions"
  }
}

# ─────────────────────────────────────────
# YOUR APP S3 BUCKET
# Different from state bucket!
# ─────────────────────────────────────────
resource "aws_s3_bucket" "app_bucket" {
  bucket = var.app_bucket_name

  tags = merge(local.common_tags, {
    Name    = var.app_bucket_name
    Purpose = "Application Storage"
  })
}

resource "aws_s3_bucket_versioning" "app_bucket" {
  bucket = aws_s3_bucket.app_bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "app_bucket" {
  bucket = aws_s3_bucket.app_bucket.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_public_access_block" "app_bucket" {
  bucket = aws_s3_bucket.app_bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

# ─────────────────────────────────────────
# YOUR APP DYNAMODB TABLE
# Different from lock table!
# ─────────────────────────────────────────
resource "aws_dynamodb_table" "app_table" {
  name         = var.app_table_name
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "productId"

  attribute {
    name = "productId"
    type = "S"
  }

  point_in_time_recovery {
    enabled = true
  }

  server_side_encryption {
    enabled = true
  }

  tags = merge(local.common_tags, {
    Name    = var.app_table_name
    Purpose = "Application Data Storage"
  })
}
