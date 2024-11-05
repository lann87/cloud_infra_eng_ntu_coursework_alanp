terraform {
  backend "s3" {
    bucket = "sctp-ce7-tfstate"
    key    = "terraform-simple-cicd-action-ap-30oct.tfstate"
    region = "us-east-1"
  }
}

# updates 2