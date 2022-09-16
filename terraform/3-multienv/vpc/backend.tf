terraform {
  backend "s3" {
    bucket         = "tfstate-devops-iac-report"
    key            = "terraform/3-multienv/vpc.tfstate"
    region         = "eu-central-1"
    dynamodb_table = "tfstate-locks"
  }
}
