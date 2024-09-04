terraform {
    backend "s3" {
        bucket = "sctp-ce7-tfstate"
        key = "terraform-ec2-alanp-modules-4sep.tfstate"
        region = "us-east-1"
    }
}