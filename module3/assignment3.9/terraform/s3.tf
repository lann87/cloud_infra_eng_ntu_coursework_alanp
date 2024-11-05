resource "aws_s3_bucket" "s3-bucket" {
  bucket = "ap-simple-devops-bucket"

  tags = {
    Name        = "28oct-ap-simple-devops-bucket"
    Environment = "dev"
  }
}