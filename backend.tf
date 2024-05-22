# backend.tf
terraform {
  backend "s3" {
    bucket         = "terraform-test-bhardwaj"
    key            = "bhardwaj/terraform/terraform.tfstate"
    region         = "us-east-1"
    shared_credentials_file = "~/.aws/credentials"
    encrypt        = true
  }
}
