terraform {
  backend "s3" {
    bucket = "sctp-ce7-tfstate"
    key = "terraform-ec2-alanp-a2"
    region = "us-east-1"
  }
}
