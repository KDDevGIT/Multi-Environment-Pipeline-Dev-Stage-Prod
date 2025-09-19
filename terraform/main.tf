locals {
    name_prefix = "${var.env_name}"
}

# S3 Bucket Per Environment
resource "aws_s3_bucket" "app" {
  bucket = "${local.name_prefix}-bucket"
  tags = var.tags
}

