terraform {
  backend "s3" {
    bucket         = "chndevopsbucket"
    key            = "dev/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "chntable"
  }
}

