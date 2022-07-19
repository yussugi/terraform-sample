//////////////////
// S3 resources //
//////////////////
variable "name" {

}

resource "aws_s3_bucket" "private" {
  bucket = "private-bucket-20220418-uninosushi"
}

resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.private.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "sse" {
  bucket = aws_s3_bucket.private.id
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }

}

resource "aws_s3_bucket_public_access_block" "private" {
  bucket                  = aws_s3_bucket.private.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket" "alb_log" {
  bucket = "alb-log-pragmatic-terraform-uninosushi"
}

resource "aws_s3_bucket_lifecycle_configuration" "alb_log_life" {
  bucket = aws_s3_bucket.alb_log.id
  rule {
    id = "log"
    expiration {
      days = 90
    }
    status = "Enabled"
  }

}

resource "aws_s3_bucket_policy" "alb_log" {
  bucket = aws_s3_bucket.alb_log.id
  policy = data.aws_iam_policy_document.alb_log.json

}

data "aws_iam_policy_document" "alb_log" {
  statement {
    effect    = "Allow"
    actions   = ["s3:PutObject"]
    resources = ["arn:aws:s3:::${aws_s3_bucket.alb_log.id}/*"]

    principals {
      type        = "AWS"
      identifiers = [data.aws_caller_identity.current.account_id]
    }
  }

}

data "aws_caller_identity" "current" {

}
