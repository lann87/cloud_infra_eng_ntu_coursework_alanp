resource "aws_s3_bucket" "alanp_s3_tf_deployment" {
  bucket = "alanp-s3-a3-donotdelete"
  acl = "private" // Set to private to avoid charges

  # Enabled versioning to track version of object in same bucket
  versioning {
    enabled = true
  }

  # Default encryption
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}