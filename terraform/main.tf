locals {
    name_prefix = "${var.env_name}"
}

# S3 Bucket Per Environment
resource "aws_s3_bucket" "app" {
  bucket = "${local.name_prefix}-bucket"
  tags = var.tags
}

# Versioning and Prod-Only Replication
resource "aws_s3_bucket_versioning" "app" {
  bucket = aws_s3_bucket.app.id 
  versioning_configuration {
    status = "Enabled"
  }
}

# When Replication = True
resource "aws_s3_account_public_access_block" "app" {
  block_public_acls = true 
  block_public_policy = true 
  restrict_public_buckets = true 
  ignore_public_acls = true 
}
