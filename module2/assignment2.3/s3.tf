resource "aws_s3_bucket" "alanp_s3_tf_deployment" {
  bucket = "alanp-s3-a3-donotdelete"
}

# ACL Config
#resource "aws_s3_bucket_acl" "alanp_s3_tf_acl" {
#  bucket = aws_s3_bucket.alanp_s3_tf_deployment.bucket
#  acl = "private"
#}

# Server side encryption config
resource "aws_s3_bucket_server_side_encryption_configuration" "alanp_s3_tf_encryption" {
  bucket = aws_s3_bucket.alanp_s3_tf_deployment.bucket

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

# Versioning config
resource "aws_s3_bucket_versioning" "alanp_s3_tf_versioning" {
  bucket = aws_s3_bucket.alanp_s3_tf_deployment.id

    # Enabled versioning to track version of object in same bucket
  versioning_configuration {
    status = "Enabled"
  }
}
