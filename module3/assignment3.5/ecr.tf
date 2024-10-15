resource "aws_ecr_repository" "ap-cnd-container-14oct" {
  name                  = "ap-cnd-container-14oct"
  image_tag_mutability  = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}