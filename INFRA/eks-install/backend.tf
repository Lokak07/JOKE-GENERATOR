terraform {
  backend "s3" {
    bucket         = "shakthi-tf-bucket"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "Lock-Files-shakthi"
    encrypt        = true
  }
}